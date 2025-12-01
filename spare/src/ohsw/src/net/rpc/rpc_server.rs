use std::sync::{Arc, Mutex};
use std::time::Duration;

use log::info;
use tonic::{transport::Server, Request, Response, Status};

use crate::orchestrator::Orchestrator;

use resources::resources_server::{Resources, ResourcesServer};
use resources::ResourcesReply;

pub mod resources {
    tonic::include_proto!("resources"); // The string specified here must match the proto package name
}

pub struct RPCServer {
    orchestrator: Arc<Orchestrator>,
    shutdown: Arc<Mutex<bool>>,
}

impl RPCServer {
    pub fn new(orchestrator: Arc<Orchestrator>, shutdown: Arc<Mutex<bool>>) -> Self {
        Self {
            orchestrator,
            shutdown,
        }
    }

    pub async fn serve(self, addr: std::net::SocketAddr) -> Result<(), Box<dyn std::error::Error>> {
        info!("RPC Server listening on {}", addr);

        // Create shutdown future that polls the flag
        let shutdown_signal = {
            let shutdown = self.shutdown.clone();
            async move {
                loop {
                    if *shutdown.lock().unwrap() {
                        info!("RPC server received shutdown signal");
                        break;
                    }
                    actix_web::rt::time::sleep(Duration::from_millis(100)).await;
                }
            }
        };

        Server::builder()
            .add_service(ResourcesServer::new(self))
            .serve_with_shutdown(addr, shutdown_signal)
            .await?;

        info!("RPC Server shut down gracefully");
        Ok(())
    }
}

#[tonic::async_trait]
impl Resources for RPCServer {
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
