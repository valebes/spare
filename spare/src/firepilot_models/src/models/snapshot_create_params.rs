/*
 * Firecracker API
 *
 * RESTful public-facing API. The API is accessible through HTTP calls on specific URLs carrying JSON modeled data. The transport medium is a Unix Domain Socket.
 *
 * The version of the OpenAPI document: 1.9.0-dev
 * Contact: compute-capsule@amazon.com
 * Generated by: https://openapi-generator.tech
 */

use crate::models;
use serde::{Deserialize, Serialize};

#[derive(Clone, Default, Debug, PartialEq, Serialize, Deserialize)]
pub struct SnapshotCreateParams {
    /// Path to the file that will contain the guest memory.
    #[serde(rename = "mem_file_path")]
    pub mem_file_path: String,
    /// Path to the file that will contain the microVM state.
    #[serde(rename = "snapshot_path")]
    pub snapshot_path: String,
    /// Type of snapshot to create. It is optional and by default, a full snapshot is created.
    #[serde(rename = "snapshot_type", skip_serializing_if = "Option::is_none")]
    pub snapshot_type: Option<SnapshotType>,
}

impl SnapshotCreateParams {
    pub fn new(mem_file_path: String, snapshot_path: String) -> SnapshotCreateParams {
        SnapshotCreateParams {
            mem_file_path,
            snapshot_path,
            snapshot_type: None,
        }
    }
}
/// Type of snapshot to create. It is optional and by default, a full snapshot is created.
#[derive(Clone, Copy, Debug, Eq, PartialEq, Ord, PartialOrd, Hash, Serialize, Deserialize)]
pub enum SnapshotType {
    #[serde(rename = "Full")]
    Full,
    #[serde(rename = "Diff")]
    Diff,
}

impl Default for SnapshotType {
    fn default() -> SnapshotType {
        Self::Full
    }
}
