use std::{net::Ipv4Addr, sync::Mutex};

use crate::net::{
    addresses::Addresses,
    linux::{
        bridge::{self, interface_id},
        tap::Tap,
    },
};
use builder::{executor::FirecrackerExecutorBuilder, Builder, Configuration};
use firepilot::{machine::FirepilotError, *};
use firepilot_models::models::{BootSource, Drive, MachineConfiguration, NetworkInterface};
use log::info;
use machine::Machine;

/// Struct that acts as a builder for Firecracker instances.
pub struct FirecrackerBuilder {
    pub executable: String,
    pub kernel: String, // TODO: Remove kernel from here! It should be coupled with the function image
    pub bridge: String,
    pub network: Mutex<Addresses>,
}

impl FirecrackerBuilder {
    /// Create a new FirecrackerBuilder.
    pub fn new(executable: String, kernel: String, bridge: String, network: Addresses) -> Self {
        Self {
            executable,
            kernel,
            bridge,
            network: Mutex::new(network),
        }
    }

    /// Create a new FirecrackerInstance from this builder.
    pub async fn new_instance(
        &self,
        image: String,
        vcpus: i32,
        memory: i32,
    ) -> Result<FirecrackerInstance, FirepilotError> {
        // Scope to release the lock immediately after getting IP and network info
        let (ip, gateway, netmask) = {
            let mut network = self.network.lock().map_err(|e| {
                FirepilotError::Unknown(format!("Failed to lock network: {}", e))
            })?;

            match network.get() {
                Some(ip) => {
                    let gateway = network.get_gateway();
                    let netmask = network.get_netmask();
                    info!("Assigned IP address: {}", ip);
                    (ip, gateway, netmask)
                }
                None => {
                    return Err(FirepilotError::Unknown(
                        "No more addresses available".to_string(),
                    ))
                }
            }
        }; 

        let create_instance = FirecrackerInstance::new(
            self.executable.clone(),
            self.kernel.clone(),
            image,
            vcpus,
            memory,
            self.bridge.clone(),
            ip,
            gateway,
            netmask,
        )
        .await;

        match create_instance {
            Ok(instance) => {
                info!("Created instance with IP address: {}", ip);
                Ok(instance)
            }
            Err(e) => Err(FirepilotError::Unknown(format!(
                "Failed to create instance: {}",
                e
            ))),
        }
    }
}


pub enum FirecrackerInstanceCreationError {
    /// Error creating the instance.
    CreationError(String),
}
impl std::fmt::Display for FirecrackerInstanceCreationError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            FirecrackerInstanceCreationError::CreationError(e) => {
                write!(f, "Creation error: {}", e)
            }
        }
    }
}
/// Struct that represents a Firecracker instance.
pub struct FirecrackerInstance {
    machine: Machine,
    address: Ipv4Addr,
    tap: Tap,
}

impl Drop for FirecrackerInstance {
    fn drop(&mut self) {
        //self.tap.remove().unwrap();
    }
}

impl FirecrackerInstance {
    /// Create a new FirecrackerInstance.
    /// # Arguments
    /// * `executable_path` - The path to the Firecracker executable.
    /// * `kernel_path` - The path to the kernel image.
    /// * `image_path` - The path to the function image.
    /// * `vcpu` - The number of virtual CPUs.
    /// * `memory` - The amount of memory in MiB.
    /// * `bridge` - The name of the bridge to attach the instance to.
    /// * `address` - The IP address to assign to the instance.
    /// * `gateway` - The IP address of the gateway.
    /// * `netmask` - The netmask to use.
    /// # Returns
    /// A FirecrackerInstance.
    /// # Panics
    /// If the instance cannot be created.
    pub async fn new(
        executable_path: String,
        kernel_path: String,
        image_path: String,
        vcpu: i32,
        memory: i32,
        bridge: String,
        address: Ipv4Addr,
        gateway: Ipv4Addr,
        netmask: Ipv4Addr,
    ) -> Result<Self, FirecrackerInstanceCreationError> {
        let uuid = uuid::Uuid::new_v4();
        let name = format!("firecracker-{}", uuid);

        let boot_source = BootSource {
            boot_args: Some(format!("console=ttyS0 reboot=k panic=1 pci=off en1.ipaddr={} en1.netmask={} en1.gateway={}", address, netmask, gateway)),
            initrd_path: None,
            kernel_image_path: kernel_path
        };

        let disk = Drive {
            drive_id: "rootfs".to_owned(),
            partuuid: None,
            is_root_device: true,
            cache_type: None,
            is_read_only: Some(false),
            path_on_host: Some(image_path),
            rate_limiter: None,
            io_engine: None,
            socket: None, //VHOST
        };

        let tap_name = format!("fc-{}-tap", uuid.to_string()[..8].to_owned()); // fetch name
        let tmp = Tap::create(&tap_name);
        match tmp {
            Ok(_) => log::info!("Created {}", tap_name),
            Err(e) => {
                return Err(FirecrackerInstanceCreationError::CreationError(format!(
                    "Failed to create {}: {}",
                    tap_name, e
                )))
            }
        }
        let tap = tmp.unwrap();

        let attach_tap = bridge::add_interface_to_bridge(interface_id(&tap_name).unwrap(), &bridge);
        match attach_tap {
            Ok(_) => log::info!("Added {} to {}", tap_name, bridge),
            Err(e) => {
                return Err(FirecrackerInstanceCreationError::CreationError(format!(
                    "Failed to add {} to {}: {}",
                    tap_name, bridge, e
                )))
            }
        }

        let net = NetworkInterface {
            guest_mac: Some("AA:FC:00:00:00:00".to_owned()),
            host_dev_name: tap_name,
            iface_id: "eth0".to_owned(),
            rx_rate_limiter: None,
            tx_rate_limiter: None,
        };

        let executor = FirecrackerExecutorBuilder::new()
            .with_chroot("/tmp".to_owned())
            .with_exec_binary(executable_path.into())
            .try_build();

        let executor = match executor {
            Ok(executor) => executor,
            Err(e) => {
                return Err(FirecrackerInstanceCreationError::CreationError(format!(
                    "Failed to create executor: {}",
                    e
                )))
            }
        };

        let machine_configuration = MachineConfiguration {
            cpu_template: None,
            vcpu_count: vcpu,
            mem_size_mib: memory,
            track_dirty_pages: Some(true),
            smt: Some(true),
            huge_pages: None,
        };

        let conf = Configuration::new(name.clone())
            .with_kernel(boot_source)
            .with_drive(disk)
            .with_interface(net)
            .with_executor(executor)
            .with_machine_config(machine_configuration);

        let mut machine = Machine::new();
        match machine.create(conf).await {
            Ok(_) => log::info!("Created {}", name),
            Err(e) => {
                return Err(FirecrackerInstanceCreationError::CreationError(format!(
                    "Failed to create {}: {}",
                    name, e
                )))
            }
        }

        Ok(Self {
            machine,
            address,
            tap,
        })
    }

    /// Get the IP address of the instance.
    pub fn get_address(&self) -> Ipv4Addr {
        self.address
    }

    /// Get the name of the instance.
    pub async fn get_status(&self) -> String {
        self.machine.is_running().await.to_string()
    }

    /// Get the path to the vsock socket.
    pub fn get_vsock_path(&self) -> String {
        self.machine.get_vsock_path()
    }

    /// Start the instance.
    pub async fn start(&self) -> Result<(), FirepilotError> {
        self.machine.start().await
    }

    /// Stop the instance.
    pub async fn stop(&self) -> Result<(), FirepilotError> {
        self.machine.stop().await
    }

    /// Pause the instance.
    pub async fn pause(&self) -> Result<(), FirepilotError> {
        self.machine.pause().await
    }

    /// Resume the instance.
    pub async fn resume(&self) -> Result<(), FirepilotError> {
        self.machine.resume().await
    }

    /// Delete the instance.
    pub async fn delete(&mut self) -> Result<(), FirepilotError> {
        self.machine.kill().await?;
        self.tap.remove().unwrap();
        Ok(())
    }
}

// Unit tests
#[cfg(test)]
mod tests {
    use std::time::Duration;

    use actix_web::rt::time::sleep;

    use super::*;

    // Obviously this test will fail if the paths are not correct, so change them accordingly
    #[actix_web::test]
    async fn test_firecracker() {
        let executable_path = "/home/ubuntu/firecracker".to_owned();
        let kernel_path = "/home/ubuntu/.ops/0.1.51/kernel.img".to_owned();
        let image_path = "/home/ubuntu/.ops/images/nanosvm".to_owned();
        let vcpu = 8;
        let memory = 512;
        let bridge = "br0".to_owned();
        let address = Ipv4Addr::new(192, 168, 30, 2);
        let gateway = Ipv4Addr::new(192, 168, 30, 1);
        let netmask = Ipv4Addr::new(255, 255, 255, 0);
        let instance = FirecrackerInstance::new(
            executable_path,
            kernel_path,
            image_path,
            vcpu,
            memory,
            bridge,
            address,
            gateway,
            netmask,
        )
        .await;

        assert!(instance.is_ok());
        match instance {
            Ok(instance) => {
                assert_eq!(instance.get_address(), address);
                assert_eq!(instance.get_vsock_path(), "/tmp/vsock.sock");
                assert_eq!(instance.get_status().await, "false");
                instance.start().await.unwrap();
                sleep(Duration::from_secs(5)).await;
                assert_eq!(instance.get_status().await, "true");
                instance.stop().await.unwrap();
                sleep(Duration::from_secs(5)).await;
                assert_eq!(instance.get_status().await, "false");
            }
            Err(e) => panic!("Failed to create instance: {}", e),
        }
    }
}
