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
ROOT_DIR=$(dirname $(dirname $(realpath $0)))
# Nanos kernel
NANOS_KERNEL=$ROOT_DIR/data/kernel.img
# Database URL
DATABASE_URL=$ROOT_DIR/data/db.db
# Firecracker executable
FIRECRACKER_EXECUTABLE=$ROOT_DIR/data/firecracker

rustup override set nightly
rustup update

# Clean Previous Data
rm node_*

# Compile project
echo "Building project..."

DATABASE_URL=sqlite://db.db cargo sqlx prepare --workspace 
cargo build --release > /dev/null

# Clean db
echo "Cleaning db..."
rm -f spare/db.db
touch spare/db.db

# Run the project
echo "Running project..."
sudo -E NANOS_KERNEL=$NANOS_KERNEL FIRECRACKER_EXECUTABLE=$FIRECRACKER_EXECUTABLE DATABASE_URL=$DATABASE_URL RUST_LOG=WARN  .target/release/ohsw --cidr $CIDR --broker-address $BROKER_ADDRESS --broker-port $BROKER_PORT --bridge-name $BRIDGE_INTERFACE 

# Clean Tap
sudo ip link | awk -F: '/fc-/{print $2}' | xargs -I{} sudo ip link del {}
