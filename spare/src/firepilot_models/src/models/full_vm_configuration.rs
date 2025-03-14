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
pub struct FullVmConfiguration {
    #[serde(rename = "balloon", skip_serializing_if = "Option::is_none")]
    pub balloon: Option<Box<models::Balloon>>,
    /// Configurations for all block devices.
    #[serde(rename = "drives", skip_serializing_if = "Option::is_none")]
    pub drives: Option<Vec<models::Drive>>,
    #[serde(rename = "boot-source", skip_serializing_if = "Option::is_none")]
    pub boot_source: Option<Box<models::BootSource>>,
    #[serde(rename = "logger", skip_serializing_if = "Option::is_none")]
    pub logger: Option<Box<models::Logger>>,
    #[serde(rename = "machine-config", skip_serializing_if = "Option::is_none")]
    pub machine_config: Option<Box<models::MachineConfiguration>>,
    #[serde(rename = "metrics", skip_serializing_if = "Option::is_none")]
    pub metrics: Option<Box<models::Metrics>>,
    #[serde(rename = "mmds-config", skip_serializing_if = "Option::is_none")]
    pub mmds_config: Option<Box<models::MmdsConfig>>,
    /// Configurations for all net devices.
    #[serde(rename = "network-interfaces", skip_serializing_if = "Option::is_none")]
    pub network_interfaces: Option<Vec<models::NetworkInterface>>,
    #[serde(rename = "vsock", skip_serializing_if = "Option::is_none")]
    pub vsock: Option<Box<models::Vsock>>,
}

impl FullVmConfiguration {
    pub fn new() -> FullVmConfiguration {
        FullVmConfiguration {
            balloon: None,
            drives: None,
            boot_source: None,
            logger: None,
            machine_config: None,
            metrics: None,
            mmds_config: None,
            network_interfaces: None,
            vsock: None,
        }
    }
}
