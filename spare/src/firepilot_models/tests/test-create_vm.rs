use firepilot_models::apis::default_api::create_sync_action;
use firepilot_models::apis::default_api::put_guest_boot_source;
use firepilot_models::apis::default_api::put_guest_drive_by_id;
use firepilot_models::apis::default_api::put_guest_network_interface_by_id;
use firepilot_models::models::instance_action_info::ActionType;
use firepilot_models::models::Drive;
use firepilot_models::models::InstanceActionInfo;
use firepilot_models::models::NetworkInterface;
use firepilot_models::{apis::configuration::Configuration, models::BootSource};

#[tokio::test]
async fn test_create_vm() {
    let config = Configuration::new();
    let boot_source = BootSource {
        boot_args: Some("console=ttyS0 reboot=k panic=1 pci=off en1.ipaddr=192.168.30.2 en1.netmask=255.255.255.0 en1.gateway=192.168.30.1".to_owned()), 
        initrd_path: None,
        kernel_image_path: "/home/ubuntu/.ops/0.1.51/kernel.img".to_owned()
    };

    put_guest_boot_source(&config, boot_source).await.unwrap();

    let disk = Drive {
        drive_id: "rootfs".to_owned(),
        partuuid: None,
        is_root_device: true,
        cache_type: None,
        is_read_only: Some(false),
        path_on_host: Some("/home/ubuntu/digital.img".to_owned()),
        rate_limiter: None,
        io_engine: None,
        socket: None,
    };

    put_guest_drive_by_id(&config, "rootfs", disk)
        .await
        .unwrap();

    let net = NetworkInterface {
        guest_mac: Some("AA:FC:00:00:00:00".to_owned()),
        host_dev_name: "tap0".to_owned(),
        iface_id: "br0".to_owned(),
        rx_rate_limiter: None,
        tx_rate_limiter: None,
    };

    put_guest_network_interface_by_id(&config, "br0", net)
        .await
        .unwrap();

    create_sync_action(
        &config,
        InstanceActionInfo {
            action_type: ActionType::InstanceStart,
        },
    )
    .await
    .unwrap();
}
