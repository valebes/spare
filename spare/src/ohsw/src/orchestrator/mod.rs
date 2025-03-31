//! Orchestrator module. It is responsible for managing the local resources and monitoring the remote nodes
pub mod global;
mod local_resources;

use std::sync::{Mutex, RwLock};

use crate::api::{self, invoke::InvokeFunction, resources::Resources};
use actix_web::{web, HttpRequest, HttpResponse};
use awc::{body::BoxBody, Client};
use global::{
    emergency::Emergency, geo_distance::GeoDistance, identity::Node, Distance, NeighborNode,
    NeighborNodeList, NeighborNodeStrategy, RemoteNode,
};
use local_resources::LocalResources;
use log::{error, info, warn};

// TODO: Move this inside the node module
pub enum InvokeError {
    Unknown,
}

/// Error returned by the orchestrator
pub enum OrchestratorError {
    InsufficientResources,
}

/// Orchestrator. It is responsible for managing the local resources and monitoring the remote nodes
/// available in the system.
pub struct Orchestrator {
    in_emergency_area: Mutex<bool>,
    resources: Mutex<local_resources::LocalResources>,
    identity: Node,
    global_resources: RwLock<NeighborNodeList>,
}

impl Orchestrator {
    /// Create a new orchestrator
    /// # Arguments
    /// * `nodes` - Vector of nodes in the system
    /// * `identity` - Identity of the node itself
    /// # Returns
    /// * A new orchestrator
    pub fn new(nodes: Vec<Node>, identity: Node) -> Self {
        let mut strategy = NeighborNodeStrategy::GeoDistance;
        // Read the strategy from the environment
        if let Ok(strategy_str) = std::env::var("STRATEGY") {
            match strategy_str.as_str() {
                "SimpleCellular" => strategy = NeighborNodeStrategy::SimpleCellular,
                "GeoDistance" => strategy = NeighborNodeStrategy::GeoDistance,
                _ => error!("Unknown strategy: {}.", strategy_str),
            }
        }

        let mut neighbor_nodes = NeighborNodeList::new(strategy);
        for node in nodes {
            neighbor_nodes.add_node(node.address, node.position);
        }

        // Sort the nodes based on the strategy
        neighbor_nodes.sort(&mut GeoDistance::new(identity.position, "".to_string()));

        Self {
            in_emergency_area: Mutex::new(false),
            resources: Mutex::new(local_resources::LocalResources::new()),
            identity: identity,
            global_resources: RwLock::new(neighbor_nodes),
        }
    }

    /// Get Strategy
    pub fn get_strategy(&self) -> NeighborNodeStrategy {
        self.global_resources.read().unwrap().strategy()
    }

    /// Sort the nodes based on the strategy
    pub fn sort_nodes(&mut self) {
        self.global_resources
            .write()
            .unwrap()
            .sort(&mut self.identity);
    }

    /// Get the identity of the node itself
    pub fn get_identity(&self) -> &Node {
        &self.identity
    }

    /// Get if the node is in the emergency area
    pub fn in_emergency_area(&self) -> bool {
        *self.in_emergency_area.lock().unwrap()
    }

    /// Set the emergency mode
    pub fn set_emergency(&self, emergency: bool, mut em_pos: Emergency) {
        let mut lock = self.global_resources.write().unwrap();
        if emergency {
            info!(
                "Entering emergency mode. Emergency point: {:?}",
                em_pos.position
            );
            lock.set_emergency(em_pos);
            let radius = em_pos.radius;
            if self.get_identity().distance(&mut em_pos) <= radius {
                error!("Node is in the emergency zone");
                *self.in_emergency_area.lock().unwrap() = true;
            }
        } else {
            info!("Leaving emergency mode");
            lock.clear_emergency();
            *self.in_emergency_area.lock().unwrap() = false;
        }
    }

    /// Get the number of available nodes
    pub fn number_of_nodes(&self) -> usize {
        let lock = self.global_resources.read().unwrap();
        // Count the number of nodes that are not in emergency mode
        let res = lock
            .nodes
            .iter()
            .filter(|node| !node.reveal().emergency())
            .count();
        info!(
            "Total Number of Nodes: {}, Nodes Available: {}",
            lock.nodes.len(),
            res
        );
        res
    }

    /// Given a node, find it in the list and return a mutable reference to it
    pub fn contains<'a>(
        &mut self,
        node: &mut RemoteNode,
        node_list: &'a mut NeighborNodeList,
    ) -> Option<&'a mut RemoteNode> {
        // Check if the node is in the list
        for n in node_list.nodes.iter_mut() {
            if n.reveal().address() == node.reveal().address() {
                return Some(n);
            }
        }
        None
    }
    
    /// Get the nth node available in the system
    pub fn get_remote_nth_node(
        &self,
        identity: &mut Node,
        index: usize,
    ) -> Option<RemoteNode> {
        let mut node_list = self.global_resources.write().unwrap();
        // Check the strategy
        match node_list.strategy() {
            NeighborNodeStrategy::SimpleCellular => {
                node_list.sort(identity);
            }
            _ => {} // Already sorted
        }

        let node = node_list.get_nth(index);
        match node {
            Some(node) => {
                if node.reveal().emergency() {
                    error!("Node is in emergency mode");
                    return None;
                }
                Some(node)
            }
            None => {
                error!("Node not found");
                None
            }
        }
    }

    /// Get the resources available in the node
    pub fn get_resources(&self) -> Resources {
        Resources {
            cpus: self.resources.lock().unwrap().get_available_cpus(),
            memory: LocalResources::get_available_memory(),
        }
    }

    /// Method to offload a function to a remote node
    pub async fn offload(
        &self,
        data: web::Json<InvokeFunction>,
        req: HttpRequest,
    ) -> HttpResponse<BoxBody> {
        let cpus = data.vcpus;
        let memory = data.memory;

        // Iterate over the nodes
        warn!("Function must be offloaded");
        for i in 0..self.number_of_nodes() {
            warn!("Checking node: {}", i);
            match self.get_remote_nth_node(
                &mut self.identity.clone(),
                i,
            ) {
                Some(node) => {
                    // Do not forward request to origin
                    if node
                        .reveal()
                        .address()
                        .contains(req.peer_addr().unwrap().ip().to_string().as_str())
                    {
                        continue;
                    }

                    // Check if resource are available on the remote node
                    let client = Client::default();
                    let response = client
                        .get(format!("http://{}/resources", node.reveal().address()))
                        .send()
                        .await;
                    if response.is_ok() {
                        let remote_resources =
                            response.unwrap().json::<api::resources::Resources>().await;
                        if remote_resources.is_err() {
                            // Cannot get resources from remote node, continue
                            continue;
                        }
                        match remote_resources {
                            Ok(remote_resources) => {
                                // Check if resources are available
                                let cpus = remote_resources.cpus.checked_sub(cpus as usize);
                                // Memory is in MB, so multiply by 1024
                                let memory = remote_resources
                                    .memory
                                    .checked_sub((memory * 1024) as usize);
                                // If resources are available, forward request
                                if cpus.is_some() && memory.is_some() {
                                    warn!("Forwarding request to {}", node.reveal().address());
                                    let body = node.invoke(data.clone()).await;
                                    match body {
                                        Ok(body) => {
                                            error!(
                                                "Successfully forwarded request to {}",
                                                node.reveal().address()
                                            );
                                            return HttpResponse::Ok().body(body);
                                        }
                                        Err(_) => {
                                            error!(
                                                "Failed to forward request to {}",
                                                node.reveal().address()
                                            );
                                            continue;
                                        }
                                    }
                                }
                            }
                            Err(_) => {
                                // Cannot get resources from remote node, continue
                                continue;
                            }
                        }
                    }
                }
                None => break,
            }
        }
        return HttpResponse::InternalServerError().body("Insufficient resources\n");
    }

    /// Check if the resources are available and acquire them
    /// # Arguments
    /// * `cpus` - Number of cpus to acquire
    /// * `memory` - Amount of memory to acquire in KB
    /// # Returns
    /// * Ok if the resources are available, Err otherwise
    /// # Errors
    /// * InsufficientResources if the resources are not available
    pub fn check_and_acquire_resources(
        &self,
        cpus: usize,
        memory: usize,
    ) -> Result<(), OrchestratorError> {
        info!("Requested {} cpus and {} MB", cpus, memory / 1024);
        let mut current_resources = self.resources.lock().unwrap();

        if cpus > current_resources.get_available_cpus() {
            warn!(
                "Insufficient cpus: {}",
                current_resources.get_available_cpus()
            );
            return Err(OrchestratorError::InsufficientResources);
        }

        if memory > LocalResources::get_available_memory() {
            warn!(
                "Insufficient memory: {}",
                LocalResources::get_available_memory()
            );
            return Err(OrchestratorError::InsufficientResources);
        }
        current_resources.acquire_cpus(cpus)?;

        info!("Acquired {} cpus and {} MB", cpus, memory / 1024);

        Ok(())
    }

    /// Release the resources
    pub fn release_resources(&self, cpus: usize) -> Result<(), OrchestratorError> {
        info!("Releasing {} cpus", cpus);
        self.resources.lock().unwrap().release_cpus(cpus)
    }
}
