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
    error!("Time to create instance: {} ms", duration.as_millis());

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
            error!("Time to start instance: {} ms", duration.as_millis());

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
            error!("Time to accept vsock: {} ms", duration.as_millis());

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
            error!("Time to read from vsock: {} ms", duration.as_millis());

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
            error!(
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
            error!(
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

            /*
               The problem here: The instance at this point is ready, but in some
               rare cases, firecracker has not initialized the network yet, so
               request to the instance may go in timeout.
            */

            /*
            info!("Instance is ready: {}", instance.id);
            // Forward request to instance
            let client = Client::default();
            let max_retries = 3;
            let mut retries = 0;
            let mut res;
            loop {
                info!("Instance: {}, num of retries: {}", instance.id, retries);
                if retries > max_retries {
                    emergency_cleanup(db_pool, &mut instance, &mut fc_instance, builder).await;
                    return Err(InstanceError::Timeout);
                }
                // TODO: Here we should put a timeout
                if data.payload.is_none() {
                    match client
                        .get(format!("http://{}:{}", instance.ip, instance.port))
                        .send()
                        .await
                    {
                        Ok(result) => {
                            res = result;
                            break;
                        }
                        Err(e) => match e {
                            awc::error::SendRequestError::Send(e) => {
                                error!("Error in sending the request: {:?}", e);
                                retries += 1;
                                sleep(Duration::from_millis(10)).await;
                                continue;
                            },
                            awc::error::SendRequestError::Connect(e) => {
                                error!("Error in connecting to the instance: {:?}", e);
                                retries += 1;
                                sleep(Duration::from_millis(50)).await;
                                continue;
                            },
                            awc::error::SendRequestError::Timeout => {
                                error!("Error in connecting to the instance due timeout!");
                                retries += 1;
                                sleep(Duration::from_millis(10)).await;
                                continue;
                            }
                            _ => {
                                error!("Send error: {:?}", e);
                                emergency_cleanup(
                                    db_pool,
                                    &mut instance,
                                    &mut fc_instance,
                                    builder,
                                )
                                .await;
                                return Err(InstanceError::HostUnreachable);
                            }
                        },
                    };
                } else {
                    let payload = Payload {
                        payload: data.payload.clone().unwrap(),
                    };
                    match client
                        .post(format!("http://{}:{}", instance.ip, instance.port))
                        .send_json(&payload)
                        .await
                    {
                        Ok(result) => {
                            res = result;
                            break;
                        }
                        Err(e) => {
                            match e {
                                awc::error::SendRequestError::Send(e) => {
                                    error!("Error sending the request: {:?}", e);
                                    retries += 1;
                                    sleep(Duration::from_millis(10)).await;
                                    continue;
                                }
                                _ => {
                                    error!("Send error: {:?}", e);
                                    emergency_cleanup(
                                        db_pool,
                                        &mut instance,
                                        &mut fc_instance,
                                        builder,
                                    )
                                    .await;
                                    return Err(InstanceError::HostUnreachable);
                                }
                            };
                        }
                    };
                }
            }
            */

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
    use awc::Client;

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

                    let mut buf = [0; 5];
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
                                execution_times.push(
                                    start.elapsed().as_nanos() - cold_start_times.last().unwrap(),
                                );
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
