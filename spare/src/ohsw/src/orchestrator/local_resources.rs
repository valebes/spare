use serde::{Deserialize, Serialize};

use super::OrchestratorError;

/// Struct that represents the local resources of a node
#[derive(Deserialize, Serialize, Clone)]
pub struct LocalResources {
    cpus_available: usize,
    // TODO: Put capabilities of the node
}

impl LocalResources {
    /// Create a new LocalResources object
    pub fn new() -> Self {
        Self {
            cpus_available: num_cpus::get(),
        }
    }

    /// Get the number of available CPUs
    pub fn get_available_cpus(&self) -> usize {
        self.cpus_available
    }

    /// Acquire a number of CPUs
    pub fn acquire_cpus(&mut self, cpus: usize) -> Result<(), OrchestratorError> {
        match self.cpus_available.checked_sub(cpus) {
            Some(x) => {
                self.cpus_available = x;
                Ok(())
            }
            None => Err(OrchestratorError::InsufficientResources),
        }
    }

    /// Release a number of CPUs
    pub fn release_cpus(&mut self, cpus: usize) -> Result<(), OrchestratorError> {
        match self.cpus_available.checked_add(cpus) {
            Some(x) => {
                self.cpus_available = x;
                Ok(())
            }
            None => Err(OrchestratorError::InsufficientResources),
        }
    }

    /// Get the total memory of the node
    pub fn get_total_memory() -> usize {
        let contents = std::fs::read_to_string("/proc/meminfo");
        if contents.is_err() {
            return 0;
        }
        let contents = contents.unwrap();
        let mem_info = contents.lines().find(|line| line.starts_with("MemTotal"));
        if mem_info.is_none() {
            return 0;
        }
        let mem_info = mem_info.unwrap();
        let size = mem_info.split_whitespace().nth(1).expect("Found the size");
        let total_mem = size.parse().unwrap();
        total_mem
    }

    /// Get the currently available free memory
    pub fn get_available_memory() -> usize {
        let contents = std::fs::read_to_string("/proc/meminfo");
        if contents.is_err() {
            return 0;
        }
        let contents = contents.unwrap();
        let mem_info = contents
            .lines()
            .find(|line| line.starts_with("MemAvailable"));
        if mem_info.is_none() {
            return 0;
        }
        let mem_info = mem_info.unwrap();

        let size = mem_info.split_whitespace().nth(1);
        if size.is_none() {
            return 0;
        }
        let size = size.unwrap();
        let available_mem = size.parse().unwrap();
        available_mem
    }
}

// Unit tests
#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_total_memory() {
        let total_mem = LocalResources::get_total_memory();
        assert!(total_mem > 0);
    }

    #[test]
    fn test_available_memory() {
        let available_mem = LocalResources::get_available_memory();
        assert!(available_mem > 0);
    }
}
