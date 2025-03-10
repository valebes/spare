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

/// Logger : Describes the configuration option for the logging capability.
#[derive(Clone, Default, Debug, PartialEq, Serialize, Deserialize)]
pub struct Logger {
    /// Set the level. The possible values are case-insensitive.
    #[serde(rename = "level", skip_serializing_if = "Option::is_none")]
    pub level: Option<Level>,
    /// Path to the named pipe or file for the human readable log output.
    #[serde(rename = "log_path", skip_serializing_if = "Option::is_none")]
    pub log_path: Option<String>,
    /// Whether or not to output the level in the logs.
    #[serde(rename = "show_level", skip_serializing_if = "Option::is_none")]
    pub show_level: Option<bool>,
    /// Whether or not to include the file path and line number of the log's origin.
    #[serde(rename = "show_log_origin", skip_serializing_if = "Option::is_none")]
    pub show_log_origin: Option<bool>,
    /// The module path to filter log messages by.
    #[serde(rename = "module", skip_serializing_if = "Option::is_none")]
    pub module: Option<String>,
}

impl Logger {
    /// Describes the configuration option for the logging capability.
    pub fn new() -> Logger {
        Logger {
            level: None,
            log_path: None,
            show_level: None,
            show_log_origin: None,
            module: None,
        }
    }
}
/// Set the level. The possible values are case-insensitive.
#[derive(Clone, Copy, Debug, Eq, PartialEq, Ord, PartialOrd, Hash, Serialize, Deserialize)]
pub enum Level {
    #[serde(rename = "Error")]
    Error,
    #[serde(rename = "Warning")]
    Warning,
    #[serde(rename = "Info")]
    Info,
    #[serde(rename = "Debug")]
    Debug,
    #[serde(rename = "Trace")]
    Trace,
}

impl Default for Level {
    fn default() -> Level {
        Self::Error
    }
}
