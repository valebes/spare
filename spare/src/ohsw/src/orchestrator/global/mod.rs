use dyn_clone::DynClone;
use emergency::Emergency;

pub mod emergency;
pub mod geo_distance;
pub mod simple_cellular;

/// Enum that represents the different strategies
/// available for the Neighbor Node Selection
/// strategy.
#[derive(Clone)]
pub enum NeighborNodeStrategy {
    /// Strategy that uses the Haversine formula to calculate
    /// the distance between two points.ß
    GeoDistance,
    /// Strategy that uses a simple model to calculate the
    /// latency between two nodes connected through the
    /// same base station.
    SimpleCellular,
}

/// Trait that represents a Neighbor Node
pub trait NeighborNode: DynClone {
    fn address(&self) -> String;
    fn position(&self) -> (f64, f64);
    fn emergency(&self) -> bool;
    fn set_emergency(&mut self, emergency: bool);
}

dyn_clone::clone_trait_object!(NeighborNode);

pub trait Distance: DynClone {
    /// Get the distance between two points + another metric (distance, latency)
    fn distance(&mut self, other: &mut dyn NeighborNode) -> f64;
}
pub trait Latency: DynClone {
    /// Get the latency between two points
    fn latency(&mut self, other: &mut dyn NeighborNodeWithLatency) -> f64;
}

/// Trait that represents a Neighbor Node with Latency and Distance
pub trait NeighborNodeWithLatency:
    NeighborNode + Distance + Latency + DynClone + Send + Sync
{
}
impl<T: NeighborNode + Distance + Latency + DynClone + Send + Sync> NeighborNodeWithLatency for T {}

dyn_clone::clone_trait_object!(NeighborNodeWithLatency);

/// Trait that represents a Neighbor Node with distance
pub trait NeighborNodeWithDistance: NeighborNode + Distance + DynClone + Send + Sync {}
impl<T: NeighborNode + Distance + DynClone + Send + Sync> NeighborNodeWithDistance for T {}

dyn_clone::clone_trait_object!(NeighborNodeWithDistance);

#[derive(Clone)]
pub enum NeighborNodeType {
    Distance(Box<dyn NeighborNodeWithDistance>),
    Latency(Box<dyn NeighborNodeWithLatency>),
}
impl NeighborNode for NeighborNodeType {
    fn address(&self) -> String {
        match self {
            NeighborNodeType::Distance(node) => node.address(),
            NeighborNodeType::Latency(node) => node.address(),
        }
    }

    fn position(&self) -> (f64, f64) {
        match self {
            NeighborNodeType::Distance(node) => node.position(),
            NeighborNodeType::Latency(node) => node.position(),
        }
    }

    fn emergency(&self) -> bool {
        match self {
            NeighborNodeType::Distance(node) => node.emergency(),
            NeighborNodeType::Latency(node) => node.emergency(),
        }
    }

    fn set_emergency(&mut self, emergency: bool) {
        match self {
            NeighborNodeType::Distance(node) => node.set_emergency(emergency),
            NeighborNodeType::Latency(node) => node.set_emergency(emergency),
        }
    }
}

/// Struct that represents the Neighbor Nodes
/// available in the system.
#[derive(Clone)]
pub struct NeighborNodeList {
    /// List of nodes
    pub nodes: Vec<Box<NeighborNodeType>>,
    /// Strategy to calculate the distance
    strategy: NeighborNodeStrategy,
    /// Emergency Position and Radius
    emergency: Option<Emergency>, // (Longitude, Latitude, Radius in meters)
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

    /// Get the strategy used to calculate the distance
    /// # Returns  
    /// * The strategy used to calculate the distance
    /// between the nodes
    pub fn strategy(&self) -> NeighborNodeStrategy {
        self.strategy.clone()
    }

    /// Add a new node to the list
    /// # Arguments
    /// * 'address' - Address of the node
    /// * 'position' - Position of the node as (Longitude, Latitude)
    pub fn add_node(&mut self, address: String, position: (f64, f64)) {
        match self.strategy {
            NeighborNodeStrategy::GeoDistance => {
                self.nodes
                    .push(Box::new(NeighborNodeType::Distance(Box::new(
                        geo_distance::GeoDistance::new(position, address),
                    ))));
            }
            NeighborNodeStrategy::SimpleCellular => {
                self.nodes.push(Box::new(NeighborNodeType::Latency(Box::new(
                    simple_cellular::SimpleCellular::new(position, address),
                ))));
            }
        }
    }

    /// Set an emergency
    /// # Arguments
    /// * 'position' - Position of the emergency as (Longitude, Latitude)
    /// * 'radius' - Radius of the emergency in meters
    pub fn set_emergency(&mut self, mut em_pos: Emergency) {
        for node in self.nodes.iter_mut() {
            if em_pos.distance(&mut **node) <= em_pos.radius {
                node.set_emergency(true);
            }
        }
        self.emergency = Some(em_pos);
    }

    /// Clean the emergency
    pub fn clear_emergency(&mut self) {
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
    pub fn get_nth(&self, nth: usize) -> Option<&dyn NeighborNode> {
        // The list is already sorted
        let mut count = 0;
        for node in self.nodes.iter() {
            if !node.emergency() {
                count += 1;
                if count == nth {
                    return Some(&**node);
                }
            }
        }
        None
    }

    /// Sort the nodes depending on the strategy
    /// # Arguments
    /// * `current` - Current node)
    pub fn sort<T: NeighborNode>(&mut self, current: &mut T) {
        match self.strategy {
            NeighborNodeStrategy::GeoDistance => {
                self.sort_by_distance(&mut geo_distance::GeoDistance {
                    position: current.position(),
                    address: current.address(),
                    emergency: current.emergency(),
                });
            }
            NeighborNodeStrategy::SimpleCellular => {
                self.sort_by_latency(&mut simple_cellular::SimpleCellular {
                    position: current.position(),
                    address: current.address(),
                    emergency: current.emergency(),
                    latency: 0.0,
                    last_update: std::time::Instant::now(),
                });
            }
        }
    }

    /// Sort the nodes by latency from the current node
    /// # Arguments
    /// * `current` - Current node
    pub fn sort_by_latency(&mut self, current: &mut dyn NeighborNodeWithLatency) {
        let mut latencies: Vec<(f64, usize)> = self
            .nodes
            .iter_mut()
            .enumerate()
            .map(|(i, node)| match node.as_mut() {
                NeighborNodeType::Latency(node) => (node.latency(current), i),
                _ => panic!("Node is not a latency node"),
            })
            .collect();

        latencies.sort_by(|a, b| a.0.partial_cmp(&b.0).unwrap());

        self.nodes = latencies
            .into_iter()
            .map(|(_, i)| dyn_clone::clone_box(&*self.nodes[i])) // Use `dyn_clone` to clone the trait object
            .collect();
    }

    /// Sort the nodes by distance from the current node
    /// # Arguments
    /// * `current` - Current node
    pub fn sort_by_distance(&mut self, current: &mut dyn NeighborNodeWithDistance) {
        let mut distances: Vec<(f64, usize)> = self
            .nodes
            .iter_mut()
            .enumerate()
            .map(|(i, node)| match node.as_mut() {
                NeighborNodeType::Distance(node) => (node.distance(current), i),
                _ => panic!("Node is not a distance node"),
            })
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
        let emergency = Emergency {
            position: (0.0, 0.0),
            radius: 100.0,
        };
        list.set_emergency(emergency);
        assert_eq!(list.nodes.iter().filter(|node| node.emergency()).count(), 1);
    }

    #[test]
    fn test_clean_emergency() {
        let mut list = NeighborNodeList::new(NeighborNodeStrategy::GeoDistance);
        list.add_node("node1".to_string(), (0.0, 0.0));
        list.add_node("node2".to_string(), (1.0, 1.0));
        list.add_node("node3".to_string(), (2.0, 2.0));
        let emergency = Emergency {
            position: (0.0, 0.0),
            radius: 100.0,
        };
        list.set_emergency(emergency);
        list.clear_emergency();
        assert_eq!(list.nodes.iter().filter(|node| node.emergency()).count(), 0);
    }

    #[test]
    fn test_sort_by_distance() {
        let mut list = NeighborNodeList::new(NeighborNodeStrategy::GeoDistance);
        list.add_node("node3".to_string(), (35.6764, 139.650));
        list.add_node("node2".to_string(), (40.7128, 74.0060));
        list.add_node("node1".to_string(), (48.8575, 2.3514));

        list.sort_by_distance(&mut geo_distance::GeoDistance {
            position: (45.4685, 9.1824),
            address: "current".to_string(),
            emergency: false,
        });
        assert_eq!(list.nodes[0].address(), "node1");
    }

    #[test]
    fn test_sort_by_latency() {
        let mut list = NeighborNodeList::new(NeighborNodeStrategy::SimpleCellular);
        list.add_node("node3".to_string(), (35.6764, 139.650));
        list.add_node("node2".to_string(), (40.7128, 74.0060));
        list.add_node("node1".to_string(), (48.8575, 2.3514));

        list.sort_by_latency(&mut simple_cellular::SimpleCellular {
            position: (45.4685, 9.1824),
            address: "current".to_string(),
            emergency: false,
            latency: 0.0,
            last_update: std::time::Instant::now(),
        });
        for node in list.nodes.iter_mut() {
            // print latency
            match node.as_mut() {
                NeighborNodeType::Latency(node) => println!(
                    "Latency: {}",
                    node.latency(&mut simple_cellular::SimpleCellular {
                        position: (45.4685, 9.1824),
                        address: "current".to_string(),
                        emergency: false,
                        latency: 0.0,
                        last_update: std::time::Instant::now(),
                    })
                ),
                _ => (),
            }
        }
        assert_eq!(list.nodes[0].address(), "node1");
    }
}
