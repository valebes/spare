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
pub struct PartialDrive {
    #[serde(rename = "drive_id")]
    pub drive_id: String,
    /// Host level path for the guest drive. This field is optional for virtio-block config and should be omitted for vhost-user-block configuration.
    #[serde(rename = "path_on_host", skip_serializing_if = "Option::is_none")]
    pub path_on_host: Option<String>,
    #[serde(rename = "rate_limiter", skip_serializing_if = "Option::is_none")]
    pub rate_limiter: Option<Box<models::RateLimiter>>,
}

impl PartialDrive {
    pub fn new(drive_id: String) -> PartialDrive {
        PartialDrive {
            drive_id,
            path_on_host: None,
            rate_limiter: None,
        }
    }
}
