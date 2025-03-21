use dyn_clone::DynClone;
use longitude::Location;

pub mod simple_cellular;
pub mod geo_distance;
pub mod emergency;

/// Enum that represents the different strategies
/// available for the Neighbor Node Selection
/// strategy.
pub enum NeighborNodeStrategy {
    /// Strategy that uses the Haversine formula to calculate
    /// the distance between two points.
    GeoDistance,
    /// Strategy that uses a simple model to calculate the
    /// latency between two nodes connected through the
    /// same base station.
    SimpleCellular,
}


/// Trait that represents a Neighbor Node
pub trait NeighborNode: DynClone {
    /// Get the ip address of the node
    fn address(&self) -> String;

    /// Get the position of the node
    fn position(&self) -> (f64, f64);

    /// Check if the node is in emergency mode
    fn emergency(&self) -> bool;

    /// Set the emergency mode
    fn set_emergency(&mut self, emergency: bool);
}

pub trait Distance: DynClone {
    /// Get the distance between two points
    fn distance(&mut self, other: &mut dyn NeighborNode) -> f64;
}

/// Trait that represents a Neighbor Node with distance
pub trait NeighborNodeWithDistance: NeighborNode + Distance + DynClone {}
impl<T: NeighborNode + Distance + DynClone> NeighborNodeWithDistance for T {}

/// Struct that represents the Neighbor Nodes
/// available in the system.
pub struct NeighborNodeList {
    /// List of nodes
    pub nodes: Vec<Box<dyn NeighborNodeWithDistance>>,
    /// Strategy to calculate the distance
    strategy: NeighborNodeStrategy,
    /// Emergency Position and Radius
    emergency: Option<(f64, f64, f64)>, // (Longitude, Latitude, Radius in meters)
}
impl NeighborNodeList {
    /// Create a new empty NeighborNodeList.
    /// The user should pass the strategy to be used
    /// to calculate the distance between the nodes.
    /// # Arguments 
    /// * `strategy` - Strategy to calculate the distance
    /// # Returns
    /// * A new NeighborNodeList
    pub fn new(strategy: NeighborNodeStrategy) -> Self {
        Self {
            nodes: Vec::new(),
            strategy,
            emergency: None,
        }
    }

    /// Add a new node to the list
    /// # Arguments
    /// * 'address' - Address of the node
    /// * 'position' - Position of the node as (Longitude, Latitude)
    pub fn add_node(&mut self, address: String, position: (f64, f64)) {
        match self.strategy {
            NeighborNodeStrategy::GeoDistance => {
                self.nodes.push(Box::new(geo_distance::GeoDistance::new(position, address)));
            }
            NeighborNodeStrategy::SimpleCellular => {
                self.nodes.push(Box::new(simple_cellular::SimpleCellular::new(position, address)));
            }
        }
    }

    /// Set an emergency
    /// # Arguments
    /// * 'position' - Position of the emergency as (Longitude, Latitude)
    /// * 'radius' - Radius of the emergency in meters
    pub fn set_emergency(&mut self, position: (f64, f64), radius: f64) {
        self.emergency = Some((position.0, position.1, radius));
        for node in self.nodes.iter_mut() {
            let mut emergency = emergency::Emergency {
                position: (position.0, position.1),
                radius,
            };
            if emergency.distance(&mut **node) <= radius {
                node.set_emergency(true);
            }
        }
        
    }

    /// Clean the emergency
    pub fn clean_emergency(&mut self) {
        self.emergency = None;
        for node in self.nodes.iter_mut() {
            node.set_emergency(false);
        }
    }

    /// Get the closest nth-node to the current node
    /// # Arguments
    /// * `current` - Current node
    /// * 'nth' - Nth node to get
    /// # Returns
    /// * The closest node if it exists
    /// * None if the list is empty
    pub fn get_closest_node(&mut self, current: &dyn NeighborNodeWithDistance, nth: usize) -> Option<&dyn NeighborNodeWithDistance> {
        if self.nodes.is_empty() {
            return None;
        }

        // Here, depending on the strategy, we should calculate the closest node
        // to the current node.
        todo!()
    }

    /// Sort the nodes by distance from the current node
    /// # Arguments
    /// * `current` - Current node
    pub fn sort_by_distance(&mut self, current: &mut dyn NeighborNodeWithDistance) {
        let mut distances: Vec<(f64, usize)> = self
            .nodes
            .iter_mut()
            .enumerate()
            .map(|(i, node)| (node.distance(current), i))
            .collect();
    
        distances.sort_by(|a, b| a.0.partial_cmp(&b.0).unwrap());
    
        self.nodes = distances
        .into_iter()
        .map(|(_, i)| dyn_clone::clone_box(&*self.nodes[i])) // Use `dyn_clone` to clone the trait object
        .collect();
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_add_node() {
        let mut list = NeighborNodeList::new(NeighborNodeStrategy::GeoDistance);
        list.add_node("node1".to_string(), (0.0, 0.0));
        list.add_node("node2".to_string(), (1.0, 1.0));
        list.add_node("node3".to_string(), (2.0, 2.0));
        assert_eq!(list.nodes.len(), 3);
    }

    #[test]
    fn test_set_emergency() {
        let mut list = NeighborNodeList::new(NeighborNodeStrategy::GeoDistance);
        list.add_node("node1".to_string(), (0.0, 0.0));
        list.add_node("node2".to_string(), (1.0, 1.0));
        list.add_node("node3".to_string(), (2.0, 2.0));
        list.set_emergency((0.0, 0.0), 100.0);
        assert_eq!(list.nodes.iter().filter(|node| node.emergency()).count(), 1);
    }

    #[test]
    fn test_clean_emergency() {
        let mut list = NeighborNodeList::new(NeighborNodeStrategy::GeoDistance);
        list.add_node("node1".to_string(), (0.0, 0.0));
        list.add_node("node2".to_string(), (1.0, 1.0));
        list.add_node("node3".to_string(), (2.0, 2.0));
        list.set_emergency((0.0, 0.0), 100.0);
        list.clean_emergency();
        assert_eq!(list.nodes.iter().filter(|node| node.emergency()).count(), 0);
    }

    #[test]
    fn test_sort_by_distance() {
        let mut list = NeighborNodeList::new(NeighborNodeStrategy::GeoDistance);
        list.add_node("node3".to_string(), (3.0, 3.0));
        list.add_node("node2".to_string(), (2.0, 2.0));
        list.add_node("node1".to_string(), (1.0, 1.0));

        list.sort_by_distance(&mut geo_distance::GeoDistance
            { position: (0.0, 0.0), address: "current".to_string(), emergency: false });
        assert_eq!(list.nodes[0].address(), "node1");
    }
}