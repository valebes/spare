use longitude::Location;
use serde::{Deserialize, Serialize};

use super::{Distance, NeighborNode};

#[derive(Deserialize, Serialize, Clone, Debug)]
pub struct Node {
    pub address: String, // Ip:Port
    pub position: (f64, f64),
}
impl Node {
    pub fn new(address: String, position: (f64, f64)) -> Self {
        Self { address, position }
    }
}
impl NeighborNode for Node {
    fn address(&self) -> String {
        self.address.clone()
    }

    fn position(&self) -> (f64, f64) {
        self.position
    }

    fn emergency(&self) -> bool {
        false
    }

    fn set_emergency(&mut self, _emergency: bool) {}
}
impl Distance for Node {
    fn distance(&self, node: &mut dyn NeighborNode) -> f64 {
        let location_a = Location::from(self.position.0, self.position.1);
        let location_b = Location::from(node.position().0, node.position().1);

        location_a.distance(&location_b).meters()
    }
}
