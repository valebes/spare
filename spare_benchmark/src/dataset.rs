use rand::{rng, Rng};
use serde::Deserialize;

use crate::Node;

#[derive(Debug, Deserialize, Clone)]
struct EdgeNode {
    cell_id: u32,
    cell_lat: f64,
    cell_lon: f64,
}

pub fn generate_points_from_csv(nodes: &mut Vec<Node>, file_path: &str) {
    let mut rdr = csv::Reader::from_path(file_path).unwrap();
    let mut edge_nodes: Vec<EdgeNode> = rdr.deserialize().map(|result| result.unwrap()).collect();

    let mut rng = rng();
    for i in 0..nodes.len() {
        let edge_node = edge_nodes.remove(rng.random_range(0..edge_nodes.len()));
        nodes[i].position = (edge_node.cell_lat, edge_node.cell_lon);
    }
}

// Test the generation of points from a CSV file
#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_generate_points_from_csv() {
        let mut nodes = vec![
            Node {
                address: "node_1".to_string(),
                position: (0.0, 0.0),
            },
            Node {
                address: "node_2".to_string(),
                position: (0.0, 0.0),
            },
            Node {
                address: "node_3".to_string(),
                position: (0.0, 0.0),
            },
        ];
        generate_points_from_csv(&mut nodes, "../data/edge_nodes.csv");
        println!("{:?}", nodes);
    }
}
