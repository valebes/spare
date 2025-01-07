#!/bin/sh
#######################################################################
# This script is used to setup the environment for SPARE experiments. #
# Please, change the variables below to match your environment.       #
#######################################################################

## VARIABLES ##

# CIDR for the bridge network
CIDR=192.168.43.1/24 
# Bridge network interface
BRIDGE_INTERFACE=br0 
# Main network interface
MAIN_INTERFACE=enp1s0

## SETUP ##

# Installing git and other things
sudo apt update && sudo apt install -y build-essential pkg-config libssl-dev git

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
. "$HOME/.cargo/env"    
cargo install sqlx-cli

# Enabling vhost-vsock
sudo modprobe vhost_vsock


# Preparing adapter
sudo ip link add name $BRIDGE_INTERFACE type bridge
sudo ip addr add $CIDR dev $BRIDGE_INTERFACE
sudo ip link set $BRIDGE_INTERFACE up
sudo sysctl -w net.ipv4.ip_forward=1
sudo iptables --table nat --append POSTROUTING --out-interface $MAIN_INTERFACE -j MASQUERADE
sudo iptables --insert FORWARD --in-interface $BRIDGE_INTERFACE -j ACCEPT

echo "Environment setup completed."