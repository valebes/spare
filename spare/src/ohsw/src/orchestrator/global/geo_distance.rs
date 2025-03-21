use longitude::Location;

use super::{Distance, NeighborNode, NeighborNodeList, NeighborNodeWithDistance};

/// Neighbour Node Selection strategy in which the distance
/// is calculated using the Haversine formula.
#[derive(Clone)]
pub struct GeoDistance {
    /// The position of the node
    pub position: (f64, f64), // As Longitude and Latitude
    pub address: String,
    pub emergency: bool,
}
impl NeighborNode for GeoDistance {
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
impl Distance for GeoDistance {
    fn distance(&mut self, node: &mut dyn NeighborNode) -> f64 {
        let location_a = Location::from(self.position.0, self.position.1);
        let location_b = Location::from(node.position().0, node.position().1);

        location_a.distance(&location_b).meters()
    }
}
impl GeoDistance {
    /// Create a new GeoDistance
    /// # Arguments
    /// * `position` - Position of the node as (Longitude, Latitude)
    /// * `address` - Address of the node
    /// # Returns
    /// * A new GeoDistance
    pub fn new(position: (f64, f64), address: String) -> Self {
        Self {
            position,
            address,
            emergency: false,
        }
    }
}

/// Given a NeighborNodeList, return the closest nth-node to the given position
/// # Arguments
/// * `nodes` - List of nodes
/// * `position` - Position to calculate the distance
/// # Returns
/// * The closest nth node that is not in emergency mode
/// * None if no node is available
pub fn get_nth_closest_node(
    nodes: &NeighborNodeList,
    position: (f64, f64),
    n: usize,
) -> Option<&dyn NeighborNode> {
    // The list is already sorted by distance
    let mut count = 0;
    for node in nodes.nodes.iter() {
        if !node.emergency() {
            count += 1;
            if count == n {
                return Some(&**node);
            }
        }
    }
    None
}
