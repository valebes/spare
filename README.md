# SPARE: Self-adaptive Platform for Allocating Resources in Emergencies for Urgent Edge Computing
This is the artifact repository for **SPARE**, a novel serverless platform designed to optimize resource allocation and responsiveness in time-critical scenarios.
This repository contains the code, configuration files, and instructions to reproduce the experiments presented in our paper.

## Main Goal
In emergency scenarios, such as natural disasters or critical infrastructure failures, traditional serverless platforms often struggle to efficiently manage resources under heavy demand. **SPARE** overcomes these challenges through:

- **Self-Adaptive Resource Allocation**: Dynamically reallocating serverless function invocations to edge nodes with sufficient capacity, ensuring that critical resources are freed up in disaster areas.
- **Self-Organization**: Enabling edge nodes to maintain services autonomously, without reliance on a centralized entity during emergencies.
- **Unikernels and Lightweight Virtualization**: Leveraging Firecracker and Nanos to minimize cold start times and ensure suitability for resource-constrained edge devices.

## Requirements
To reproduce the experiment, you will need:
- **At least 4 machines**: With Ubuntu 24.04 and with at least 4 cores and 8GB of RAM each. One of these machines will act as the **controller** for the experiment and the other three as **edge nodes**.
- **Iggy Instance**: An instance of the Iggy server running on the controller machine. Iggy is a lightweight message streaming platform used by SPARE to orchestrate the experiment and enable node discovery. You can find Iggy [here](https://iggy.rs "here").
- **Firecracker**: The Firecracker microVM hypervisor is used by SPARE to run serverless functions. You can find Firecracker [here](https://firecracker-microvm.github.io/ "here"). Install Firecracker on all edge nodes.

## Setup
1. **Clone the repository**: Clone this repository on all machines.
2. **Install dependencies**: Run the following command on all machines to install the necessary dependencies:
```bash
./setup.sh
```
**Warning I**: This script will install the necessary dependencies and configure the machines for the experiment. Please check the script before running it to ensure it does not interfere with your system. 

**Warning II**: Please, remember to install Firecracker manually.

3. **Install and run Iggy**: Start the Iggy server on the controller machine by running the following commands:
```bash
git clone https://github.com/iggy-rs/iggy
cd iggy/
cargo build --release
./target/release/iggy-server
```
4. **Start the controller**: On the controller machine, run the following command to start the experiment:
```bash
RUST_LOG=INFO ./target/release/spare_benchmark -b [IGGY_ADDRESS] -n [NUMBER_OF_NODES] -i [EPOCHS (i.e., 50)] -x 100 -y 150 [DIMENSION OF THE GRID]
```
5. **Prepare the nodes**: On each node, configure the variables in the `spare/build_and_run.sh` script to match the IP address of the controller machine and other parameters, according to the ones used in `setup.sh`. Then, run the following command to build and run the SPARE server:
```bash
./build_and_run.sh
```
6. **Run the experiment**: Once all nodes are running, the experiment will start automatically. You can monitor the progress on the controller machine.

**Warning**: Each node will save its data in a file with the name formatted as `node_x{}_y{}.stats.data`, where `x` and `y` are the coordinates of the node in the grid. The controller will save its data in different csv files contained in `spare_benchmark/` folder.

## Results
The experiment will output the following files:
- `spare_benchmark/latency_per_epoch_normal.csv`: Contains the latency of the serverless functions per epoch (normal scenario).
- `spare_benchmark/latency_per_epoch_emergency.csv`: Contains the latency of the serverless functions per epoch (disaster emergency).
- `spare_benchmark/weighted_avg_hops_by_epoch.csv`: Contains the weighted average of the number of hops per epoch.
- `spare/node_x{}_y{}.stats.data`: Contains the statistics of each node in the grid.

For what regard the cold start experiment, you can run it by executing the following command:
```bash
 sudo -E /home/user/.cargo/bin/cargo test --package ohsw --release --lib -- endpoints::test::benchmark --exact --show-output 
```
This will produce the following output:
- `spare/cold_start.csv`: Contains the cold start times of the serverless functions.
- `spare/executions.csv`: Contains the execution times of the serverless functions.

The directory `/plots` contains the scripts to generate the plots presented in the paper.