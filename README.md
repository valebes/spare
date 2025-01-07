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
- **4 x machines**: With Ubuntu 24.04 and with at least 4 cores and 8GB of RAM each. One of these machines will act as the **controller** for the experiment and the other three as **edge nodes**.
- **Iggy Instance**: An instance of the Iggy server running on the controller machine. Iggy is a lightweight message streaming platform used by SPARE to orchestrate the experiment and enable node discovery. You can find Iggy [here](https://iggy.rs "here").
