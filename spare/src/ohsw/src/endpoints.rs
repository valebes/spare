use std::{
    os::fd::AsRawFd,
    sync::Arc,
    time::{Duration, Instant},
    vec,
};

use actix_web::{
    get, post,
    rt::{net::UnixListener, time::timeout},
    web::{self, Bytes},
    HttpRequest, HttpResponse, Responder,
};
use log::{error, info, warn};
use sqlx::{sqlite, Pool};

use crate::{
    api::invoke::InvokeFunction,
    db::{self, models::Instance},
    execution_environment::firecracker::{FirecrackerBuilder, FirecrackerInstance},
    orchestrator::{self},
    utils::socket::{read_exact, write_all},
};

/// Error types for the instance
#[derive(Debug)]
pub enum InstanceError {
    ApplicationNotInitialized,
    InstanceCreation,
    InstanceStart,
    VSock,
    VSockTimeout,
    VSockCreation,
    Database,
    Timeout,
    HostUnreachable,
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
    firecracker_builder: web::Data<Arc<FirecrackerBuilder>>,
    orchestrator: web::Data<Arc<orchestrator::Orchestrator>>,
    req: HttpRequest,
) -> impl Responder {
    // Only for debug
    if data.hops > 0 {
        warn!("Request with number of hops: {:?}", data.hops);
    }
    if data.hops > 10 {
        // TODO: Find a better way
        return HttpResponse::InternalServerError().body("Too many hops\n");
    }

    // Emergency Management
    // If in emergency mode, but the request is not in emergency, offload the request
    if orchestrator.in_emergency_area() && !data.emergency {
        let body = orchestrator.offload(data, req).await;
        return body;
    }

    // Otherwise, handle the request
    // Check and acquire resources
    let _resources = orchestrator.check_and_acquire_resources(
        data.vcpus.try_into().unwrap(),
        (data.memory * 1024).try_into().unwrap(),
    );

    // If no resources are available, offload the request
    if _resources.is_err() {
        let _ = orchestrator.release_resources(data.vcpus.try_into().unwrap());
        let body = orchestrator.offload(data, req).await;
        return body;
    }

    // If resources are available, start the instance
    // Start instance
    let max_retries = 3;
    let mut retries = 0;
    loop {
        if retries > max_retries {
            // If an error occurs, release resources and return error
            let _ = orchestrator.release_resources(data.vcpus.try_into().unwrap());
            return HttpResponse::InternalServerError().body("Failed to start instance\n");
        }
        match start_instance(&firecracker_builder, &db_pool, &data).await {
            Ok(body) => {
                // Release resources
                let _ = orchestrator.release_resources(data.vcpus.try_into().unwrap());
                return HttpResponse::Ok().body(body);
            }
            Err(e) => {
                error!("Error in starting execution environment: {:?}", e);
            }
        };
        retries += 1;
    }
}

async fn emergency_cleanup(
    db_pool: &Pool<sqlite::Sqlite>,
    instance: &mut Instance,
    fc_instance: &mut FirecrackerInstance,
    builder: &web::Data<Arc<FirecrackerBuilder>>,
) {
    instance.set_status("failed".to_string());
    let _ = instance.update(&db_pool).await;
    let _ = fc_instance.delete().await;
    builder
        .network
        .lock()
        .unwrap()
        .release(fc_instance.get_address());
}

/// Method to start a new instance on the node
async fn start_instance(
    firecracker_builder: &web::Data<Arc<FirecrackerBuilder>>,
    db_pool: &Pool<sqlite::Sqlite>,
    data: &web::Json<InvokeFunction>,
) -> Result<Bytes, InstanceError> {
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
    let builder = firecracker_builder;

    let start = Instant::now();
    // Create new instance
    let fc_instance = builder
        .new_instance(data.image.clone(), data.vcpus, data.memory)
        .await;

    let duration = start.elapsed();
    info!("Time to create instance: {} ms", duration.as_millis());

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
                    emergency_cleanup(db_pool, &mut instance, &mut fc_instance, builder).await;
                    return Err(InstanceError::Database);
                }
            }

            info!("Created new function instance: {}", instance.id);

            // Make sure the vsock socket is ready
            let mut path = fc_instance.get_vsock_path();

            path.push_str("_1234");
            let socket = UnixListener::bind(path);

            if socket.is_err() {
                error!("Error binding vsock socket: {}", socket.err().unwrap());
                emergency_cleanup(db_pool, &mut instance, &mut fc_instance, builder).await;
                return Err(InstanceError::VSockCreation);
            }
            let socket = socket.unwrap();
            info!(
                "Socket created: {}, for instance {}",
                socket.as_raw_fd(),
                instance.id
            );

            let start = Instant::now();
            // Start instance
            match fc_instance.start().await {
                Ok(_) => {}
                Err(e) => {
                    error!("Error in starting the instance: {}", e);
                    emergency_cleanup(db_pool, &mut instance, &mut fc_instance, builder).await;
                    return Err(InstanceError::InstanceStart);
                }
            }

            let duration = start.elapsed();
            info!("Time to start instance: {} ms", duration.as_millis());

            info!("Starting instance: {} ip: {}", instance.id, instance.ip);

            let start = Instant::now();
            let mut stream = match timeout(Duration::from_millis(500), socket.accept()).await {
                Ok(res) => match res {
                    Ok((stream, _)) => stream,
                    Err(e) => {
                        error!("Error accepting vsocket (stream): {:?}", e);
                        emergency_cleanup(db_pool, &mut instance, &mut fc_instance, builder).await;
                        return Err(InstanceError::VSock);
                    }
                },
                Err(e) => {
                    // If an error occurs, delete the instance and set 'failed' status
                    error!("Error accepting vsocket (timeout): {:?}", e);
                    emergency_cleanup(db_pool, &mut instance, &mut fc_instance, builder).await;
                    return Err(InstanceError::VSockTimeout);
                }
            };

            let duration = start.elapsed();
            info!("Time to accept vsock: {} ms", duration.as_millis());

            info!(
                "Socket accepted: {}, for instance {}",
                stream.as_raw_fd(),
                instance.id
            );

            let start = Instant::now();
            let mut buf = [0; 5];
            // Read from the vsock socket
            match read_exact(&mut stream, &mut buf, 500).await {
                // 500ms Timeout for machine to be ready
                Ok(_) => {}
                Err(e) => {
                    error!("Error reading from vsocket: {}", e);
                    emergency_cleanup(db_pool, &mut instance, &mut fc_instance, builder).await;
                    return Err(InstanceError::VSock);
                }
            }

            let duration = start.elapsed();
            info!("Time to read from vsock: {} ms", duration.as_millis());

            let message: std::borrow::Cow<'_, str> = String::from_utf8_lossy(&buf);

            info!(
                "Received message: {}, for instance {}",
                message, instance.id
            );

            // Check if the instance is ready through the vsock socket
            match message.contains("ready") {
                true => {}
                false => {
                    error!("Message not ready: {}", message);
                    error!("Instance {} failed to start", instance.id);
                    emergency_cleanup(db_pool, &mut instance, &mut fc_instance, builder).await;
                    return Err(InstanceError::VSock);
                }
            }

            let start = Instant::now();
            // Write payload in the vsock socket
            match &data.payload {
                Some(payload) => {
                    info!("Sending payload to instance: {}", instance.id);
                    // Write length of payload
                    let len = payload.len();
                    // Concatenate the length of the payload and the payload
                    let mut buf = vec![0; 8 + len];
                    buf[0..8].copy_from_slice(&len.to_be_bytes());
                    buf[8..].copy_from_slice(payload.as_bytes());
                    // TODO: Specify the timeout
                    match write_all(&mut stream, &buf, 1000).await {
                        Ok(_) => {}
                        Err(e) => {
                            error!("Error writing to vsocket: {}", e);
                            emergency_cleanup(db_pool, &mut instance, &mut fc_instance, builder)
                                .await;
                            return Err(InstanceError::VSock);
                        }
                    }
                }
                None => {}
            }

            let duration = start.elapsed();
            info!(
                "Time to write payload to vsock: {} ms",
                duration.as_millis()
            );

            let start = Instant::now();
            // Read the length of the response
            info!("Reading length of response from instance: {}", instance.id);
            let mut len = [0; 8];
            // TODO: Specify the timeout
            match read_exact(&mut stream, &mut len, 10000).await {
                Ok(_) => {}
                Err(e) => {
                    error!("Error reading from vsocket: {}", e);
                    emergency_cleanup(db_pool, &mut instance, &mut fc_instance, builder).await;
                    return Err(InstanceError::VSock);
                }
            }

            let len = u64::from_be_bytes(len.as_slice().try_into().unwrap()) as usize;
            info!("Length of response: {}, for instance {}", len, instance.id);
            let mut buf = vec![0; len];
            // Read the response
            // TODO: Specify the timeout
            match read_exact(&mut stream, &mut buf, 10000).await {
                Ok(_) => {}
                Err(e) => {
                    error!("Error reading from vsocket: {}", e);
                    emergency_cleanup(db_pool, &mut instance, &mut fc_instance, builder).await;
                    return Err(InstanceError::VSock);
                }
            }

            let duration = start.elapsed();
            info!(
                "Time to read response from vsock: {} ms",
                duration.as_millis()
            );

            info!("Successfully read response from instance: {}", instance.id);

            match stream.into_std() {
                Ok(std_stream) => match std_stream.shutdown(std::net::Shutdown::Both) {
                    Ok(_) => {}
                    Err(e) => {
                        error!("Error shutting down vsocket: {}", e);
                    }
                },
                Err(e) => {
                    error!("Error in obtaining std stream: {}", e);
                }
            }

            let _ = fc_instance.stop().await;
            let _ = fc_instance.delete().await;
            let _ = instance.set_status("terminated".to_string());
            let _ = instance.update(&db_pool).await;

            // Cleanup instance
            builder
                .network
                .lock()
                .unwrap()
                .release(fc_instance.get_address());

            info!("Instance {} terminated", instance.id);

            Ok(Bytes::from(buf))
        }
        Err(e) => {
            error!("Failed to create instance: {:?}", e);
            return Err(InstanceError::InstanceCreation);
        }
    }
}

#[cfg(test)]
mod test {
    use super::*;
    use crate::net::addresses::Addresses;
    use std::fs::{self, OpenOptions};
    use std::io::Write;
    use std::path::Path;
    use std::{net::Ipv4Addr, str::FromStr, time::Instant};

    /*
       Small benchmark to measure the cold start time of a firecracker instance and
       execution time of a demo function.

       The test will create 1000 instances and measure:
       - cold start: from `start()` until the guest sends "ready"
       - execution: from sending payload length+data until the full response is read

       Results are saved into two CSV files: cold_start.csv and execution.csv.
    */
    #[actix_web::test]
    async fn benchmark() {
        let addresses = Addresses::new(Ipv4Addr::from_str("192.168.30.1").unwrap(), 24).unwrap();

        let mut cold_start_times: Vec<u128> = Vec::new();
        let mut execution_times: Vec<u128> = Vec::new();

        // SPARE_FUNCTION: path to function image
        let function_image_path =
            std::env::var("SPARE_FUNCTION").expect("SPARE_FUNCTION environment variable not set");
        if !Path::new(&function_image_path).exists() {
            panic!("Function image not found at {}", function_image_path);
        }

        // FIRECRACKER_EXECUTABLE: path to firecracker binary
        let firecracker_executable = std::env::var("FIRECRACKER_EXECUTABLE")
            .expect("FIRECRACKER_EXECUTABLE environment variable not set");
        if !Path::new(&firecracker_executable).exists() {
            panic!(
                "Firecracker executable not found at {}",
                firecracker_executable
            );
        }

        // NANOS_KERNEL: path to kernel image
        let kernel_image_path =
            std::env::var("NANOS_KERNEL").expect("NANOS_KERNEL environment variable not set");
        if !Path::new(&kernel_image_path).exists() {
            panic!("Kernel image not found at {}", kernel_image_path);
        }

        // BRIDGE_INTERFACE: name of bridge (e.g. "br0")
        let bridge_name = std::env::var("BRIDGE_INTERFACE")
            .expect("BRIDGE_INTERFACE environment variable not set");

        let builder = FirecrackerBuilder::new(
            firecracker_executable,
            kernel_image_path.to_string(),
            bridge_name,
            addresses,
        );

        let mut i = 0usize;
        let target_runs = 1000usize;

        while i < target_runs {
            let fc_instance_res = builder
                .new_instance(function_image_path.clone(), 2, 256) // image, vcpus, memory
                .await;

            let mut fc_instance = match fc_instance_res {
                Ok(fc) => fc,
                Err(e) => {
                    error!("Failed to create instance: {:?}", e);
                    // just retry without incrementing i
                    continue;
                }
            };

            // Host side vsock listener
            let mut path = fc_instance.get_vsock_path();
            path.push_str("_1234");
            let socket = match UnixListener::bind(&path) {
                Ok(s) => s,
                Err(e) => {
                    error!("Failed to bind UnixListener on {}: {}", path, e);
                    let _ = fc_instance.stop().await;
                    let _ = fc_instance.delete().await;
                    continue;
                }
            };

            let cold_start_begin = Instant::now();

            if let Err(e) = fc_instance.start().await {
                error!("Failed to start instance: {:?}", e);
                let _ = fc_instance.stop().await;
                let _ = fc_instance.delete().await;
                continue;
            }

            let (mut stream, _) = match socket.accept().await {
                Ok(s) => s,
                Err(e) => {
                    error!("Failed to accept vsock connection: {}", e);
                    let _ = fc_instance.stop().await;
                    let _ = fc_instance.delete().await;
                    continue;
                }
            };

            // Wait for "ready"
            let mut ready_buf = [0u8; 5];
            if let Err(e) = read_exact(&mut stream,&mut ready_buf, 500).await {
                error!("Error reading ready message from vsock: {}", e);
                let _ = fc_instance.stop().await;
                let _ = fc_instance.delete().await;
                continue;
            }

            let message = String::from_utf8_lossy(&ready_buf);
            if !message.contains("ready") {
                error!("Guest did not send 'ready', got: {}", message);
                let _ = fc_instance.stop().await;
                let _ = fc_instance.delete().await;
                continue;
            }

            let cold_ns = cold_start_begin.elapsed().as_nanos();
            cold_start_times.push(cold_ns);

            let payload: Option<String> = Some("".to_string()); // adjust payload if needed

            let exec_begin = Instant::now();

            if let Some(p) = &payload {
                let len = p.len();
                let mut buf = vec![0u8; 8 + len];
                buf[0..8].copy_from_slice(&(len as u64).to_be_bytes());
                buf[8..].copy_from_slice(p.as_bytes());

                if let Err(e) = write_all(&mut stream,&buf, 500).await {
                    error!("Error writing payload to vsock: {}", e);
                    let _ = fc_instance.stop().await;
                    let _ = fc_instance.delete().await;
                    // discard last cold start measurement, since run failed
                    let _ = cold_start_times.pop();
                    continue;
                }
            } else {
                // if you really want to support None, still send length 0
                let len_bytes = 0u64.to_be_bytes();
                if let Err(e) = write_all(&mut stream,&len_bytes, 500).await {
                    error!("Error writing zero-length header to vsock: {}", e);
                    let _ = fc_instance.stop().await;
                    let _ = fc_instance.delete().await;
                    let _ = cold_start_times.pop();
                    continue;
                }
            }

            // Read response length (8 bytes)
            let mut len_buf = [0u8; 8];
            if let Err(e) = read_exact(&mut stream, &mut len_buf, 500).await {
                error!("Error reading response length from vsock: {}", e);
                let _ = fc_instance.stop().await;
                let _ = fc_instance.delete().await;
                let _ = cold_start_times.pop();
                continue;
            }

            let resp_len = u64::from_be_bytes(len_buf) as usize;
            let mut resp_buf = vec![0u8; resp_len];

            if let Err(e) = read_exact(&mut stream, &mut resp_buf, 500).await {
                error!("Error reading response body from vsock: {}", e);
                let _ = fc_instance.stop().await;
                let _ = fc_instance.delete().await;
                let _ = cold_start_times.pop();
                continue;
            }

            let exec_ns = exec_begin.elapsed().as_nanos();
            execution_times.push(exec_ns);

            // Clean up
            match stream.into_std() {
                Ok(std_stream) => match std_stream.shutdown(std::net::Shutdown::Both) {
                    Ok(_) => {}
                    Err(e) => {
                        error!("Error shutting down vsocket: {}", e);
                    }
                },
                Err(e) => {
                    error!("Error in obtaining std stream: {}", e);
                }
            }
            let _ = fc_instance.stop().await;
            let _ = fc_instance.delete().await;
            builder
                .network
                .lock()
                .unwrap()
                .release(fc_instance.get_address());

            i += 1;
        }

        let cold_start_path = "cold_start.csv";
        if Path::new(cold_start_path).exists() {
            fs::remove_file(cold_start_path).unwrap();
        }

        let mut cold_start_file = OpenOptions::new()
            .write(true)
            .create(true)
            .truncate(true)
            .open(cold_start_path)
            .unwrap();

        writeln!(cold_start_file, "Elapsed time (ms)").unwrap();
        for time_ns in &cold_start_times {
            let ms = *time_ns as f64 / 1_000_000.0;
            writeln!(cold_start_file, "{}", ms).unwrap();
        }
        cold_start_file.flush().unwrap();

        let avg_cold_ns: u128 =
            cold_start_times.iter().sum::<u128>() / cold_start_times.len() as u128;
        let avg_cold_ms = avg_cold_ns as f64 / 1_000_000.0;
        println!("Average cold start time: {} ms", avg_cold_ms);

        let execution_path = "execution.csv";
        if Path::new(execution_path).exists() {
            fs::remove_file(execution_path).unwrap();
        }

        let mut execution_file = OpenOptions::new()
            .write(true)
            .create(true)
            .truncate(true)
            .open(execution_path)
            .unwrap();

        writeln!(execution_file, "Elapsed time (ms)").unwrap();
        for time_ns in &execution_times {
            let ms = *time_ns as f64 / 1_000_000.0;
            writeln!(execution_file, "{}", ms).unwrap();
        }
        execution_file.flush().unwrap();

        let avg_exec_ns: u128 =
            execution_times.iter().sum::<u128>() / execution_times.len() as u128;
        let avg_exec_ms = avg_exec_ns as f64 / 1_000_000.0;
        println!("Average execution time: {} ms", avg_exec_ms);
    }
}
