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

/// InstanceActionInfo : Variant wrapper containing the real action.
#[derive(Clone, Default, Debug, PartialEq, Serialize, Deserialize)]
pub struct InstanceActionInfo {
    /// Enumeration indicating what type of action is contained in the payload
    #[serde(rename = "action_type")]
    pub action_type: ActionType,
}

impl InstanceActionInfo {
    /// Variant wrapper containing the real action.
    pub fn new(action_type: ActionType) -> InstanceActionInfo {
        InstanceActionInfo { action_type }
    }
}
/// Enumeration indicating what type of action is contained in the payload
#[derive(Clone, Copy, Debug, Eq, PartialEq, Ord, PartialOrd, Hash, Serialize, Deserialize)]
pub enum ActionType {
    #[serde(rename = "FlushMetrics")]
    FlushMetrics,
    #[serde(rename = "InstanceStart")]
    InstanceStart,
    #[serde(rename = "SendCtrlAltDel")]
    SendCtrlAltDel,
}

impl Default for ActionType {
    fn default() -> ActionType {
        Self::FlushMetrics
    }
}
