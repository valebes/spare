use std::{
    os::fd::AsRawFd, sync::{Arc, RwLock}, time::Duration
};

use actix_web::{
    get, post,
    rt::{net::UnixListener, time::sleep},
    web::{self, Bytes},
    HttpRequest, HttpResponse, Responder,
};
use awc::{body::BoxBody, error::PayloadError, Client};
use log::{error, info, warn};
use sqlx::{sqlite, Pool};

use crate::{
    api::{self, invoke::InvokeFunction},
    db::{self, models::Instance},
    execution_environment::firecracker::FirecrackerBuilder,
    orchestrator::{self, global::NeighborNode},
};

/// Error types for the instance
#[derive(Debug)]
pub enum InstanceError {
    ApplicationNotInitialized,
    InstanceCreation,
    VSock,
    VSockCreation,
    Database,
    Timeout,
    Unknown,
}

/// Index endpoint
#[get("/")]
async fn index() -> impl Responder {
    HttpResponse::Ok().body("Server is up and running!\n")
}

/// List all instances in the database
#[get("/list")]
async fn list(db_pool: web::Data<Pool<sqlite::Sqlite>>) -> impl Responder {
    HttpResponse::Ok().json(db::get_list(&db_pool).await.unwrap())
}

/// Get resources available in the system
#[get("/resources")]
async fn resources(orchestrator: web::Data<Arc<orchestrator::Orchestrator>>) -> impl Responder {
    let resources = orchestrator.get_resources();
    HttpResponse::Ok().json(resources)
}

/// Get if the node is in emergency mode
#[get("/emergency")]
async fn emergency(orchestrator: web::Data<Arc<orchestrator::Orchestrator>>) -> impl Responder {
    let in_emergency = orchestrator.in_emergency_area();
    HttpResponse::Ok().json(in_emergency)
}

/// Method to offload the request to a remote node
async fn offload(
    orchestrator: web::Data<Arc<orchestrator::Orchestrator>>,
    data: web::Json<InvokeFunction>,
    req: HttpRequest,
) -> HttpResponse<BoxBody> {
    let cpus = data.vcpus;
    let memory = data.memory;

    // Iterate over the nodes
    warn!("Function must be offloaded");
    for i in 0..orchestrator.number_of_nodes() {
        warn!("Checking node: {}", i);
        match orchestrator.get_remote_nth_node(i) {
            Some(mut node) => {
                // Do not forward request to origin
                if node
                    .address()
                    .contains(req.peer_addr().unwrap().ip().to_string().as_str())
                {
                    continue;
                }

                // Check if resource are available on the remote node
                let client = Client::default();
                let response = client
                    .get(format!("http://{}/resources", node.address()))
                    .send()
                    .await;
                if response.is_ok() {
                    let remote_resources =
                        response.unwrap().json::<api::resources::Resources>().await;
                    if remote_resources.is_err() {
                        // Cannot get resources from remote node, continue
                        continue;
                    }
                    match remote_resources {
                        Ok(remote_resources) => {
                            // Check if resources are available
                            let cpus = remote_resources.cpus.checked_sub(cpus as usize);
                            // Memory is in MB, so multiply by 1024
                            let memory = remote_resources
                                .memory
                                .checked_sub((memory * 1024) as usize);
                            // If resources are available, forward request
                            if cpus.is_some() && memory.is_some() {
                                warn!("Forwarding request to {}", node.address());
                                let body = node.invoke(data.clone()).await;
                                match body {
                                    Ok(body) => {
                                        error!("Successfully forwarded request to {}", node.address());
                                        return HttpResponse::Ok().body(body);
                                    }
                                    Err(_) => {
                                        error!("Failed to forward request to {}", node.address());
                                        continue;
                                    }
                                }
                            }
                        },
                        Err(_) => {
                            // Cannot get resources from remote node, continue
                            continue;
                        }
                    }
                }
            }
            None => break,
        }
        return HttpResponse::InternalServerError().body("Failed to offload request\n");
    }
    return HttpResponse::InternalServerError().body("Insufficient resources\n");
}

/// Method to start a new instance on the node
async fn start_instance(
    firecracker_builder: &web::Data<RwLock<FirecrackerBuilder>>,
    db_pool: &Pool<sqlite::Sqlite>,
    data: &web::Json<InvokeFunction>,
) -> Result<Result<Bytes, PayloadError>, InstanceError> {
    /*
    TODO: START INSTANCE
        1) Create new vm instance (todo: check if it already exists and mantain warm pool)
        2) Start instance
        3) Update instance status
        4) Forward request to instance
        5) Wait for response
        6) Return response
        7) Delete instance
    */
    let builder = firecracker_builder.read().unwrap(); // TODO: Remove lock

    // Create new instance
    let fc_instance = builder
        .new_instance(data.image.clone(), data.vcpus, data.memory)
        .await;

    match fc_instance {
        Ok(mut fc_instance) => {
            info!("Created new instance: {}", fc_instance.get_address());
            // Insert instance in the database
            let mut instance = Instance::new(
                data.function.clone(),
                builder.kernel.clone(),
                data.image.clone(),
                data.vcpus,
                data.memory,
                data.hops,
                fc_instance.get_address().to_string(),
                8084,
            );
            match instance.insert(&db_pool).await {
                Ok(_) => {}
                Err(e) => {
                    error!("Failed to insert instance in the database: {:?}", e);
                    return Err(InstanceError::Database);
                }
            }

            info!("Created new function instance: {}", instance.id);

            // Make sure the vsock socket is ready
            let mut path = fc_instance.get_vsock_path();
            path.push_str("_1234");
            let socket = UnixListener::bind(path);

           if socket.is_err() {
                // If an error occurs, delete the instance and set 'failed' status
                instance.set_status("failed".to_string());
                let _ = instance.update(&db_pool).await;
                let _ = fc_instance.delete().await;
                builder
                    .network
                    .lock()
                    .unwrap()
                    .release(fc_instance.get_address());
                return Err(InstanceError::VSockCreation);
            }
            let socket = socket.unwrap();
            info!("Socket created: {}", socket.as_raw_fd());

            // Start instance
            match fc_instance.start().await {
                Ok(_) => {}
                Err(_) => {
                    // If an error occurs, delete the instance and set 'failed' status
                    instance.set_status("failed".to_string());
                    let _ = instance.update(&db_pool).await;
                    let _ = fc_instance.delete().await;
                    builder
                        .network
                        .lock()
                        .unwrap()
                        .release(fc_instance.get_address());
                    return Err(InstanceError::InstanceCreation);
                }
            }

            info!("Starting instance: {} ip: {}", instance.id, instance.ip);

            let stream = socket.accept().await;
            if stream.is_err() {
                // If an error occurs, delete the instance and set 'failed' status
                instance.set_status("failed".to_string());
                let _ = instance.update(&db_pool).await;
                let _ = fc_instance.delete().await;
                builder
                    .network
                    .lock()
                    .unwrap()
                    .release(fc_instance.get_address());
                return Err(InstanceError::VSock);
            }
            let stream = stream.unwrap();


            let mut buf = [0; 1024];
            match stream.0.readable().await {
                Ok(_) => {}
                Err(_) => {
                    // If an error occurs, delete the instance and set 'failed' status
                    instance.set_status("failed".to_string());
                    let _ = instance.update(&db_pool).await;
                    let _ = fc_instance.delete().await;
                    builder
                        .network
                        .lock()
                        .unwrap()
                        .release(fc_instance.get_address());
                    return Err(InstanceError::VSock);
                }
            }
            match stream.0.try_read(buf.as_mut()) {
                Ok(_) => {}
                Err(_) => {
                    // If an error occurs, delete the instance and set 'failed' status
                    instance.set_status("failed".to_string());
                    let _ = instance.update(&db_pool).await;
                    let _ = fc_instance.delete().await;
                    builder
                        .network
                        .lock()
                        .unwrap()
                        .release(fc_instance.get_address());
                    return Err(InstanceError::VSock);
                }
            }
            let message: std::borrow::Cow<'_, str> = String::from_utf8_lossy(&buf);

            info!("Received message: {}", message);

            // Check if the instance is ready through the vsock socket
            match message.contains("ready") {
                true => {}
                false => {
                    // If an error occurs, delete the instance and set 'failed' status
                    instance.set_status("failed".to_string());
                    let _ = instance.update(&db_pool).await;
                    let _ = fc_instance.delete().await;
                    builder
                        .network
                        .lock()
                        .unwrap()
                        .release(fc_instance.get_address());
                    return Err(InstanceError::VSock);
                }
            }

            // Forward request to instance
            let client = Client::default();

            let max_retries = 100;
            let mut retries = 0;
            let mut res;
            loop {
                if retries > max_retries {
                    instance.set_status("failed".to_string());
                    let _ = instance.update(&db_pool).await;
                    let _ = fc_instance.delete().await;
                    builder
                        .network
                        .lock()
                        .unwrap()
                        .release(fc_instance.get_address());
                    return Err(InstanceError::ApplicationNotInitialized);
                }
                res = client
                    .get(format!("http://{}:{}", instance.ip, instance.port))
                    .send()
                    .await;

                if res.is_ok() {
                    break;
                } else {
                    // Retry after 10ms
                    sleep(Duration::from_millis(10)).await;
                    retries += 1;
                }
            }

            let body = res.unwrap().body().await;

            // Cleanup instance
            builder
            .network
            .lock()
            .unwrap()
            .release(fc_instance.get_address());

            let _ = fc_instance.stop().await;
            let _ = fc_instance.delete().await;
            let _ = instance.set_status("terminated".to_string());
            let _ = instance.update(&db_pool).await;

            Ok(body)
        }
        Err(e) => {
            error!("Failed to create instance: {:?}", e);
            return Err(InstanceError::InstanceCreation);
        }
    }
}

/*
Example API: curl --header "Content-Type: application/json" \
     --request POST \
     --data '{"function":"mandelbrot","image":"/home/ubuntu/.ops/images/nanosvm","vcpus":8,"memory":256, "payload": "test"}' \
     http://localhost:8085/invoke

*/
/// Invoke function endpoint
/// This endpoint is used to invoke a registered function in the system
#[post("/invoke")]
async fn invoke(
    data: web::Json<InvokeFunction>,
    db_pool: web::Data<Pool<sqlite::Sqlite>>,
    firecracker_builder: web::Data<RwLock<FirecrackerBuilder>>,
    orchestrator: web::Data<Arc<orchestrator::Orchestrator>>,
    req: HttpRequest,
) -> impl Responder {
    // Only for debug
    if data.hops > 0 {
        warn!("Request with number of hops: {:?}", data.hops);
    }
    if data.hops > 10 as i32 {
        // TODO: Find a better way
        return HttpResponse::InternalServerError().body("Too many hops\n");
    }

    // Check and acquire resources
    let _resources = orchestrator.check_and_acquire_resources(
        data.vcpus.try_into().unwrap(),
        (data.memory * 1024).try_into().unwrap(),
    );

    // EMERGENCY MANAGEMENT
    // If no resources are available, offload the request
    // If in emergency mode, but the request is not in emergency, offload the request
    if _resources.is_err() || (orchestrator.in_emergency_area() && !data.emergency) {
        if _resources.is_ok() {
            let _ = orchestrator.release_resources(data.vcpus.try_into().unwrap());
        }
        let body = offload(orchestrator.clone(), data, req).await;
        return body;
    }

    // Start instance
    let max_retries = 10;
    let mut retries = 0;
    loop {
        if  retries > max_retries {
            // If an error occurs, release resources and return error
            let _ = orchestrator.release_resources(data.vcpus.try_into().unwrap());
            return HttpResponse::InternalServerError().body("Failed to start instance\n");
        }
        match start_instance(&firecracker_builder, &db_pool, &data).await {
            Ok(_) => {
                let res = orchestrator.release_resources(data.vcpus.try_into().unwrap());
                match res {
                    Ok(body) => return HttpResponse::Ok().body(body),
                    Err(_) => return HttpResponse::PayloadTooLarge().body("Payload too large\n"),
                }
            }
            Err(e) => {
                error!("Error!: {:?}", e);
            }
        };
        retries += 1;
    }
}

#[cfg(test)]
mod test {
    use crate::net::addresses::Addresses;
    use std::fs::{self, OpenOptions};
    use std::io::{Read, Write};
    use std::path::Path;
    use std::{net::Ipv4Addr, str::FromStr, time::Instant};

    use super::*;
    /*
       Small benchmark to measure the cold start time of a firecracker instance and execution time of a demo function.
       The test will create 1000 instances and measure the time it takes to start each instance and the time it takes to execute the function.
       The results are saved in two csv files: cold_start.csv and execution.csv
    */
    #[actix_web::test]
    async fn benchmark() {
        let addresses = Addresses::new(Ipv4Addr::from_str("192.168.30.1").unwrap(), 24).unwrap();

        let mut cold_start_times = Vec::new();
        let mut execution_times = Vec::new();

        // Fetch configuration from environment variables
        // Fetch function image path from environment variable
        let function_image_path = if let Ok(val) = std::env::var("SPARE_FUNCTION") {
            val
        } else {
            panic!("SPARE_FUNCTION environment variable not set");
        };
        // Check if the image exists
        if !Path::new(&function_image_path).exists() {
            panic!("Function image not found");
        }

        // Fetch firecracker executable path from environment variable
        let firecracker_executable = if let Ok(val) = std::env::var("FIRECRACKER_EXECUTABLE") {
            val
        } else {
            panic!("FIRECRACKER_EXECUTABLE environment variable not set");
        };
        // Check if the executable exists
        if !Path::new(&firecracker_executable).exists() {
            panic!("Firecracker executable not found");
        }

        // Fetch kernel image path from environment variable
        let kernel_image_path = if let Ok(val) = std::env::var("NANOS_KERNEL") {
            val
        } else {
            panic!("NANOS_KERNEL environment variable not set");
        };
        // Check if the kernel image exists
        if !Path::new(&kernel_image_path).exists() {
            panic!("Kernel image not found");
        }

        // Fetch bridge name from environment variable
        let bridge_name = if let Ok(val) = std::env::var("BRIDGE_INTERFACE") {
            val
        } else {
            panic!("BRIDGE_INTERFACE environment variable not set");
        };

        // Obviously this test will fail if the paths are not correct, so change them accordingly
        let firecracker_builder = FirecrackerBuilder::new(
            firecracker_executable,        // Firecracker executable
            kernel_image_path.to_string(), // Kernel image
            bridge_name,                   // Bridge name
            addresses,
        );
        let builder = firecracker_builder;
        let mut i = 0;

        while i < 1000 {
            let fc_instance = builder
                .new_instance(function_image_path.clone(), 2, 256) // Image, vcpus, memory
                .await;

            match fc_instance {
                Ok(mut fc_instance) => {
                    
            // VSOCK
            let mut path = fc_instance.get_vsock_path();
            path.push_str("_1234");
            let socket = std::os::unix::net::UnixListener::bind(path).unwrap();

            let start = Instant::now();
            fc_instance.start().await.unwrap();
            let (mut stream, _) = socket.accept().unwrap();

            let mut buf = [0; 1024];
            stream.read(&mut buf).unwrap();
            let message = String::from_utf8_lossy(&buf);

            match message.contains("ready") {
                true => {
                    // Update cold start time
                    cold_start_times.push(start.elapsed().as_nanos());

                    // Forward request to instance
                    let client = Client::default();

                    let res;

                    // Invoke the function
                    res = client
                        .get(format!("http://{}:{}", fc_instance.get_address(), 8084))
                        .send()
                        .await;

                    if res.is_ok() {
                        // Update execution time
                        execution_times
                            .push(start.elapsed().as_nanos() - cold_start_times.last().unwrap());
                        i += 1;
                    } else {
                        // Remove last cold start time and retry
                        let _ = cold_start_times.pop();
                    }
                }
                false => {}
            };

            // Delete instance
            let _ = fc_instance.stop().await;
            builder
                .network
                .lock()
                .unwrap()
                .release(fc_instance.get_address());
            let _ = fc_instance.delete().await;
                }
                Err(e) => {
                    error!("Failed to create instance: {:?}", e);
                    i -= 1;
                    continue;
                }
                
            }
        }

        // Save times in csv
        let cold_start_path = "cold_start.csv";
        // If file already exists, clear it
        if Path::new(cold_start_path).exists() {
            fs::remove_file(cold_start_path).unwrap();
        }
        let mut cold_start = OpenOptions::new()
            .write(true)
            .create(true)
            .append(false)
            .open(cold_start_path)
            .unwrap();

        // Write header
        writeln!(cold_start, "Elapsed time").unwrap();
        // Write Data
        for time in &cold_start_times {
            writeln!(cold_start, "{}", *time as f64 / 1_000_000.00).unwrap();
        }
        // Flush data into the file
        cold_start.flush().unwrap();

        // compute average times
        let avg = cold_start_times.iter().sum::<u128>() / cold_start_times.len() as u128;
        // nanos to ms f64
        let avg = avg as f64 / 1_000_000.00;
        println!("Average cold start time: {} ms", avg);

        let execution_path = "execution.csv";
        // If file already exists, clear it
        if Path::new(execution_path).exists() {
            fs::remove_file(execution_path).unwrap();
        }
        let mut execution = OpenOptions::new()
            .write(true)
            .create(true)
            .append(false)
            .open(execution_path)
            .unwrap();

        // Write header
        writeln!(execution, "Elapsed time").unwrap();
        // Write Data
        for time in &execution_times {
            writeln!(execution, "{}", *time as f64 / 1_000_000.00).unwrap();
        }
        // Flush data into the file
        execution.flush().unwrap();

        // compute average times
        let avg = execution_times.iter().sum::<u128>() / execution_times.len() as u128;
        // nanos to ms f64
        let avg = avg as f64 / 1_000_000.00;
        println!("Average execution time: {} ms", avg);
    }
}
