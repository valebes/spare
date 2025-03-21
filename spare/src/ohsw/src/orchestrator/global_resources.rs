use crate::api::invoke::InvokeFunction;
use actix_web::web::{self};
use awc::Client;
use instant_distance::{Builder, Point, Search};
use log::info;
use longitude::Location;
use rand_distr::{Distribution, Normal};
use serde::{Deserialize, Serialize};

pub enum InvokeError {
    Unknown,
}

#[derive(Deserialize, Serialize, Clone)]
pub struct NeighborNode {
    pub node: Node,
    pub emergency: bool,
    pub latency: f32,
}
impl PartialOrd for NeighborNode {
    fn partial_cmp(&self, other: &Self) -> Option<std::cmp::Ordering> {
        self.latency.partial_cmp(&other.latency)
    }
}
impl PartialEq for NeighborNode {
    fn eq(&self, other: &Self) -> bool {
        self.latency == other.latency
    }
}
impl NeighborNode {
    pub fn new(node: Node) -> Self {
        Self {
            node,
            emergency: false,
            latency: 0.0,
        }
    }
}

pub struct NeighborNodeList {
    pub nodes: Vec<NeighborNode>,
}
impl Iterator for NeighborNodeList {
    type Item = NeighborNode;

    fn next(&mut self) -> Option<Self::Item> {
        self.nodes.pop()
    }
}
impl NeighborNodeList {
    pub fn new(nodes: Vec<Node>) -> Self {
        let mut neighbor_nodes = Vec::new();
        for node in nodes {
            neighbor_nodes.push(NeighborNode::new(node));
        }
        Self {
            nodes: neighbor_nodes,
        }
    }

    pub fn get(&self, index: usize) -> Option<&NeighborNode> {
        if index < self.nodes.len() {
            Some(&self.nodes[index])
        } else {
            None
        }
    }

    pub fn len(&self) -> usize {
        self.nodes.len()
    }

    pub fn to_vec(&self) -> Vec<NeighborNode> {
        self.nodes.clone()
    }

    // Get a vec with the nodes
    pub fn get_nodes(&self) -> Vec<Node> {
        let mut nodes = Vec::new();
        for node in &self.nodes {
            nodes.push(node.node.clone());
        }
        nodes
    }

    pub fn compute_latencies(&mut self, identity: &Node) {
        for node in &mut self.nodes {
            node.latency = identity.compute_latency(&node.node);
        }
        self.sort();
    }

    fn sort(&mut self) {
        self.nodes.sort_by(|a, b| a.partial_cmp(b).unwrap());
    }
}

/// Compute the nearest neighbor list of a node
pub fn nearest_neighbor(nodes: Vec<Node>, identity: &Node) -> Vec<Node> {
    let len = nodes.len();
    let nodes_map = Builder::default().build(nodes.clone(), nodes.clone());
    let mut search = Search::default();
    let mut ordered_nodes = Vec::new();
    for i in 0..len {
        ordered_nodes.push(
            nodes_map
                .search(&identity, &mut search)
                .nth(i)
                .unwrap()
                .value
                .clone(),
        );
        info!(
            "Node position: {:?},  distance from node: {}",
            ordered_nodes[i].position,
            ordered_nodes[i].distance(&identity),
        );
    }
    ordered_nodes
}

/// Struct that represents a remote node available in the system
#[derive(Deserialize, Serialize, Clone, PartialEq)]
pub struct Node {
    pub address: String, // Ip:Port
    pub position: (f64, f64),
}
impl instant_distance::Point for Node {
    // Distance between two nodes
    fn distance(&self, other: &Self) -> f32 {
        let location_a = Location::from(self.position.0, self.position.1);
        let location_b = Location::from(other.position.0, other.position.1);

        location_a.distance(&location_b).meters() as f32
    }
}
impl Node {
    /// Invoke a function in a remote node
    pub async fn invoke(&self, mut data: InvokeFunction) -> Result<web::Bytes, InvokeError> {
        data.hops += 1;
        let client = Client::default();

        let invoke = client
            .post(format!("http://{}/invoke", self.address))
            .content_type("application/json")
            .send_json(&data)
            .await;

        if invoke.is_err() {
            return Err(InvokeError::Unknown);
        } else {
            let mut invoke = invoke.unwrap();
            if invoke.status().is_success() {
                match invoke.body().await {
                    Ok(body) => Ok(body),
                    Err(_) => Err(InvokeError::Unknown),
                }
            } else {
                Err(InvokeError::Unknown)
            }
        }
    }

    pub fn compute_latency(&self, other: &Node) -> f32 {
        let location_a = Location::from(self.position.0, self.position.1);
        let location_b = Location::from(other.position.0, other.position.1);

        let distance = location_a.distance(&location_b).meters();
        // Simulate transmission latency
        // This is modeled as Latency = T_{prop} + 2 * T_{trans} + N(u, sigma^2)
        // Where: T_{prop} = d / c is the propagation delay,
        //        T_{trans} = packet_size / R{b} is the transmission delay,
        //        N(u, sigma^2) is the random variable with mean u and variance sigma^2 that
        //        models the queuing delay and processing delay.
        //        c = 3.0 * 10^8 m/s is the speed of light in vacuum.
        // We suppose that the node communicate through a base station, so we multiply the
        // transmission delay by 2.

        let c = 3.0 * 10.0_f32.powi(8);
        let packet_size = 1024.0 * 10000.0; // 10 MB
        let R_b = 10.0 * 10.0_f32.powi(6); // 10 Mbps
        let u = 0.5;
        let sigma = 0.2;

        let T_prop = (distance as f32) / c;
        let T_trans = packet_size / R_b;
        let N = Normal::new(u, sigma).unwrap().sample(&mut rand::rng());

        T_prop + (2.00 * T_trans) + N // We suppose that the node communicate through a base station
    }
}

/// Struct that represents the global resources available in the system
pub struct GlobalResources {
    pub identity: Node,          // Identity of the node
    pub nodes: NeighborNodeList, // All nodes in the system
    pub emergency: Node,         // Emergency position
    pub radius: f32,             // Radius of the emergency area
}
impl GlobalResources {
    /// Create a new GlobalResources object
    pub fn new(nodes: Vec<Node>, identity: Node) -> Self {
        let ordered_nodes = nearest_neighbor(nodes, &identity);

        Self {
            identity,
            nodes: NeighborNodeList::new(ordered_nodes),
            emergency: Node {
                address: "emergency".to_string(),
                position: (0.0, 0.0),
            },
            radius: 0.0,
        }
    }

    /// Get the identity of the node itself
    pub fn get_identity(&self) -> &Node {
        &self.identity
    }

    // In the case of an emergency, we need to update the nearest nodes, excluding the emergency nodes
    pub fn compute_emergency_nodes(&mut self, position: (f64, f64), radius: f32) {
        self.emergency = Node {
            address: "emergency".to_string(),
            position,
        };

        self.radius = radius;

        for node in &mut self.nodes.nodes {
            if node.node.distance(&self.emergency) <= self.radius {
                node.emergency = true;
            }
        }
    }

    /// Clean the emergency nodes after the emergency is over
    pub fn clean_emergency_nodes(&mut self) {
        self.emergency = Node {
            address: "emergency".to_string(),
            position: (0.0, 0.0),
        };
        self.radius = 0.0;

        for mut node in &mut self.nodes {
            node.emergency = false;
        }
    }

    /// Get the number of nodes in the system
    pub fn len(&self) -> usize {
        self.nodes.len()
    }

    /// Get the nth nearest node in the system
    fn get_nth_node(&self, nth: usize, acc: usize, index: usize) -> Option<NeighborNode> {
        let tmp = self.nodes.get(index);
        match tmp {
            Some(node) => {
                if node.emergency {
                    return self.get_nth_node(nth, acc, index + 1);
                }
                if nth == acc {
                    Some(node.clone())
                } else {
                    return self.get_nth_node(nth, acc + 1, index + 1);
                }
            }
            None => None,
        }
    }

    /// Get the nth nearest node in the system
    pub fn nth(&self, num: usize) -> Option<NeighborNode> {
        self.get_nth_node(num, 0, 0)
    }
}

// Unit tests
#[cfg(test)]
mod tests {
    use instant_distance::Point;
    use rand::Rng;

    use super::*;
    #[test]
    fn test_global_resources() {
        // Create vec with 10 nodes in random positions
        let mut nodes = Vec::new();
        for i in 0..10 {
            let position = (
                rand::rng().random_range(43.68829..43.74351),
                rand::rng().random_range(10.36706..10.46679),
            );
            nodes.push(Node {
                address: (format!("node_{}", i)).to_string(),
                position,
            });
        }

        println!("All nodes");
        for i in 0..nodes.len() {
            println!("Node position: {:?}", nodes[i].position);
        }

        let identity = Node {
            address: "127.0.0.1:8080".to_string(),
            position: (
                rand::rng().random_range(43.68829..43.74351),
                rand::rng().random_range(10.36706..10.46679),
            ),
        };

        let global_resources = GlobalResources::new(nodes, identity.clone());

        println!("Nearest nodes");
        for i in 0..global_resources.len() {
            assert!(global_resources.nth(i).is_some());
            println!(
                "Node position: {:?}, distance: {}, latency: {}",
                global_resources.nth(i).unwrap().node.position,
                global_resources.nth(i).unwrap().node.distance(&identity),
                global_resources.nth(i).unwrap().latency
            );
        }
    }

    #[test]
    fn test_global_resources_emergency() {
        // Create vec with 10 nodes in random positions
        let mut nodes = Vec::new();
        for i in 0..10 {
            let position = (
                rand::rng().random_range(43.68829..43.74351),
                rand::rng().random_range(10.36706..10.46679),
            );
            nodes.push(Node {
                address: (format!("node_{}", i)).to_string(),
                position,
            });
        }

        println!("All nodes");
        for i in 0..nodes.len() {
            println!("Node position: {:?}", nodes[i].position);
        }

        let identity = Node {
            address: "127.0.0.1:8080".to_string(),
            position: (
                rand::rng().random_range(43.68829..43.74351),
                rand::rng().random_range(10.36706..10.46679),
            ),
        };
        let mut global_resources = GlobalResources::new(nodes, identity.clone());

        let position = (
            rand::rng().random_range(43.68829..43.74351),
            rand::rng().random_range(10.36706..10.46679),
        );
        global_resources.compute_emergency_nodes(position, 500.0);

        let emergency = Node {
            address: "emergency".to_string(),
            position,
        };

        println!("Nearest nodes. Emergency in {:?}", position);
        for i in 0..global_resources.len() {
            if global_resources.nth(i).is_some() {
                println!(
                "Node position: {:?},  distance from emergency: {}, distance from node: {}, latency: {}",
                global_resources.nth(i).unwrap().node.position,
                global_resources.nth(i).unwrap().node.distance(&emergency),
                global_resources.nth(i).unwrap().node.distance(&identity),
                global_resources.nth(i).unwrap().latency
            );
            }
        }

        println!("Lower latency nodes. Emergency in {:?}", position);
        global_resources.nodes.compute_latencies(&identity);
        for i in 0..global_resources.len() {
            if global_resources.nth(i).is_some() {
                println!(
                "Node position: {:?},  distance from emergency: {}, distance from node: {}, latency: {}",
                global_resources.nth(i).unwrap().node.position,
                global_resources.nth(i).unwrap().node.distance(&emergency),
                global_resources.nth(i).unwrap().node.distance(&identity),
                global_resources.nth(i).unwrap().latency
            );
            }
        }
    }
}
