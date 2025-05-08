#!/bin/sh
#######################################################################
# This script is used to launch SPARE on the edge node.               #
# Please, change the variables below to match your environment.       #
#######################################################################

## VARIABLES ##
# CIDR for the bridge network
CIDR=192.168.30.1/24
# Bridge network interface
BRIDGE_INTERFACE=br0
# Broker address
BROKER_ADDRESS=192.168.200.1
# Broker port
BROKER_PORT=8090
# Root directory
ROOT_DIR=$(dirname $(realpath $0))
# Nanos kernel
NANOS_KERNEL=$ROOT_DIR/data/kernel.img
# Database URL
DB_FILE=$ROOT_DIR/data/db.db
# Firecracker executable
FIRECRACKER_EXECUTABLE=$ROOT_DIR/data/firecracker

rustup override set nightly
rustup update

# Clean Previous Data
rm node_*

# Compile project
echo "Building project..."

# Clean db
echo "Cleaning db..."
rm -f "$DB_FILE"

# SQL statement to create the table
sqlite3 "$DB_FILE" <<EOF
CREATE TABLE IF NOT EXISTS instances (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    functions TEXT NOT NULL,
    kernel TEXT NOT NULL,
    image TEXT NOT NULL,
    vcpus INTEGER NOT NULL,
    memory INTEGER NOT NULL,
    ip TEXT NOT NULL,
    port INTEGER NOT NULL,
    hops INTEGER NOT NULL,
    status TEXT NOT NULL CHECK(status IN ('started', 'terminated', 'failed')),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL  
);
EOF

DATABASE_URL=sqlite://$DB_FILE cargo sqlx prepare --workspace 
cargo build --release > /dev/null

# Run the project
echo "Running project..."
sudo -E NANOS_KERNEL=$NANOS_KERNEL FIRECRACKER_EXECUTABLE=$FIRECRACKER_EXECUTABLE DATABASE_URL=sqlite://$DB_FILE RUST_LOG=WARN  ./target/release/ohsw --cidr $CIDR --broker-address $BROKER_ADDRESS --broker-port $BROKER_PORT --bridge-name $BRIDGE_INTERFACE 

# Clean Tap
sudo ip link | awk -F: '/fc-/{print $2}' | xargs -I{} sudo ip link del {}
