use tonic::{transport::Server, Request, Response, Status};

use crate::orchestrator::{Orchestrator, local_resources};

pub mod resources {
    tonic::include_proto!("resources"); // The string specified here must match the proto package name
}

#[derive(Debug, Default)]
pub struct RPCServer {
    orchestrator: Arc<Orchestrator>
}

impl RPCServer {
    pub fn new(orchestrator: Arc<Orchestrator>) -> Self {
        Self { orchestrator }
    }

    pub fn serve(self, addr: std::net::SocketAddr) -> Result<(), Box<dyn std::error::Error>> {
        let rpc_server = self;

        tokio::spawn(async move {
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
    ) -> Result<Response<ResourcesReply>, Status> { 

        let resources = self.orchestrator.get_local_resources();

        let reply = ResourcesReply {
            cpu_cores: resources.cpu_cores as u64,
            memory_mb: resources.memory_mb as u64,
        };

        Ok(Response::new(reply)) 
}