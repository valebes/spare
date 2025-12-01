use std::sync::Arc;

use log::info;
use tonic::{transport::Server, Request, Response, Status};

use crate::orchestrator::{Orchestrator};

use resources::resources_server::{Resources, ResourcesServer};
use resources::{ResourcesReply};

pub mod resources {
    tonic::include_proto!("resources"); // The string specified here must match the proto package name
}

pub struct RPCServer {
    orchestrator: Arc<Orchestrator>
}

impl RPCServer {
    pub fn new(orchestrator: Arc<Orchestrator>) -> Self {
        Self { orchestrator }
    }

    pub fn serve(self, addr: std::net::SocketAddr) -> Result<(), Box<dyn std::error::Error>> {
        let rpc_server = self;

        actix_web::rt::spawn(async move {
            info!("RPC Server listening on {}", addr);

            Server::builder()
                .add_service(ResourcesServer::new(rpc_server))
                .serve(addr)
                .await
                .unwrap();
        });

        Ok(())
    }
}

#[tonic::async_trait]
impl Resources for RPCServer  {
    async fn get_resources(
        &self,
        _request: Request<()>,
    ) -> Result<Response<ResourcesReply>, Status> { 

        let resources = self.orchestrator.get_resources();

        let reply = ResourcesReply {
            cpu: resources.cpus as i64,
            memory: resources.memory as i64,
        };

        Ok(Response::new(reply)) 
}
} 