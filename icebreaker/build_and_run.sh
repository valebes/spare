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
# Nanos kernel
NANOS_KERNEL=../data/kernel.img
# Database URL
DATABASE_URL=../data/db.db
# Firecracker executable
FIRECRACKER_EXECUTABLE=../data/firecracker

# Clean Previous Data
rm node_*

# Compile project
echo "Building project..."

DATABASE_URL=sqlite://db.db cargo sqlx prepare --workspace 
cargo build --release > /dev/null

# Clean db
echo "Cleaning db..."
rm -f db.db
touch db.db

# Run the project
echo "Running project..."
sudo -E NANOS_KERNEL=$NANOS_KERNEL FIRECRACKER_EXECUTABLE=$FIRECRACKER_EXECUTABLE DATABASE_URL=$DATABASE_URL RUST_LOG=WARN  .target/release/ohsw --cidr $CIDR --broker-address $BROKER_ADDRESS --broker-port $BROKER_PORT --bridge-name $BRIDGE_INTERFACE 

# Clean Tap
sudo ip link | awk -F: '/fc-/{print $2}' | xargs -I{} sudo ip link del {}
