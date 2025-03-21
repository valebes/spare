use serde::{Deserialize, Serialize};

/// Resources of the node
#[derive(Serialize, Deserialize)]
pub struct Resources {
    // The number of CPUs available on the node
    pub cpus: usize,
    // The amount of memory available on the node
    pub memory: usize,
}
