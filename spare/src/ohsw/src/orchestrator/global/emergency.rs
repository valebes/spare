use super::{Distance, NeighborNode, NeighborNodeWithDistance};
use longitude::Location;
use serde::{Deserialize, Serialize};

/// Struct that implements the Distance trait
/// and represents the emergency point.
#[derive(Clone, Deserialize, Serialize, Copy)]
pub struct Emergency {
    /// The position of the emergency point
    pub position: (f64, f64),
    /// The radius of the emergency point
    pub radius: f64,
}
impl Distance for Emergency {
    fn distance(&mut self, node: &mut dyn NeighborNode) -> f64 {
        let location_a = Location::from(self.position.0, self.position.1);
        let location_b = Location::from(node.position().0, node.position().1);

        location_a.distance(&location_b).meters()
    }
}

impl NeighborNode for Emergency {
    fn position(&self) -> (f64, f64) {
        self.position
    }

    fn address(&self) -> String {
        "".to_string()
    }

    fn emergency(&self) -> bool {
        true
    }

    fn set_emergency(&mut self, emergency: bool) {
        panic!("Emergency node cannot be set as emergency");
    }
}
