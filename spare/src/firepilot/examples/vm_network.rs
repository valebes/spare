use firepilot::{
    builder::{
        drive::DriveBuilder, executor::FirecrackerExecutorBuilder, kernel::KernelBuilder,
        network_interface::NetworkInterfaceBuilder, Builder, Configuration,
    },
    machine::Machine,
};
use std::{
    fs::File,
    io::copy,
    path::{Path, PathBuf},
};
use tokio::time::{sleep, Duration};

/// This example shows how to create a simple VM with a single vCPU, 1024 MiB of RAM, a root drive and a network interface.
///
/// Requirements:
/// - Firecracker binary at `/usr/bin/firecracker`
/// - KVM enabled on your system
///
///
/// It downloads the kernel and rootfs from the Firecracker Quickstart Guide, and use them to boot the VM, be aware that a few
/// hundred MiB of disk space will be used. Once you're done with the example, you can delete the `./examples/simple_vm` directory.
///
// URLs used are from the Firecracker Quickstart Guide
// ref: https://github.com/firecracker-microvm/firecracker/blob/main/docs/getting-started.md#running-firecracker
fn kernel_url() -> hyper::Uri {
    println!("Downloading kernel from S3");
    format!(
        "https://s3.amazonaws.com/spec.ccfc.min/img/quickstart_guide/{}/kernels/vmlinux.bin",
        std::env::consts::ARCH
    )
    .parse::<hyper::Uri>()
    .unwrap()
}

// URLs used are from the Firecracker Quickstart Guide
// ref: https://github.com/firecracker-microvm/firecracker/blob/main/docs/getting-started.md#running-firecracker
fn rootfs_url() -> hyper::Uri {
    println!("Downloading rootfs from S3");
    format!(
        "https://s3.amazonaws.com/spec.ccfc.min/ci-artifacts/disks/{}/ubuntu-18.04.ext4",
        std::env::consts::ARCH
    )
    .parse::<hyper::Uri>()
    .unwrap()
}

async fn fetch_url(url: hyper::Uri, target_path: PathBuf) {
    if target_path.exists() {
        println!("File already exists, skipping download");
        return;
    }

    let client = reqwest::Client::new();
    let response = client
        .get(url.to_string())
        .send()
        .await
        .expect("Could not download file");
    let mut file = File::create(target_path).expect("Could not create file");

    copy(
        &mut response
            .bytes()
            .await
            .expect("Could not get bytes file into the system")
            .as_ref(),
        &mut file,
    )
    .expect("Could not copy file");
}

/// This test needs to be running as root
#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    let path = Path::new("examples/resources");
    let kernel_path = path.join("kernel.bin");
    let rootfs_path = path.join("rootfs.ext4");
    // Download the kernel and rootfs in a temporary directory
    std::fs::create_dir_all(path).unwrap();
    fetch_url(rootfs_url(), rootfs_path.clone()).await;
    fetch_url(kernel_url(), kernel_path.clone()).await;

    let kernel_args = "reboot=k panic=1 pci=off random.trust_cpu=on".to_string();
    let kernel = KernelBuilder::new()
        .with_kernel_image_path(kernel_path.into_os_string().into_string().unwrap())
        .with_boot_args(kernel_args)
        .try_build()
        .unwrap();
    let drive = DriveBuilder::new()
        .with_drive_id("rootfs".to_string())
        .with_path_on_host(rootfs_path)
        .as_read_only()
        .as_root_device()
        .try_build()
        .unwrap();
    let executor = FirecrackerExecutorBuilder::new()
        .with_chroot("./examples/executor/".to_string())
        .with_exec_binary(PathBuf::from("/usr/bin/firecracker"))
        .try_build()
        .unwrap();
    let iface = NetworkInterfaceBuilder::new()
        .with_iface_id("eth0".to_string())
        .with_host_dev_name("tap0".to_string())
        .try_build()
        .unwrap();
    let config = Configuration::new("vm_network".to_string())
        .with_kernel(kernel)
        .with_executor(executor)
        .with_drive(drive)
        .with_interface(iface);
    let mut machine = Machine::new();
    machine.create(config).await.expect("Could not create VM");
    println!("Booting the VM");
    machine.start().await.unwrap();
    println!("Waiting a few seconds, the VM is started at this point");
    sleep(Duration::from_secs(50)).await;
    machine.stop().await.unwrap();
    println!("Shutting down the VM");
    machine.kill().await.unwrap();

    Ok(())
}
