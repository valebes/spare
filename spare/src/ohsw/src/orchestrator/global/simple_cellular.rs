use std::time::Instant;

use log::info;
use longitude::Location;
use rand::thread_rng;
use rand_distr::{Distribution, Exp};

use super::{NeighborNode, NeighborNodeWithLatency};

/// Neighbour Node Selection strategy in which the distance
/// is calculated with a simple model that describes the
/// latency between two nodes connected through the
/// same base station.
#[derive(Clone)]
pub struct SimpleCellular {
    /// The position of the node
    pub position: (f64, f64), // As Longitude and Latitude
    pub address: String,
    pub emergency: bool,
    pub latency: f64,
    pub last_update: Instant, // Last time the node was updated
}
impl NeighborNode for SimpleCellular {
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
impl super::Distance for SimpleCellular {
    fn distance(&mut self, node: &mut dyn NeighborNode) -> f64 {
        let location_a = Location::from(self.position.0, self.position.1);
        let location_b = Location::from(node.position().0, node.position().1);

        location_a.distance(&location_b).meters()
    }
}
impl super::Latency for SimpleCellular {
    fn latency(&mut self, node: &mut dyn NeighborNodeWithLatency) -> f64 {
        if self.latency == 0.0 || self.last_update.elapsed().as_secs() > 60 {
            self.last_update = Instant::now();
            self.estimate_latency(node);
        }
        self.latency
    }
}
impl SimpleCellular {
    /// Create a new SimpleCellular
    /// # Arguments
    /// * `position` - Position of the node
    /// * `address` - Address of the node
    /// # Returns
    /// * A new SimpleCellular
    pub fn new(position: (f64, f64), address: String) -> Self {
        Self {
            position,
            address,
            emergency: false,
            latency: 0.0,
            last_update: Instant::now(),
        }
    }

    /// Estimate the latency between the current node and another node
    /// # Arguments
    /// * `node` - The target node to calculate the latency
    /// # Returns
    /// * Updates the `latency` field of the current node with the estimated latency
    /// # Note
    /// This function uses a simplified model to estimate latency based on:
    /// - The speed of light in air and fiber
    /// - The distance between nodes (calculated using the Haversine formula)
    /// - Transmission and queuing delays in the network
    /// - Assumptions about access and backhaul network properties
    pub fn estimate_latency(&mut self, node: &mut dyn NeighborNodeWithLatency) {
        let location_a = Location::from(self.position.0, self.position.1);
        let location_b = Location::from(node.position().0, node.position().1);

        let distance = location_a.distance(&location_b).meters();

        // Constants
        const SPEED_OF_LIGHT_AIR: f64 = 3.0e8; // Speed of light in air (m/s)
        const SPEED_OF_LIGHT_FIBER: f64 = 3.0e8 / 1.5; // Speed of light in fiber (m/s)

        const PACKET_SIZE: f64 = 1500.0 * 8.0; // Packet size in bits (1500 bytes)
        const ACCESS_BANDWIDTH: f64 = 100.0 * 1e6; // Access network bandwidth (100 Mbps)
        const BACKHAUL_BANDWIDTH: f64 = 10.0 * 1e9; // Backhaul network bandwidth (10 Gbps)
        const MAX_WIRELESS_DISTANCE: f64 = 500.0; // Maximum wireless antenna range (meters)
        const MAX_BACKHAUL_DISTANCE: f64 = 10000.0; // Maximum fiber backhaul distance (10 km)

        // Determine the number of hops
        let same_bs = distance <= MAX_WIRELESS_DISTANCE; // Check if nodes are under the same base station
        let access_hops = if same_bs { 1 } else { 2 }; // One hop if same BS, two hops otherwise

        // Compute propagation delays
        let propagation_delay_access = distance.min(MAX_WIRELESS_DISTANCE) / SPEED_OF_LIGHT_AIR;

        let mut backhaul_distance = 0.0;

        let backhaul_hops = if same_bs {
            0 // No backhaul needed if nodes are under the same BS
        } else {
            backhaul_distance = distance - MAX_WIRELESS_DISTANCE;
            (backhaul_distance / MAX_BACKHAUL_DISTANCE).ceil() as u32 // Calculate backhaul hops
        };

        let propagation_delay_backhaul = if backhaul_hops > 0 {
            backhaul_distance / SPEED_OF_LIGHT_FIBER
        } else {
            0.0
        };

        // Compute transmission delays
        let transmission_delay_access = PACKET_SIZE / ACCESS_BANDWIDTH; // Transmission delay in access network
        let transmission_delay_backhaul = PACKET_SIZE / BACKHAUL_BANDWIDTH; // Transmission delay in backhaul network

        // **Queuing delay model**
        let exp_distribution = Exp::new(1.0 / 0.0005).unwrap(); // Exponential distribution for queuing delay

        // Compute total latency
        self.latency = propagation_delay_access * access_hops as f64; // Start with access propagation delay
                                                                      // Add access network delays (queuing + transmission)
        for _ in 0..access_hops {
            let queuing_delay = exp_distribution.sample(&mut thread_rng());
            self.latency += queuing_delay + transmission_delay_access;
        }

        // Add backhaul network delays (propagation + queuing + transmission)
        self.latency += propagation_delay_backhaul * backhaul_hops as f64;
        for _ in 0..backhaul_hops {
            let queuing_delay = exp_distribution.sample(&mut thread_rng());
            self.latency += queuing_delay + transmission_delay_backhaul;
        }
    }
}
