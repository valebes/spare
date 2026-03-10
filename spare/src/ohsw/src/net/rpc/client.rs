use crate::api::resources::Resources as ApiResources;
use resources::resources_client::ResourcesClient;

pub mod resources {
    tonic::include_proto!("resources");
}

#[derive(Clone)]
pub struct Client {
    address: String,
}

impl Client {
    pub fn new(address: &str) -> Self {
        Self {
            address: address.to_string(),
        }
    }

    pub async fn get_resources(&self) -> Result<ApiResources, Box<dyn std::error::Error>> {
        let mut client = ResourcesClient::connect(format!("http://{}", self.address)).await?;
        let request = tonic::Request::new(());
        let response = client.get_resources(request).await?;
        let resources_reply = response.into_inner();
        Ok(ApiResources {
            cpus: resources_reply.cpu as usize,
            memory: resources_reply.memory as usize,
        })
    }
}