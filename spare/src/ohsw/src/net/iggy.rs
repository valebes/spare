use std::str::FromStr;

use iggy::{
    client::{Client, MessageClient, UserClient},
    clients::client::IggyClient,
    consumer::Consumer,
    error::IggyError,
    identifier::Identifier,
    messages::{poll_messages::PollingStrategy, send_messages::Partitioning},
    users::defaults::{DEFAULT_ROOT_PASSWORD, DEFAULT_ROOT_USERNAME},
};
use serde::{Deserialize, Serialize};

use crate::orchestrator::Node;

const STREAM_ID: u32 = 1;
const TOPIC_ID: u32 = 1;
const ANNOUNCE_PARTITION_ID: u32 = 1;
const BROADCAST_PARTITION_ID: u32 = 2;

#[derive(PartialEq, Eq, Deserialize, Serialize)]
pub enum Operation {
    START_EMERGENCY = 0,
    STOP_EMERGENCY = 1,
    ADD_NODES = 2,
    ANNOUNCE = 3,
    END = 4,
    WRITE_STATS = 5,
}

#[derive(Deserialize, Serialize)]
pub struct Message {
    pub op: Operation,
    pub payload: Option<Vec<Node>>,
}

/// Receive message from topic
/// Please note that is NOT BLOCKING
async fn receive_message(client: &IggyClient) -> Result<Option<Message>, IggyError> {
    let polled_messages = client
        .poll_messages(
            &STREAM_ID.try_into()?,
            &TOPIC_ID.try_into()?,
            Some(BROADCAST_PARTITION_ID),
            &Consumer::new(
                Identifier::named(&local_ip_address::local_ip().unwrap().to_string()).unwrap(),
            ),
            &PollingStrategy::next(),
            1,
            true,
        )
        .await?;

    if polled_messages.messages.is_empty() {
        return Ok(None);
    }

    let deserialized =
        serde_json::from_slice::<Message>(&polled_messages.messages[0].payload).unwrap();
    return Ok(Some(deserialized));
}

/// Send message to a topic
async fn send_message(client: &IggyClient, message: Message) -> Result<(), IggyError> {
    let message =
        iggy::messages::send_messages::Message::from_str(&serde_json::to_string(&message).unwrap())
            .unwrap();

    client
        .send_messages(
            &STREAM_ID.try_into().unwrap(),
            &TOPIC_ID.try_into().unwrap(),
            &Partitioning::partition_id(ANNOUNCE_PARTITION_ID),
            &mut [message],
        )
        .await
}

/// Connect to the Iggy message broker
async fn connect(host: &str) -> Result<IggyClient, IggyError> {
    let client = IggyClient::builder()
        .with_tcp()
        .with_server_address(host.to_owned())
        .build()
        .unwrap();

    client.connect().await.unwrap();
    let _ = client
        .login_user(DEFAULT_ROOT_USERNAME, DEFAULT_ROOT_PASSWORD)
        .await;
    Ok(client)
}

/// Register a node with the Iggy message broker
async fn register_node(client: &IggyClient, node: Node) -> Result<(), IggyError> {
    send_message(
        client,
        Message {
            op: Operation::ANNOUNCE,
            payload: Some(vec![node]),
        },
    )
    .await
}

/// IggyConnector is a wrapper around the IggyClient that provides a simplified interface
/// for interacting with the Iggy message broker.
pub struct IggyConnector {
    client: IggyClient,
}

impl IggyConnector {
    pub async fn new(host: &str) -> Self {
        let client = connect(host).await.unwrap();
        Self { client }
    }

    pub async fn register_node(&self, node: Node) -> Result<(), IggyError> {
        register_node(&self.client, node).await
    }

    pub async fn receive_message(&self) -> Result<Option<Message>, IggyError> {
        receive_message(&self.client).await
    }
}
