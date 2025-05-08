use log::error;
use longitude::Location;
use rand::thread_rng;

use super::{NeighborNode, NeighborNodeWithLatency};

/// Neighbour Node Selection strategy in which latency is estimated
/// and updated over time using a running average.
#[derive(Clone)]
pub struct SmartLatency {
    pub position: (f64, f64), // Longitude and Latitude
    pub address: String,
    pub emergency: bool,
    pub latency: f64,        // Average latency
    pub sample_count: usize, // How many samples were considered
}

impl SmartLatency {
    pub fn new(position: (f64, f64), address: String) -> Self {
        Self {
            position,
            address,
            emergency: false,
            latency: f64::MAX,
            sample_count: 0,
        }
    }
}

impl NeighborNode for SmartLatency {
    fn address(&self) -> String {
        self.address.clone()
    }

    fn position(&self) -> (f64, f64) {
        self.position
    }

    fn emergency(&self) -> bool {
        self.emergency
    }

    fn set_emergency(&mut self, emergency: bool) {
        self.emergency = emergency;
    }
}

impl super::Distance for SmartLatency {
    fn distance(&self, node: &mut dyn NeighborNode) -> f64 {
        let location_a = Location::from(self.position.0, self.position.1);
        let location_b = Location::from(node.position().0, node.position().1);
        location_a.distance(&location_b).meters()
    }
}

impl super::Latency for SmartLatency {
    fn latency(&mut self, _node: &mut dyn NeighborNodeWithLatency) -> f64 {
        self.latency
    }
    fn update_latency(&mut self, new_latency: f64) {
        if self.sample_count == 0 {
            self.latency = 0.0;
        }
        self.sample_count += 1;
        self.latency += (new_latency - self.latency) / self.sample_count as f64;
        error!("Updated latency: {}", self.latency);
    }
}
