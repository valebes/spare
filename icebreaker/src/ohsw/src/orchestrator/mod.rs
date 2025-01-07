//! Orchestrator module. It is responsible for managing the local resources and monitoring the remote nodes
pub mod global_resources;
mod local_resources;

use std::sync::{Mutex, RwLock};

use crate::api::resources::Resources;
use global_resources::Node;
use instant_distance::Point;
use local_resources::LocalResources;
use log::{error, info, warn};

/// Error returned by the orchestrator
pub enum OrchestratorError {
    InsufficientResources,
}

/// Orchestrator. It is responsible for managing the local resources and monitoring the remote nodes
/// available in the system.
pub struct Orchestrator {
    in_emergency_area: Mutex<bool>,
    resources: Mutex<local_resources::LocalResources>,
    global_resources: RwLock<global_resources::GlobalResources>,
}

impl Orchestrator {
    /// Create a new orchestrator
    /// # Arguments
    /// * `nodes` - Vector of nodes in the system
    /// * `identity` - Identity of the node itself
    /// # Returns
    /// * A new orchestrator
    pub fn new(nodes: Vec<Node>, identity: Node) -> Self {
        Self {
            in_emergency_area: Mutex::new(false),
            resources: Mutex::new(local_resources::LocalResources::new()),
            global_resources: RwLock::new(global_resources::GlobalResources::new(nodes, identity)),
        }
    }

    /// Get the identity of the node itself
    pub fn get_identity(&self) -> Node {
        self.global_resources.read().unwrap().identity.clone()
    }

    /// Get if the node is in the emergency area
    pub fn in_emergency_area(&self) -> bool {
        *self.in_emergency_area.lock().unwrap()
    }

    /// Set the emergency mode
    pub fn set_emergency(&self, emergency: bool, emergency_point: (i32, i32), radius: f32) {
        if emergency {
            info!(
                "Entering emergency mode. Emergency point: {:?}",
                emergency_point
            );
            let mut lock = self.global_resources.write().unwrap();
            lock.compute_emergency_nodes(emergency_point, radius);
            if lock.identity.distance(&Node {
                address: "emergency".to_string(),
                position: emergency_point,
            }) <= radius
            {
                error!("Node is in the emergency zone");
                *self.in_emergency_area.lock().unwrap() = true;
            }
        } else {
            info!("Leaving emergency mode");
            self.global_resources
                .write()
                .unwrap()
                .clean_emergency_nodes();
            *self.in_emergency_area.lock().unwrap() = false;
        }
    }

    /// Get the number of available nodes
    pub fn number_of_nodes(&self) -> usize {
        self.global_resources.read().unwrap().len()
            - self.global_resources.read().unwrap().emergency_nodes.len()
    }

    /// Get the nth node available in the system
    pub fn get_remote_nth_node(&self, index: usize) -> Option<Node> {
        self.global_resources.read().unwrap().nth(index)
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
