//! Orchestrator module. It is responsible for managing the local resources and monitoring the remote nodes
pub mod global;
mod local_resources;

use std::sync::{Mutex, RwLock};

use crate::api::{invoke::InvokeFunction, resources::Resources};
use actix_web::web;
use awc::Client;
use global::{emergency::Emergency, geo_distance::GeoDistance, simple_cellular::SimpleCellular, *};
use local_resources::LocalResources;
use log::{error, info, warn};
use serde::{Deserialize, Serialize};

// TODO: Move this inside the node module
pub enum InvokeError {
    Unknown,
}

#[derive(Deserialize, Serialize, Clone, Debug)]
pub struct Node {
    pub address: String, // Ip:Port
    pub position: (f64, f64),
}
impl Node {
    pub fn new(address: String, position: (f64, f64)) -> Self {
        Self { address, position }
    }

    pub fn address(&self) -> String {
        self.address.clone()
    }

    pub fn position(&self) -> (f64, f64) {
        self.position
    }

    /// Invoke a function in a remote node
    pub async fn invoke(&mut self, mut data: InvokeFunction) -> Result<web::Bytes, InvokeError> {
        data.hops += 1;
        let client = Client::default();

        let invoke = client
            .post(format!("http://{}/invoke", self.address()))
            .content_type("application/json")
            .send_json(&data)
            .await;

        if invoke.is_err() {
            return Err(InvokeError::Unknown);
        } else {
            let mut invoke = invoke.unwrap();
            if invoke.status().is_success() {
                match invoke.body().await {
                    Ok(body) => Ok(body),
                    Err(_) => Err(InvokeError::Unknown),
                }
            } else {
                Err(InvokeError::Unknown)
            }
        }
    }
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
    identity: RwLock<GeoDistance>,
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

        Self {
            in_emergency_area: Mutex::new(false),
            resources: Mutex::new(local_resources::LocalResources::new()),
            identity: RwLock::new(GeoDistance::new(identity.position, identity.address)),
            global_resources: RwLock::new(neighbor_nodes),
        }
    }

    /// Sort the nodes based on the strategy
    pub fn sort_nodes(&self) {
        self.global_resources
            .write()
            .unwrap()
            .sort(&mut self.get_identity());
    }

    /// Get the identity of the node itself
    pub fn get_identity(&self) -> GeoDistance {
        let lock = self.identity.write().unwrap();
        lock.clone()
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
            .filter(|node| !node.emergency())
            .count();
        warn!("Total Number of Nodes:{}, Nodes Available: {}", lock.nodes.len(), res);
        res
    }

    /// Get the nth node available in the system
    pub fn get_remote_nth_node(&self, index: usize) -> Option<Node> {
        let lock = self.global_resources.read().unwrap();
        let node = lock.get_nth(index);
        match node {
            Some(node) => Some(Node::new(node.address(), node.position())),
            None => None,
        }
    }

    /// Get the resources available in the node
    pub fn get_resources(&self) -> Resources {
        Resources {
            cpus: self.resources.lock().unwrap().get_available_cpus(),
            memory: LocalResources::get_available_memory(),
        }
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
