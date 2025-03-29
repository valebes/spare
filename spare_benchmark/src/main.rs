use std::{
    env,
    fs::OpenOptions,
    io::Write,
    path::Path,
    str::FromStr,
    sync::{
        atomic::{AtomicUsize, Ordering},
        Arc,
    },
    time::Duration,
};

use clap::Parser;
use iggy::{
    client::{Client, MessageClient, StreamClient, TopicClient, UserClient},
    clients::client::IggyClient,
    compression::compression_algorithm::CompressionAlgorithm,
    consumer::Consumer,
    error::IggyError,
    identifier::Identifier,
    messages::{poll_messages::PollingStrategy, send_messages::Partitioning},
    users::defaults::{DEFAULT_ROOT_PASSWORD, DEFAULT_ROOT_USERNAME},
    utils::expiry::IggyExpiry,
};
use log::{error, info, warn};
use longitude::Location;
use rand::{rng, Rng};
use reqwest::Url;
use serde::{Deserialize, Serialize};
use tokio::{
    fs,
    sync::Mutex,
    time::{sleep, Instant},
};

mod dataset;
use dataset::*;

const STREAM_ID: u32 = 1;
const TOPIC_ID: u32 = 1;
const ANNOUNCE_PARTITION_ID: u32 = 1;
const BROADCAST_PARTITION_ID: u32 = 2;

// Args for the CLI
#[derive(Parser, Debug)]
#[command(version, about, long_about = None)]
struct Args {
    /// Iggy broker address
    #[arg(short, long, default_value = "127.0.0.1")]
    broker_address: String,

    #[arg(short, long, default_value = "16")]
    number_of_nodes: i32,

    #[arg(short, long, default_value = "1000")]
    emergency_radius: f64, // Radius in meters

    // Path for the dataset
    #[arg(short, long)]
    dataset: String,

    #[arg(short, long, default_value = "10")]
    iterations: i32,
}

#[derive(Deserialize, Serialize, Clone, Debug)]
struct Node {
    address: String, // Ip:Port
    position: (f64, f64),
}
impl Node {
    fn distance(&self, other: &Self) -> f64 {
        let location_a = Location::from(self.position.0, self.position.1);
        let location_b = Location::from(other.position.0, other.position.1);

        location_a.distance(&location_b).meters()
    }
}

#[derive(Deserialize, Serialize)]
struct Emergency {
    /// The position of the emergency point
    position: (f64, f64),
    /// The radius of the emergency point
    radius: f64,
}

#[derive(Deserialize, Serialize)]
struct Period {
    start: String,
    end: String,
}

#[derive(PartialEq, Eq, Deserialize, Serialize)]
enum Operation {
    START_EMERGENCY = 0,
    STOP_EMERGENCY = 1,
    ADD_NODES = 2,
    ANNOUNCE = 3,
    END = 4,
    WRITE_STATS = 5,
}

// Or a Vec of Nodes or a single emergency point
#[derive(Deserialize, Serialize)]
pub enum Payload {
    Nodes(Vec<Node>),
    Emergency(Emergency),
    Period(Period),
}

#[derive(Deserialize, Serialize)]
struct Message {
    op: Operation,
    payload: Option<Payload>,
}

#[derive(serde::Deserialize, serde::Serialize)]
pub struct InvokeFunction {
    pub function: String,
    pub image: String,
    pub vcpus: i32,
    pub memory: i32,
    pub payload: String,
    pub emergency: bool,
    pub hops: i32,
}

// Initializes stream and topic
async fn init_system(client: &IggyClient) {
    match client
        .create_stream("default-stream", Some(STREAM_ID))
        .await
    {
        Ok(_) => info!("Stream was created."),
        Err(_) => warn!("Stream already exists and will not be created again."),
    }

    match client
        .create_topic(
            &STREAM_ID.try_into().unwrap(),
            "cluster",
            2,
            CompressionAlgorithm::default(),
            None,
            Some(TOPIC_ID),
            IggyExpiry::NeverExpire,
            None.into(),
        )
        .await
    {
        Ok(_) => info!("Topic was created."),
        Err(_) => warn!("Topic already exists and will not be created again."),
    }
}

// Send message to topic
async fn send_message(
    client: &IggyClient,
    partition_id: u32,
    message: Message,
) -> Result<(), IggyError> {
    let message = iggy::messages::send_messages::Message::from_str(
        serde_json::to_string(&message).unwrap().as_str(),
    )
    .unwrap();
    client
        .send_messages(
            &STREAM_ID.try_into().unwrap(),
            &TOPIC_ID.try_into().unwrap(),
            &Partitioning::partition_id(partition_id),
            &mut [message],
        )
        .await
}

// Receive message from topic
async fn receive_message(client: &IggyClient) -> Result<Message, IggyError> {
    loop {
        let polled_messages = client
            .poll_messages(
                &STREAM_ID.try_into()?,
                &TOPIC_ID.try_into()?,
                Some(BROADCAST_PARTITION_ID),
                &Consumer::new(Identifier::named("master").unwrap()),
                &PollingStrategy::next(),
                1,
                true,
            )
            .await?;

        if polled_messages.messages.is_empty() {
            continue;
        }

        let deserialized =
            serde_json::from_slice::<Message>(&polled_messages.messages[0].payload).unwrap();
        return Ok(deserialized);
    }
}

// Wait for nodes to be ready
async fn wait_for_nodes(client: &IggyClient, number_of_nodes: i32) -> Result<Vec<Node>, IggyError> {
    let mut nodes: Vec<Node> = Vec::new();
    let consumer = Consumer::new(Identifier::named("master").unwrap());

    loop {
        let polled_messages = client
            .poll_messages(
                &STREAM_ID.try_into()?,
                &TOPIC_ID.try_into()?,
                Some(ANNOUNCE_PARTITION_ID),
                &consumer,
                &PollingStrategy::next(),
                1,
                true,
            )
            .await?;

        if polled_messages.messages.is_empty() {
            continue;
        }

        info!("Polled {} messages", polled_messages.messages.len());

        for message in polled_messages.messages {
            let msg =
                serde_json::from_str::<Message>(std::str::from_utf8(&message.payload).unwrap());

            if msg.is_err() {
                continue;
            }

            let msg = msg.unwrap();

            match msg.payload {
                Some(Payload::Nodes(tmp)) => {
                    nodes.extend(tmp);
                }
                _ => {
                    error!("Unexpected payload type");
                }
            }
        }

        if nodes.len() == number_of_nodes as usize {
            return Ok(nodes);
        }
    }
}

async fn start_emergency(client: &IggyClient, emergency: Emergency) -> Result<(), IggyError> {
    send_message(
        &client,
        BROADCAST_PARTITION_ID,
        Message {
            op: Operation::START_EMERGENCY,
            payload: Some(Payload::Emergency(emergency)),
        },
    )
    .await
}

async fn stop_emergency(client: &IggyClient) -> Result<(), IggyError> {
    send_message(
        &client,
        BROADCAST_PARTITION_ID,
        Message {
            op: Operation::STOP_EMERGENCY,
            payload: None,
        },
    )
    .await
}

async fn test(
    client: &IggyClient,
    iterations: i32,
    nodes: Vec<Node>,
    function_path: &String,
) -> (u128, usize, usize, Vec<u128>) {
    let request_per_epoch = 6 * nodes.len();
    let mut latency_per_epoch = Vec::new();
    let latency = Arc::new(Mutex::new(Vec::new()));
    let completed = Arc::new(AtomicUsize::new(0));
    let failed = Arc::new(AtomicUsize::new(0));

    for i in 0..iterations {
        println!("Iteration: {}", i);
        let latency_per_epoch_tmp = Arc::new(Mutex::new(Vec::new()));
        let mut handles = Vec::new();

        let start_time = chrono::Utc::now().naive_utc().to_string();
        for _j in 0..(request_per_epoch) {
            let latency_per_epoch_tmp_copy = Arc::clone(&latency_per_epoch_tmp);
            let latency_tmp = Arc::clone(&latency);
            let node = nodes.get(rng().random_range(0..nodes.len())).unwrap();
            let address = node.address.clone();

            let completed_tmp = Arc::clone(&completed);
            let failed_tmp = Arc::clone(&failed);
            let function_path_tmp = function_path.clone();

            sleep(Duration::from_millis(55)).await; // Inter-arrival time
            let handle = tokio::spawn(async move {
                let web_client = reqwest::Client::new();

                let invoke_function = InvokeFunction {
                    function: "mandelbrot".to_string(), // Function name (This is hardcoded for now)
                    image: function_path_tmp,
                    vcpus: 2,
                    memory: 256,
                    payload: "test".to_string(),
                    emergency: false,
                    hops: 0,
                };

                let mut total_time = 0;
                loop {
                    let start = Instant::now();
                    let req: Result<reqwest::Response, reqwest::Error> = web_client
                        .post(
                            Url::from_str(&format!("http://{}/invoke", address).as_str()).unwrap(),
                        )
                        .json(&invoke_function)
                        .timeout(Duration::from_millis(5000)) // Timeout after 5 seconds
                        .send()
                        .await;

                    let end = Instant::now();

                    match req {
                        Ok(res) => {
                            if res.status().is_success() {
                                info!("Success");
                                total_time += end.duration_since(start).as_millis();
                                let mut latency_tmp = latency_tmp.lock().await;
                                latency_tmp.push(total_time);
                                latency_per_epoch_tmp_copy.lock().await.push(total_time);

                                completed_tmp.fetch_add(1, Ordering::SeqCst);
                                break;
                            } else {
                                error!("Error: {}", res.text().await.unwrap());
                                sleep(Duration::from_millis(100)).await; // Retry after 100ms TODO: Revise this
                                total_time += end.duration_since(start).as_millis();
                                failed_tmp.fetch_add(1, Ordering::SeqCst);
                                continue;
                            }
                        }
                        Err(e) => {
                            error!("Error: {}!", e);
                            if e.is_timeout() {
                                error!("Timeout! Now trying again...");
                            } else if e.is_connect() {
                                error!("Connection error! Now trying again...");
                            } else if e.is_redirect() {
                                error!("Redirect error! Now trying again...");
                            }
                            continue;
                        }
                    }
                }
            });

            handles.push(handle);
        }

        // Wait for all nodes to finish
        for handle in handles {
            handle.await.unwrap();
        }

        let end_time = chrono::Utc::now().naive_utc().to_string();

        println!("Starting in 10 seconds");
        sleep(Duration::from_secs(5)).await;

        // Announce the end of an epoch
        send_message(
            &client,
            BROADCAST_PARTITION_ID,
            Message {
                op: Operation::WRITE_STATS,
                payload: Some(Payload::Period(Period {
                    start: start_time,
                    end: end_time,
                })),
            },
        )
        .await
        .unwrap();

        latency_per_epoch.push(
            latency_per_epoch_tmp
                .clone()
                .lock()
                .await
                .iter()
                .sum::<u128>()
                / (request_per_epoch as u128),
        );
        sleep(Duration::from_secs(5)).await;
    }
    let latency_tmp = latency.lock().await;
    let sum = latency_tmp.iter().sum::<u128>();
    let avg = sum / latency_tmp.len() as u128;

    return (
        avg,
        completed.load(Ordering::SeqCst),
        failed.load(Ordering::SeqCst),
        latency_per_epoch,
    );
}

#[tokio::main]
async fn main() {
    env_logger::init();

    // Check environment variables
    // Fetch the function to execute from environment
    let mut function_path = String::new();
    let function = env::var("SPARE_FUNCTION");
    match function {
        Ok(val) => {
            // Check if the file exists
            let path = Path::new(&val);
            if !path.exists() {
                //panic!("Function image {} does not exist", val); // Commented out for now, as the function image may reside in a different location depoending on the node
            }
            function_path = val;
        }
        Err(e) => {
            panic!("SPARE_FUNCTION environment variable not set: {}", e);
        }
    }

    // Parse arguments from CLI
    let args = Args::parse();
    let client = IggyClient::builder()
        .with_tcp()
        .with_server_address(args.broker_address)
        .build()
        .unwrap();

    client.connect().await.unwrap();
    client
        .login_user(DEFAULT_ROOT_USERNAME, DEFAULT_ROOT_PASSWORD)
        .await
        .unwrap();

    init_system(&client).await;

    let mut nodes = wait_for_nodes(&client, args.number_of_nodes).await.unwrap();

    generate_points_from_csv(&mut nodes, "../data/edge_nodes.csv");

    // Generate random point for the emergency
    let mut emergency = vec![Node {
        address: "emergency".to_string(),
        position: (0.0, 0.0),
    }];
    generate_points_from_csv(&mut emergency, "../data/edge_nodes.csv");

    let mut emergency = emergency.remove(0);

    // if more than 1/3 of nodes are within the emergency area, recompute emergency point
    while nodes
        .iter()
        .filter(|node| node.distance(&emergency) <= args.emergency_radius)
        .count()
        != (nodes.len() / 3)
    {
        println!("Recomputing emergency node");
        generate_points_from_csv(&mut nodes, "../data/edge_nodes.csv");
        let mut tmp = vec![Node {
            address: "emergency".to_string(),
            position: (0.0, 0.0),
        }];
        generate_points_from_csv(&mut tmp, "../data/edge_nodes.csv");
        emergency = tmp.remove(0);
    }

    println!("Emergency node position: {:?}", emergency.position);
    //Print all the nodes and their distances from the emergency node
    for node in nodes.clone().into_iter().enumerate() {
        println!(
            "Node: {:?}, Distance: {}",
            node.0,
            node.1.distance(&emergency)
        );
    }

    send_message(
        &client,
        BROADCAST_PARTITION_ID,
        Message {
            op: Operation::ADD_NODES,
            payload: Some(Payload::Nodes(nodes.clone())),
        },
    )
    .await
    .unwrap();

    // Wait for nodes to be ready
    sleep(Duration::from_secs(5)).await;

    // EXPERIMENT
    println!("Starting test with {} nodes", args.number_of_nodes);
    println!("NORMAL SCENARIO");
    let iterations = args.iterations;

    let (avg_normal_latency, completed_normal, failed_normal, latency_per_epoch_normal) =
        test(&client, iterations, nodes.clone(), &function_path).await;

    println!("EMERGENCY SCENARIO");
    let emergency = Emergency {
        position: emergency.position,
        radius: args.emergency_radius,
    };
    println!(
        "Emergency Position {:?} and Radius {}",
        emergency.position, emergency.radius
    );

    start_emergency(&client, emergency).await.unwrap();

    // Wait for nodes to be ready
    sleep(Duration::from_secs(5)).await;

    let (avg_emergency_latency, completed_emergency, failed_emergency, latency_per_epoch_emergency) =
        test(&client, iterations, nodes.clone(), &function_path).await;

    stop_emergency(&client).await.unwrap();

    // Compute average latency

    send_message(
        &client,
        BROADCAST_PARTITION_ID,
        Message {
            op: Operation::END,
            payload: None,
        },
    )
    .await
    .unwrap();

    println!(
        "Normal Scenario - Average Latency: {} ms, Completed: {}, Failed: {}",
        avg_normal_latency, completed_normal, failed_normal
    );

    println!(
        "Emergency Scenario - Average Latency: {} ms, Completed: {}, Failed: {}",
        avg_emergency_latency, completed_emergency, failed_emergency
    );
    // Open or create files for datasets
    let file_path_normal = "latency_per_epoch_normal.csv";
    //if file already exists, clear it
    if Path::new(file_path_normal).exists() {
        fs::remove_file(file_path_normal).await.unwrap();
    }
    let mut file_normal = OpenOptions::new()
        .write(true)
        .create(true)
        .append(false)
        .open(file_path_normal)
        .unwrap();

    let file_path_emergency = "latency_per_epoch_emergency.csv";
    //if file already exists, clear it
    if Path::new(file_path_emergency).exists() {
        fs::remove_file(file_path_emergency).await.unwrap();
    }
    let mut file_emergency = OpenOptions::new()
        .write(true)
        .create(true)
        .append(false)
        .open(file_path_emergency)
        .unwrap();

    let file_path_summary = "latency_summary.csv";
    //if file already exists, clear it
    if Path::new(file_path_summary).exists() {
        fs::remove_file(file_path_summary).await.unwrap();
    }
    let mut file_summary = OpenOptions::new()
        .write(true)
        .create(true)
        .append(false)
        .open(file_path_summary)
        .unwrap();

    // Write headers if files are new
    if file_normal.metadata().unwrap().len() == 0 {
        writeln!(file_normal, "Epoch,Normal Latency").unwrap();
    }
    if file_emergency.metadata().unwrap().len() == 0 {
        writeln!(file_emergency, "Epoch,Emergency Latency").unwrap();
    }
    if file_summary.metadata().unwrap().len() == 0 {
        writeln!(
            file_summary,
            "Scenario,Average Latency,Completed Requests,Failed Requests"
        )
        .unwrap();
    }

    // Write latencies per epoch for normal and emergency scenarios
    for (epoch, lat) in latency_per_epoch_normal.iter().enumerate() {
        writeln!(file_normal, "{},{}", epoch, lat).unwrap();
    }
    for (epoch, lat) in latency_per_epoch_emergency.iter().enumerate() {
        writeln!(file_emergency, "{},{}", epoch, lat).unwrap();
    }

    // Write summary data for each scenario
    writeln!(
        file_summary,
        "Normal,{},{},{}",
        avg_normal_latency, completed_normal, failed_normal
    )
    .unwrap();
    writeln!(
        file_summary,
        "Emergency,{},{},{}",
        avg_emergency_latency, completed_emergency, failed_emergency
    )
    .unwrap();

    println!(
        "Results written to {}, {}, and {}",
        file_path_normal, file_path_emergency, file_path_summary
    );
}
