use longitude::{Distance, Location};
use rand_distr::{Distribution, Normal};

use super::NeighborNode;

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
        }
    }

    /// Estimate the latency between the node and the current node
    /// # Arguments
    /// * `node` - Node to calculate the latency
    /// # Returns
    /// * The latency between the node and the current node
    /// # Note 
    /// This function uses a simple model to calculate the latency
    /// between two nodes connected through the same base station.
    /// The latency is calculated as the distance between the two
    /// nodes divided by the speed of light.
    /// The speed of light is considered to be 299,792,458 m/s.
    /// The distance is calculated using the Haversine formula.
    /// The Haversine formula calculates the distance between two
    /// points on the surface of a sphere given their longitudes
    /// and latitudes.
    pub fn estimate_latency(&mut self, node: &impl NeighborNode){
        let location_a = Location::from(self.position.0, self.position.1);
        let location_b = Location::from(node.position().0, node.position().1);

        let distance = location_a.distance(&location_b).meters();
        
        // Constants
        const SPEED_OF_LIGHT: f64 = 3.0e8; // Speed of light in m/s
        const PACKET_SIZE: f64 = 10.0 * 1024.0 * 1024.0; // 10 MB in bytes
        const BANDWIDTH: f64 = 10.0 * 1e6; // 10 Mbps in bits per second
        const MEAN_DELAY: f64 = 0.5; // Mean of queuing/processing delay
        const STD_DEV_DELAY: f64 = 0.2; // Standard deviation of queuing/processing delay

        // Calculate propagation delay
        let propagation_delay = distance / SPEED_OF_LIGHT;

        // Calculate transmission delay
        let transmission_delay = PACKET_SIZE / BANDWIDTH;

        // Simulate queuing/processing delay
        let normal_distribution = Normal::new(MEAN_DELAY, STD_DEV_DELAY).unwrap();
        let queuing_delay = normal_distribution.sample(&mut rand::rng());

        // Total latency
        self.latency = propagation_delay + (2.0 * transmission_delay) + queuing_delay;
    }
}
