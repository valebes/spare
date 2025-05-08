use std::str::FromStr;

use iggy::{
    client::{MessageClient, StreamClient, TopicClient},
    clients::client::IggyClient,
    compression::compression_algorithm::CompressionAlgorithm,
    consumer::Consumer,
    error::IggyError,
    identifier::Identifier,
    messages::{poll_messages::PollingStrategy, send_messages::Partitioning},
    utils::expiry::IggyExpiry,
};
use log::{error, info, warn};
use serde::{Deserialize, Serialize};

use crate::{Emergency, Message, Node, Payload, Period};

pub const STREAM_ID: u32 = 1;
pub const TOPIC_ID: u32 = 1;
pub const ANNOUNCE_PARTITION_ID: u32 = 1;
pub const BROADCAST_PARTITION_ID: u32 = 2;

#[derive(PartialEq, Eq, Deserialize, Serialize)]
pub enum Operation {
    START_EMERGENCY = 0,
    STOP_EMERGENCY = 1,
    ADD_NODES = 2,
    ANNOUNCE = 3,
    END = 4,
    WRITE_STATS = 5,
}

#[derive(serde::Deserialize, serde::Serialize)]
pub struct InvokeFunction {
    pub function: String,
    pub image: String,
    pub vcpus: i32,
    pub memory: i32,
    pub payload: Option<String>,
    pub emergency: bool,
    pub hops: i32,
}

// Initializes stream and topic
pub async fn init_system(client: &IggyClient) {
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
pub async fn send_message(
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
pub async fn receive_message(client: &IggyClient) -> Result<Message, IggyError> {
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
pub async fn wait_for_nodes(
    client: &IggyClient,
    number_of_nodes: i32,
) -> Result<Vec<Node>, IggyError> {
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

pub async fn start_emergency(client: &IggyClient, emergency: Emergency) -> Result<(), IggyError> {
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

pub async fn stop_emergency(client: &IggyClient) -> Result<(), IggyError> {
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
