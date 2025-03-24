use longitude::Location;

use super::{Distance, NeighborNode};

/// Struct that implements the Distance trait
/// and represents the emergency point.
#[derive(Clone)]
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
