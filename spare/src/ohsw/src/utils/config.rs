use std::sync::OnceLock;
use clap::Parser;
use config::{Config, ConfigError, Environment, File};

use crate::utils::parser::Args;

#[derive(Debug, Default, serde::Deserialize, PartialEq, Eq)]
struct General {
    #[serde(default = "default_server_addr")]
    pub server_addr: String,
    #[serde(default = "default_port")]
    pub port: u16,
    #[serde(default = "default_data_dir")]
    pub data_dir: String,
}

fn default_server_addr() -> String {
    "127.0.0.1".to_string()
}

fn default_port() -> u16 {
    8085
}

fn default_data_dir() -> String {
    std::env::var("XDG_DATA_HOME").unwrap_or("~/spare".to_owned())
}


#[derive(Debug, Default, serde::Deserialize, PartialEq, Eq)]
struct Network {
    pub cidr: String,
    pub bridge: String,
}

#[derive(Debug, Default, serde::Deserialize, PartialEq, Eq)]
struct Firecracker {
    pub executable: String,
    pub nanos_kernel: String,
}

#[derive(Debug, Default, serde::Deserialize, PartialEq, Eq)]
struct Broker {
    pub address: String,
    pub port: u16,
}

#[derive(Debug, Default, serde::Deserialize, PartialEq, Eq)]
pub struct Configuration {
    pub general: General,
    pub network: Network,
    pub firecracker: Firecracker,
    pub broker: Broker,
} 
impl Configuration {
    /// Initialize configuration from file, env, and CLI args.
    pub fn init() -> Result<(), ConfigError> {
        let args = Args::parse();

        // Look for the config file
        let config_file_path = {
            match &args.config {
                Some(path) => {
                    // Check if the file exists
                    if std::path::Path::new(path).exists() {
                        path.clone()
                    } else {
                        return Err(ConfigError::FileParse {
                            uri: Some(path.clone()),
                            cause: Box::new(std::io::Error::new(std::io::ErrorKind::NotFound, "File not found")),
                        })
                    }
                },
                None => {
                    let xdg_config_home = std::env::var("XDG_CONFIG_HOME").unwrap_or("~/.config".to_owned());
                    format!("{xdg_config_home}/spare/config.toml")
                }
            }
        };
        
        let settings = Config::builder()
            .add_source(File::with_name(&config_file_path))
            .add_source(Environment::default())
            .set_override_option("general.server_addr", args.server_address)?
            .set_override_option("general.port", args.port)?
            .set_override_option("network.cidr", args.cidr)?
            .set_override_option("network.bridge", args.bridge_name)?
            .set_override_option("broker.address", args.broker_address)?
            .set_override_option("broker.port", args.broker_port)?
            .build()
            .unwrap();

            CONFIG.set(settings.try_deserialize()?).unwrap(); // We are okay with this unwrap
            Ok(())
    }
}

pub static CONFIG: OnceLock<Configuration> = OnceLock::new();



