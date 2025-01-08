#!/bin/sh

# Script to run the cold start benchmark
# Root directory
ROOT_DIR=$(dirname "$0")
# Cargo path
CARGO_PATH=$(dirname $(which cargo))
# Nanos kernel
NANOS_KERNEL=$ROOT_DIR/data/kernel.img
# Database URL
DATABASE_URL=$ROOT_DIR/data/db.db
# Firecracker executable
FIRECRACKER_EXECUTABLE=$ROOT_DIR/data/firecracker
# Function image
SPARE_FUNCTION=$ROOT_DIR/data/nanosvm
# Bridge network interface
BRIDGE_INTERFACE=br0

SPARE_FUNCTION=$SPARE_FUNCTION FIRECRACKER_EXECUTABLE=$FIRECRACKER_EXECUTABLE NANOS_KERNEL=$NANOS_KERNEL BRIDGE_INTERFACE=$BRIDGE_INTERFACE sudo -E  $CARGO_PATH/cargo test --package ohsw --release --lib -- endpoints::test::benchmark --exact --show-output 