# FullVmConfiguration

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**balloon** | Option<[**models::Balloon**](Balloon.md)> |  | [optional]
**drives** | Option<[**Vec<models::Drive>**](Drive.md)> | Configurations for all block devices. | [optional]
**boot_source** | Option<[**models::BootSource**](BootSource.md)> |  | [optional]
**logger** | Option<[**models::Logger**](Logger.md)> |  | [optional]
**machine_config** | Option<[**models::MachineConfiguration**](MachineConfiguration.md)> |  | [optional]
**metrics** | Option<[**models::Metrics**](Metrics.md)> |  | [optional]
**mmds_config** | Option<[**models::MmdsConfig**](MmdsConfig.md)> |  | [optional]
**network_interfaces** | Option<[**Vec<models::NetworkInterface>**](NetworkInterface.md)> | Configurations for all net devices. | [optional]
**vsock** | Option<[**models::Vsock**](Vsock.md)> |  | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


