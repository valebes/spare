//! # High-level implementation to manage microVM (recommended)
//!
//! This module uses [Executor] to manage the microVM, but it gives an
//! opinionated way to create a microVM, this way hides the complexity and save
//! you time in order to start and configure your microVM as quickly as possible.
//!
//! ## Example
//!
//! ```ignore
//! use tokio::time::{sleep, Duration};
//! use firepilot::builder::Configuration;
//! use firepilot::machine::Machine;
//! // This configuration is not enough to run a microVM
//! let config = Configuration::new("simple_vm".to_string());
//!
//! let mut machine = Machine::new();
//! // Apply configuration to the machine
//! machine.create(config).await.unwrap();
//!     
//! println!("Booting the VM");
//! machine.start().await.unwrap();
//! println!("Waiting a few seconds, the VM is started at this point");
//! sleep(Duration::from_secs(5)).await;
//! machine.stop().await.unwrap();
//! println!("Shutting down the VM");
//! machine.kill().await.unwrap();
//! ```

use std::{
    fs::{copy, File},
    path::{self, Path},
};

use tokio::fs;
use tracing::{debug, info, instrument};

use crate::{
    builder::Configuration,
    executor::{Action, Executor},
};

use firepilot_models::models::{
    logger::Level,
    vm::{State, Vm},
    Logger, Vsock,
};

#[derive(Debug)]
pub enum FirepilotError {
    /// Mostly problems related to directories error or unavailable files
    Setup(String),
    /// Related to communication with the socket to configure the microVM which failed
    Configure(String),
    /// The process didn't start properly or an error occurred while trying to run it
    Execute(String),
    /// Unknown error
    Unknown(String),
}
impl std::fmt::Display for FirepilotError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            FirepilotError::Setup(msg) => write!(f, "Setup error: {}", msg),
            FirepilotError::Configure(msg) => write!(f, "Configuration error: {}", msg),
            FirepilotError::Execute(msg) => write!(f, "Execution error: {}", msg),
            FirepilotError::Unknown(msg) => write!(f, "Unknown error: {}", msg),
        }
    }
}

/// An instance of microVM which can be created and deployed easily
#[derive(Debug)]
pub struct Machine {
    /// Current microVM executor with applied configuration
    executor: Executor,
}

impl Machine {
    pub fn new() -> Self {
        Machine {
            executor: Executor::new(),
        }
    }

    fn copy<P, Q>(from: P, to: Q) -> Result<(), FirepilotError>
    where
        P: AsRef<Path>,
        Q: AsRef<Path>,
    {
        copy(&from, &to).map_err(|e| {
            let msg = format!(
                "Failed to copy {:?} to {:?}: {}",
                from.as_ref(),
                to.as_ref(),
                e
            );
            FirepilotError::Setup(msg)
        })?;
        Ok(())
    }

    /// Setup an initial workspace to be working and to have the microVM
    /// starting as expected, it is going through a few steps. The workspace is
    /// configured when you are creating the executor object.
    ///
    /// 1. Setup the machine workspace from the executor
    /// 2. Copy drives into the machine workspace (rootfs included)
    /// 3. Copy the kernel in the system workspace
    /// 4. Spawn the socket process
    /// 5. Configure the socket with given informations from the configuration
    #[instrument(skip(self, config), fields(id = %config.vm_id))]
    pub async fn create(&mut self, mut config: Configuration) -> Result<(), FirepilotError> {
        self.executor = match config.executor {
            Some(executor) => Ok(executor),
            None => Err(FirepilotError::Setup(
                "No executor was provided in the configuration".to_string(),
            )),
        }?;

        // Step 1. Setup the machine workspace from the executor
        self.executor.create_workspace()?;

        // Step 3. Copy drives into the machine workspace
        let machine = config.machine.unwrap();
        let kernel = config.kernel.unwrap();
        for drive in config.storage.iter_mut() {
            let new_drive_path = self.executor.chroot().join(&drive.drive_id);
            info!("Copy drive {} in the workspace", drive.drive_id);
            debug!(
                "Drive from {:?} to {:?}",
                drive.path_on_host, new_drive_path
            );
            Machine::copy(&drive.path_on_host.as_ref().unwrap(), &new_drive_path)?;
            drive.path_on_host = Some(new_drive_path.into_os_string().into_string().unwrap());
        }

        // Step 4. Copy the kernel in the system workspace
        let kernel_path = self.executor.chroot().join("vmlinux");
        info!("Copy kernel in the workspace");
        debug!(
            "Kernel from {:?} to {:?}",
            kernel.kernel_image_path, kernel_path
        );
        Machine::copy(kernel.kernel_image_path.clone(), kernel_path)?;

        if let Some(initrd) = kernel.initrd_path.clone() {
            Machine::copy(initrd, self.executor.chroot().join("initrd"))?;
        }

        // TODO: Make possible to configure Logger
        let logger_path = self.executor.chroot().join("firecracker.log");
        let _logger_file = File::create(&logger_path).unwrap();
        let logger = Logger {
            level: Some(Level::Info),
            log_path: Some(logger_path.into_os_string().into_string().unwrap()),
            show_level: Some(true),
            show_log_origin: Some(true),
            module: None,
        };

        // Step 5. Spawn the socket process
        self.executor.run_socket()?;

        // Step 6. Configure the socket with given informations from the configuration
        info!("Configure microVM");
        self.executor.configure_drives(config.storage).await?;
        self.executor.configure_boot_source(kernel).await?;
        self.executor.configure_network(config.interfaces).await?;
        self.executor.configure_machine(machine).await?;
        self.executor.configure_logger(logger).await?;

        // Configure VSOCK
        let vsock = Vsock {
            guest_cid: 3,
            uds_path: self
                .executor
                .chroot()
                .join("vsock.sock")
                .into_os_string()
                .into_string()
                .unwrap(),
            vsock_id: None,
        };
        self.executor.configure_vsock(vsock).await?;
        Ok(())
    }

    /// Shutdown abruptly the socket process, if the VM was running it will stop it
    pub async fn kill(&mut self) -> Result<(), FirepilotError> {
        self.executor.destroy_socket().await?;
        fs::remove_dir_all(path::Path::new(&self.executor.chroot()))
            .await
            .unwrap();
        Ok(())
    }

    /// Send a InstanceStart signal to the VM
    pub async fn start(&self) -> Result<(), FirepilotError> {
        self.executor.send_action(Action::InstanceStart).await?;
        Ok(())
    }

    /// Send a CtrlAltDel signal so it will shutdown gracefully
    pub async fn stop(&self) -> Result<(), FirepilotError> {
        self.executor.send_action(Action::SendCtrlAltDel).await?;
        Ok(())
    }

    /// Pause a running VM
    pub async fn pause(&self) -> Result<(), FirepilotError> {
        self.executor.set_vm_state(Vm::new(State::Paused)).await?;
        Ok(())
    }

    /// Resume a paused VM
    pub async fn resume(&self) -> Result<(), FirepilotError> {
        self.executor.set_vm_state(Vm::new(State::Resumed)).await?;
        Ok(())
    }

    /// Check if the VM is running
    pub async fn is_running(&self) -> bool {
        self.executor.is_running()
    }

    /// Return vsock path
    pub fn get_vsock_path(&self) -> String {
        self.executor
            .chroot()
            .join("vsock.sock")
            .into_os_string()
            .into_string()
            .unwrap()
    }
}
