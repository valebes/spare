use clap::Parser;

// Struct that represents the supported arguments for the executable
#[derive(Parser, Debug)]
#[command(version, about, long_about = None)]
pub struct Args {
    // Iggy broker address
    #[arg(short, long)]
    pub broker_address: Option<String>,
    // Iggy broker port
    #[arg(short, long)]
    pub broker_port: Option<u16>,
    // CIDR for the network
    #[arg(short, long)]
    pub cidr: Option<String>,
    // Address for the server
    #[arg(short, long)]
    pub server_address: Option<String>,
    // Port for the server
    #[arg(short, long)]
    pub port: Option<u16>,
    // Bridge name for the virtual network
    #[arg(short, long)]
    pub bridge_name: Option<String>,
    // Path for the config file (Default: $XDG_CONFIG_HOME/spare/config.toml)
    #[arg(short, long)]
    pub config: Option<String>,
}
