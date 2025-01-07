use crate::api::invoke::InvokeFunction;
use actix_web::web::{self};
use awc::Client;
use instant_distance::{Builder, Point, Search};
use log::info;
use serde::{Deserialize, Serialize};

pub enum InvokeError {
    Unknown,
}

pub enum Cell {
    Node(Node),
    None,
}

/// Struct that represents a remote node available in the system
#[derive(Deserialize, Serialize, Clone, PartialEq)]
pub struct Node {
    pub address: String, // Ip:Port
    pub position: (i32, i32),
}
impl instant_distance::Point for Node {
    /// Implement the distance function for the Node struct.
    /// In this case, we are using the Euclidean distance.
    fn distance(&self, other: &Self) -> f32 {
        // Euclidean distance
        (((self.position.0 - other.position.0).pow(2) + (self.position.1 - other.position.1).pow(2))
            as f32)
            .sqrt()
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
}

/// Compute the nearest neighbor of a node
pub fn nearest_neighbor(nodes: Vec<Node>, identity: &Node) -> Vec<Node> {
    let len = nodes.len();
    let values = nodes.clone();
    let nodes_map = Builder::default().build(nodes, values);
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
            ordered_nodes[i].distance(&identity)
        );
    }
    ordered_nodes
}

/// Struct that represents the global resources available in the system
pub struct GlobalResources {
    pub identity: Node,             // Identity of the node
    pub nodes: Vec<Node>,           // All nodes in the system
    pub emergency_nodes: Vec<Node>, // Nodes in the emergency area
}
impl GlobalResources {
    /// Create a new GlobalResources object
    pub fn new(nodes: Vec<Node>, identity: Node) -> Self {
        let ordered_nodes = nearest_neighbor(nodes, &identity);

        Self {
            identity,
            nodes: ordered_nodes,
            emergency_nodes: Vec::new(),
        }
    }

    /// Get the identity of the node itself
    pub fn get_identity(&self) -> &Node {
        &self.identity
    }

    // In the case of an emergency, we need to update the nearest nodes, excluding the emergency nodes
    pub fn compute_emergency_nodes(&mut self, position: (i32, i32), radius: f32) {
        let emergency_point = Node {
            address: "emergency".to_string(),
            position,
        };

        self.emergency_nodes = nearest_neighbor(self.nodes.clone(), &emergency_point);
        self.emergency_nodes
            .retain(|node| node.distance(&emergency_point) <= radius);
    }

    /// Clean the emergency nodes after the emergency is over
    pub fn clean_emergency_nodes(&mut self) {
        self.emergency_nodes.clear();
    }

    /// Get the number of nodes in the system
    pub fn len(&self) -> usize {
        self.nodes.len()
    }

    /// Get the nth node in the system
    fn get_nth_node(&self, nth: usize, acc: usize, index: usize) -> Option<Node> {
        let tmp = self.nodes.get(index);
        match tmp {
            Some(node) => {
                if self.emergency_nodes.contains(node) {
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

    /// Get the nth node in the system
    pub fn nth(&self, num: usize) -> Option<Node> {
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
        // Create vec with 10 nodes in random positions in a Matrix of 100x150
        let mut nodes = Vec::new();
        for i in 0..10 {
            let position = (
                rand::thread_rng().gen_range(0..100),
                rand::thread_rng().gen_range(0..150),
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
            position: (0, 0),
        };
        let global_resources = GlobalResources::new(nodes, identity.clone());

        println!("Nearest nodes");
        for i in 0..global_resources.len() {
            assert!(global_resources.nth(i).is_some());
            println!(
                "Node position: {:?}, euclidean distance: {}",
                global_resources.nth(i).unwrap().position,
                global_resources.nth(i).unwrap().distance(&identity)
            );
        }
    }

    #[test]
    fn test_global_resources_emergency() {
        // Create vec with 10 nodes in random positions in a Matrix of 100x150
        let mut nodes = Vec::new();
        for i in 0..100 {
            let position = (
                rand::thread_rng().gen_range(0..100),
                rand::thread_rng().gen_range(0..150),
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
            position: (0, 0),
        };
        let mut global_resources = GlobalResources::new(nodes, identity.clone());

        let position = (
            rand::thread_rng().gen_range(0..100),
            rand::thread_rng().gen_range(0..150),
        );
        global_resources.compute_emergency_nodes(position, 50.0);

        let emergency = Node {
            address: "emergency".to_string(),
            position,
        };

        println!("Nearest nodes. Emergency in {:?}", position);
        for i in 0..global_resources.len() - global_resources.emergency_nodes.len() {
            assert!(global_resources.nth(i).is_some());
            println!(
                "Node position: {:?},  distance from emergency: {}, distance from node: {}",
                global_resources.nth(i).unwrap().position,
                global_resources.nth(i).unwrap().distance(&emergency),
                global_resources.nth(i).unwrap().distance(&identity)
            );
        }
    }
}
