//! SPARE Serverless Platform
//! SPARE is a serverless platform that aims to provide a scalable and efficient serverless platform for edge computing.
//! The code provided here is a prototype of the SPARE platform.

use crate::orchestrator::Node;
use std::{
    env,
    fs::File,
    io::Write,
    net::Ipv4Addr,
    path::Path,
    str::FromStr,
    sync::{Arc, Mutex, RwLock},
};

use actix_web::{middleware, web::Data, App, HttpServer};
use clap::{arg, command, Parser};
use local_ip_address::local_ip;
use log::{error, info};
use ohsw::{
    db::{self},
    endpoints::{emergency, index, invoke, list, resources},
    execution_environment::firecracker::FirecrackerBuilder,
    net::{
        addresses::Addresses,
        iggy::{IggyConnector, Operation, Payload},
    },
    orchestrator::{self, global::emergency::Emergency, Orchestrator},
};
use sqlx::{sqlite, Pool};

// Struct that represents the supported arguments for the executable
#[derive(Parser, Debug)]
#[command(version, about, long_about = None)]
struct Args {
    // Iggy broker address
    #[arg(short, long, default_value = "127.0.0.1")]
    broker_address: String,
    // Iggy broker port
    #[arg(short, long, default_value = "8090")]
    broker_port: u16,
    // CIDR for the network
    #[arg(short, long, required = true)]
    cidr: String,
    // Port for the server
    #[arg(short, long, default_value = "8085")]
    port: u16,
    // Bridge name for the virtual network
    #[arg(short, long, default_value = "br0")]
    bridge_name: String,
}

// Controller that handles the emergency mode
#[actix_web::main]
async fn emergency_controller(
    pool: Pool<sqlite::Sqlite>,
    orchestrator: Arc<Orchestrator>,
    iggy_client: IggyConnector,
    shutdown: Arc<Mutex<bool>>,
) {
    let orchestrator = orchestrator;
    let (x, y) = orchestrator.get_identity().position;
    let mut file = File::create(&format!("node_x{}_y{}.stats.data", x, y)).unwrap();
    let _ = writeln!(
        file,
        "{:<15} {:<10} {:<10} {:<10} {:<10}",
        "epoch", "hops_avg", "vcpus_sum", "memory_sum", "requests"
    );
    let mut eras = 0;
    loop {
        match iggy_client.receive_message().await {
            Ok(Some(msg)) => match msg.op {
                Operation::START_EMERGENCY => match msg.payload {
                    Some(Payload::Emergency(em_pos)) => {
                        info!(
                            "Emergency mode activated at position: {:?} with radius: {}",
                            em_pos.position, em_pos.radius
                        );
                        orchestrator.set_emergency(true, em_pos);
                    }
                    _ => continue,
                },
                Operation::STOP_EMERGENCY => {
                    orchestrator.set_emergency(
                        false,
                        Emergency {
                            position: (0.0, 0.0),
                            radius: 0.0,
                        },
                    );
                    info!("Emergency mode deactivated");
                }
                Operation::END => break,
                Operation::WRITE_STATS => match msg.payload {
                    Some(Payload::Period(period)) => {
                        info!(
                            "Writing stats for period: {} - {}",
                            period.start, period.end
                        );
                        let start = period.start;
                        let end = period.end;
                        let mut stats = db::stats(&pool, &start, &end).await;
                        loop {
                            if stats.is_err() {
                                stats = db::stats(&pool, &start, &end).await;
                            } else {
                                break;
                            }
                        }
                        let stats = stats.unwrap();
                        writeln!(
                            file,
                            "{:<15} {:<10} {:<10} {:<10} {:<10}",
                            eras, stats.hops_avg, stats.vcpus, stats.memory, stats.requests
                        )
                        .unwrap();
                        eras += 1;
                    }
                    _ => continue,
                },
                _ => (),
            },
            Ok(None) => {
                if *shutdown.lock().unwrap() {
                    break;
                }
            }
            Err(e) => {
                error!("Error receiving message: {e}");
            }
        }
    }
}

// Main function. It starts the server and the emergency controller
#[actix_web::main]
async fn main() -> std::io::Result<()> {
    env_logger::init();

    // Parse arguments from command line
    let iggy_host = Args::parse().broker_address;
    let iggy_port = Args::parse().broker_port;

    // Connect to the Iggy message broker
    let iggy_client = IggyConnector::new(&format!("{iggy_host}:{iggy_port}")).await;

    // Registering Phase
    let worker_address = local_ip().unwrap();
    let worker_port = Args::parse().port;

    // Register Node with (0, 0) position, we will update it later.
    // This is a temporary solution only used for the sake of the experiment.
    let identity = Node {
        address: format!("{worker_address}:{worker_port}"),
        position: (0.0, 0.0),
    };
    info!("Registering node at {iggy_host}:{iggy_port}");
    let _ = iggy_client.register_node(identity.clone()).await;

    let mut nodes;

    // Fetch remote nodes from the Iggy message broker
    loop {
        match iggy_client.receive_message().await {
            Ok(Some(message)) => {
                if message.op == Operation::ADD_NODES {
                    match message.payload {
                        Some(Payload::Nodes(n)) => {
                            nodes = n;
                            break;
                        }
                        _ => continue,
                    }
                }
            }
            Ok(None) => continue,
            Err(e) => {
                error!("Error receiving message: {e}");
            }
        }
    }

    // Extract identity (this node) from the list of nodes
    let identity = nodes
        .extract_if(.., |n| {
            n.address == format!("{worker_address}:{worker_port}")
        })
        .next()
        .unwrap();
    info!("Found {} nodes", nodes.len());
    for node in &nodes {
        info!(
            "Added node: {}, position: {:?}",
            node.address, node.position
        );
    }

    // Create orchestrator
    let orchestrator = Arc::new(orchestrator::Orchestrator::new(nodes, identity.clone()));
    let orchestrator_clone = orchestrator.clone();

    // Fetch the Firecracker executable and the Nanos kernel
    // These must be set in the environment variables FIRECRACKER_EXECUTABLE and NANOS_KERNEL
    let executable = match env::var("FIRECRACKER_EXECUTABLE") {
        Ok(val) => {
            // Check if file exists
            if Path::new(&val).exists() {
                val
            } else {
                panic!("Cannot find Firecracker executable in: {val}");
            }
        }
        Err(_) => {
            panic!("FIRECRACKER_EXECUTABLE environment variable not set");
        }
    };

    let kernel = match env::var("NANOS_KERNEL") {
        Ok(val) => {
            // Check if file exists
            if Path::new(&val).exists() {
                val
            } else {
                panic!("Cannot find Nanos kernel in: {val}");
            }
        }
        Err(_) => {
            panic!("NANOS_KERNEL environment variable not set");
        }
    };

    // Fetch the bridge name from the arguments
    let bridge = Args::parse().bridge_name.to_owned();

    // Establish connection to the database
    let pool = db::establish_connection().await.unwrap();

    // Parse CIDR from arguments
    let cidr = Args::parse().cidr;
    let base_address = cidr.split('/').next().unwrap();
    let prefix = cidr.split('/').nth(1).unwrap();
    let addresses = Addresses::new(
        Ipv4Addr::from_str(base_address).unwrap(),
        prefix.parse().unwrap(),
    )
    .unwrap();

    // Create a new FirecrackerBuilder
    let builder = Data::new(RwLock::new(FirecrackerBuilder::new(
        executable,
        kernel,
        bridge,
        addresses.clone(),
    )));

    let pool_clone = pool.clone();

    let shutdown = Arc::new(Mutex::new(false));
    let shutdown_clone = shutdown.clone();

    // Start emergency controller
    let emergency_controller = std::thread::spawn(move || {
        emergency_controller(
            pool.clone(),
            orchestrator_clone,
            iggy_client,
            shutdown_clone,
        );
    });

    // Start the web server
    let server = HttpServer::new(move || {
        App::new()
            .wrap(middleware::Compress::default()) // Create option to enable or disable gzip compression
            .app_data(Data::new(pool_clone.clone()))
            .app_data(builder.clone())
            .app_data(Data::new(orchestrator.clone()))
            .service(index)
            .service(list)
            .service(invoke)
            .service(resources)
            .service(emergency)
    })
    .bind(("0.0.0.0", 8085))?
    .disable_signals()
    .run();

    let server_handle = server.handle();

    // Start the shutdown controller.
    //
    let shutdown = actix_web::rt::spawn(async move {
        // listen for ctrl-c
        actix_web::rt::signal::ctrl_c().await.unwrap();

        // start shutdown of tasks
        let server_stop = server_handle.stop(true);
        *shutdown.lock().unwrap() = true;

        // await shutdown of tasks
        server_stop.await;
    });

    server.await?;

    shutdown.await?;

    emergency_controller.join().unwrap();

    Ok(())
}
