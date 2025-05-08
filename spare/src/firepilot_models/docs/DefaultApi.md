# \DefaultApi

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_snapshot**](DefaultApi.md#create_snapshot) | **PUT** /snapshot/create | Creates a full or diff snapshot. Post-boot only.
[**create_sync_action**](DefaultApi.md#create_sync_action) | **PUT** /actions | Creates a synchronous action.
[**describe_balloon_config**](DefaultApi.md#describe_balloon_config) | **GET** /balloon | Returns the current balloon device configuration.
[**describe_balloon_stats**](DefaultApi.md#describe_balloon_stats) | **GET** /balloon/statistics | Returns the latest balloon device statistics, only if enabled pre-boot.
[**describe_instance**](DefaultApi.md#describe_instance) | **GET** / | Returns general information about an instance.
[**get_export_vm_config**](DefaultApi.md#get_export_vm_config) | **GET** /vm/config | Gets the full VM configuration.
[**get_firecracker_version**](DefaultApi.md#get_firecracker_version) | **GET** /version | Gets the Firecracker version.
[**get_machine_configuration**](DefaultApi.md#get_machine_configuration) | **GET** /machine-config | Gets the machine configuration of the VM.
[**get_mmds**](DefaultApi.md#get_mmds) | **GET** /mmds | Get the MMDS data store.
[**load_snapshot**](DefaultApi.md#load_snapshot) | **PUT** /snapshot/load | Loads a snapshot. Pre-boot only.
[**patch_balloon**](DefaultApi.md#patch_balloon) | **PATCH** /balloon | Updates a balloon device.
[**patch_balloon_stats_interval**](DefaultApi.md#patch_balloon_stats_interval) | **PATCH** /balloon/statistics | Updates a balloon device statistics polling interval.
[**patch_guest_drive_by_id**](DefaultApi.md#patch_guest_drive_by_id) | **PATCH** /drives/{drive_id} | Updates the properties of a drive. Post-boot only.
[**patch_guest_network_interface_by_id**](DefaultApi.md#patch_guest_network_interface_by_id) | **PATCH** /network-interfaces/{iface_id} | Updates the rate limiters applied to a network interface. Post-boot only.
[**patch_machine_configuration**](DefaultApi.md#patch_machine_configuration) | **PATCH** /machine-config | Partially updates the Machine Configuration of the VM. Pre-boot only.
[**patch_mmds**](DefaultApi.md#patch_mmds) | **PATCH** /mmds | Updates the MMDS data store.
[**patch_vm**](DefaultApi.md#patch_vm) | **PATCH** /vm | Updates the microVM state.
[**put_balloon**](DefaultApi.md#put_balloon) | **PUT** /balloon | Creates or updates a balloon device.
[**put_cpu_configuration**](DefaultApi.md#put_cpu_configuration) | **PUT** /cpu-config | Configures CPU features flags for the vCPUs of the guest VM. Pre-boot only.
[**put_entropy_device**](DefaultApi.md#put_entropy_device) | **PUT** /entropy | Creates an entropy device. Pre-boot only.
[**put_guest_boot_source**](DefaultApi.md#put_guest_boot_source) | **PUT** /boot-source | Creates or updates the boot source. Pre-boot only.
[**put_guest_drive_by_id**](DefaultApi.md#put_guest_drive_by_id) | **PUT** /drives/{drive_id} | Creates or updates a drive. Pre-boot only.
[**put_guest_network_interface_by_id**](DefaultApi.md#put_guest_network_interface_by_id) | **PUT** /network-interfaces/{iface_id} | Creates a network interface. Pre-boot only.
[**put_guest_vsock**](DefaultApi.md#put_guest_vsock) | **PUT** /vsock | Creates/updates a vsock device. Pre-boot only.
[**put_logger**](DefaultApi.md#put_logger) | **PUT** /logger | Initializes the logger by specifying a named pipe or a file for the logs output.
[**put_machine_configuration**](DefaultApi.md#put_machine_configuration) | **PUT** /machine-config | Updates the Machine Configuration of the VM. Pre-boot only.
[**put_metrics**](DefaultApi.md#put_metrics) | **PUT** /metrics | Initializes the metrics system by specifying a named pipe or a file for the metrics output.
[**put_mmds**](DefaultApi.md#put_mmds) | **PUT** /mmds | Creates a MMDS (Microvm Metadata Service) data store.
[**put_mmds_config**](DefaultApi.md#put_mmds_config) | **PUT** /mmds/config | Set MMDS configuration. Pre-boot only.



## create_snapshot

> create_snapshot(body)
Creates a full or diff snapshot. Post-boot only.

Creates a snapshot of the microVM state. The microVM should be in the `Paused` state.

### Parameters


Name | Type | Description  | Required | Notes
------------- | ------------- | ------------- | ------------- | -------------
**body** | [**SnapshotCreateParams**](SnapshotCreateParams.md) | The configuration used for creating a snaphot. | [required] |

### Return type

 (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## create_sync_action

> create_sync_action(info)
Creates a synchronous action.

### Parameters


Name | Type | Description  | Required | Notes
------------- | ------------- | ------------- | ------------- | -------------
**info** | [**InstanceActionInfo**](InstanceActionInfo.md) |  | [required] |

### Return type

 (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## describe_balloon_config

> models::Balloon describe_balloon_config()
Returns the current balloon device configuration.

### Parameters

This endpoint does not need any parameter.

### Return type

[**models::Balloon**](Balloon.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## describe_balloon_stats

> models::BalloonStats describe_balloon_stats()
Returns the latest balloon device statistics, only if enabled pre-boot.

### Parameters

This endpoint does not need any parameter.

### Return type

[**models::BalloonStats**](BalloonStats.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## describe_instance

> models::InstanceInfo describe_instance()
Returns general information about an instance.

### Parameters

This endpoint does not need any parameter.

### Return type

[**models::InstanceInfo**](InstanceInfo.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## get_export_vm_config

> models::FullVmConfiguration get_export_vm_config()
Gets the full VM configuration.

Gets configuration for all VM resources. If the VM is restored from a snapshot, the boot-source, machine-config.smt and machine-config.cpu_template will be empty.

### Parameters

This endpoint does not need any parameter.

### Return type

[**models::FullVmConfiguration**](FullVmConfiguration.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## get_firecracker_version

> models::FirecrackerVersion get_firecracker_version()
Gets the Firecracker version.

### Parameters

This endpoint does not need any parameter.

### Return type

[**models::FirecrackerVersion**](FirecrackerVersion.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## get_machine_configuration

> models::MachineConfiguration get_machine_configuration()
Gets the machine configuration of the VM.

Gets the machine configuration of the VM. When called before the PUT operation, it will return the default values for the vCPU count (=1), memory size (=128 MiB). By default SMT is disabled and there is no CPU Template.

### Parameters

This endpoint does not need any parameter.

### Return type

[**models::MachineConfiguration**](MachineConfiguration.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## get_mmds

> serde_json::Value get_mmds()
Get the MMDS data store.

### Parameters

This endpoint does not need any parameter.

### Return type

[**serde_json::Value**](serde_json::Value.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## load_snapshot

> load_snapshot(body)
Loads a snapshot. Pre-boot only.

Loads the microVM state from a snapshot. Only accepted on a fresh Firecracker process (before configuring any resource other than the Logger and Metrics).

### Parameters


Name | Type | Description  | Required | Notes
------------- | ------------- | ------------- | ------------- | -------------
**body** | [**SnapshotLoadParams**](SnapshotLoadParams.md) | The configuration used for loading a snaphot. | [required] |

### Return type

 (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## patch_balloon

> patch_balloon(body)
Updates a balloon device.

Updates an existing balloon device, before or after machine startup. Will fail if update is not possible.

### Parameters


Name | Type | Description  | Required | Notes
------------- | ------------- | ------------- | ------------- | -------------
**body** | [**BalloonUpdate**](BalloonUpdate.md) | Balloon properties | [required] |

### Return type

 (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## patch_balloon_stats_interval

> patch_balloon_stats_interval(body)
Updates a balloon device statistics polling interval.

Updates an existing balloon device statistics interval, before or after machine startup. Will fail if update is not possible.

### Parameters


Name | Type | Description  | Required | Notes
------------- | ------------- | ------------- | ------------- | -------------
**body** | [**BalloonStatsUpdate**](BalloonStatsUpdate.md) | Balloon properties | [required] |

### Return type

 (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## patch_guest_drive_by_id

> patch_guest_drive_by_id(drive_id, body)
Updates the properties of a drive. Post-boot only.

Updates the properties of the drive with the ID specified by drive_id path parameter. Will fail if update is not possible.

### Parameters


Name | Type | Description  | Required | Notes
------------- | ------------- | ------------- | ------------- | -------------
**drive_id** | **String** | The id of the guest drive | [required] |
**body** | [**PartialDrive**](PartialDrive.md) | Guest drive properties | [required] |

### Return type

 (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## patch_guest_network_interface_by_id

> patch_guest_network_interface_by_id(iface_id, body)
Updates the rate limiters applied to a network interface. Post-boot only.

Updates the rate limiters applied to a network interface.

### Parameters


Name | Type | Description  | Required | Notes
------------- | ------------- | ------------- | ------------- | -------------
**iface_id** | **String** | The id of the guest network interface | [required] |
**body** | [**PartialNetworkInterface**](PartialNetworkInterface.md) | A subset of the guest network interface properties | [required] |

### Return type

 (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## patch_machine_configuration

> patch_machine_configuration(body)
Partially updates the Machine Configuration of the VM. Pre-boot only.

Partially updates the Virtual Machine Configuration with the specified input. If any of the parameters has an incorrect value, the whole update fails.

### Parameters


Name | Type | Description  | Required | Notes
------------- | ------------- | ------------- | ------------- | -------------
**body** | Option<[**MachineConfiguration**](MachineConfiguration.md)> | A subset of Machine Configuration Parameters |  |

### Return type

 (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## patch_mmds

> patch_mmds(body)
Updates the MMDS data store.

### Parameters


Name | Type | Description  | Required | Notes
------------- | ------------- | ------------- | ------------- | -------------
**body** | Option<**serde_json::Value**> | The MMDS data store patch JSON. |  |

### Return type

 (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## patch_vm

> patch_vm(body)
Updates the microVM state.

Sets the desired state (Paused or Resumed) for the microVM.

### Parameters


Name | Type | Description  | Required | Notes
------------- | ------------- | ------------- | ------------- | -------------
**body** | [**Vm**](Vm.md) | The microVM state | [required] |

### Return type

 (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## put_balloon

> put_balloon(body)
Creates or updates a balloon device.

Creates a new balloon device if one does not already exist, otherwise updates it, before machine startup. This will fail after machine startup. Will fail if update is not possible.

### Parameters


Name | Type | Description  | Required | Notes
------------- | ------------- | ------------- | ------------- | -------------
**body** | [**Balloon**](Balloon.md) | Balloon properties | [required] |

### Return type

 (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## put_cpu_configuration

> put_cpu_configuration(body)
Configures CPU features flags for the vCPUs of the guest VM. Pre-boot only.

Provides configuration to the Firecracker process to specify vCPU resource configuration prior to launching the guest machine.

### Parameters


Name | Type | Description  | Required | Notes
------------- | ------------- | ------------- | ------------- | -------------
**body** | Option<**String**> | CPU configuration request |  |

### Return type

 (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## put_entropy_device

> put_entropy_device(body)
Creates an entropy device. Pre-boot only.

Enables an entropy device that provides high-quality random data to the guest.

### Parameters


Name | Type | Description  | Required | Notes
------------- | ------------- | ------------- | ------------- | -------------
**body** | [**EntropyDevice**](EntropyDevice.md) | Guest entropy device properties | [required] |

### Return type

 (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## put_guest_boot_source

> put_guest_boot_source(body)
Creates or updates the boot source. Pre-boot only.

Creates new boot source if one does not already exist, otherwise updates it. Will fail if update is not possible.

### Parameters


Name | Type | Description  | Required | Notes
------------- | ------------- | ------------- | ------------- | -------------
**body** | [**BootSource**](BootSource.md) | Guest boot source properties | [required] |

### Return type

 (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## put_guest_drive_by_id

> put_guest_drive_by_id(drive_id, body)
Creates or updates a drive. Pre-boot only.

Creates new drive with ID specified by drive_id path parameter. If a drive with the specified ID already exists, updates its state based on new input. Will fail if update is not possible.

### Parameters


Name | Type | Description  | Required | Notes
------------- | ------------- | ------------- | ------------- | -------------
**drive_id** | **String** | The id of the guest drive | [required] |
**body** | [**Drive**](Drive.md) | Guest drive properties | [required] |

### Return type

 (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## put_guest_network_interface_by_id

> put_guest_network_interface_by_id(iface_id, body)
Creates a network interface. Pre-boot only.

Creates new network interface with ID specified by iface_id path parameter.

### Parameters


Name | Type | Description  | Required | Notes
------------- | ------------- | ------------- | ------------- | -------------
**iface_id** | **String** | The id of the guest network interface | [required] |
**body** | [**NetworkInterface**](NetworkInterface.md) | Guest network interface properties | [required] |

### Return type

 (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## put_guest_vsock

> put_guest_vsock(body)
Creates/updates a vsock device. Pre-boot only.

The first call creates the device with the configuration specified in body. Subsequent calls will update the device configuration. May fail if update is not possible.

### Parameters


Name | Type | Description  | Required | Notes
------------- | ------------- | ------------- | ------------- | -------------
**body** | [**Vsock**](Vsock.md) | Guest vsock properties | [required] |

### Return type

 (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## put_logger

> put_logger(body)
Initializes the logger by specifying a named pipe or a file for the logs output.

### Parameters


Name | Type | Description  | Required | Notes
------------- | ------------- | ------------- | ------------- | -------------
**body** | [**Logger**](Logger.md) | Logging system description | [required] |

### Return type

 (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## put_machine_configuration

> put_machine_configuration(body)
Updates the Machine Configuration of the VM. Pre-boot only.

Updates the Virtual Machine Configuration with the specified input. Firecracker starts with default values for vCPU count (=1) and memory size (=128 MiB). The vCPU count is restricted to the [1, 32] range. With SMT enabled, the vCPU count is required to be either 1 or an even number in the range. otherwise there are no restrictions regarding the vCPU count. If 2M hugetlbfs pages are specified, then `mem_size_mib` must be a multiple of 2. If any of the parameters has an incorrect value, the whole update fails. All parameters that are optional and are not specified are set to their default values (smt = false, track_dirty_pages = false, cpu_template = None, huge_pages = None).

### Parameters


Name | Type | Description  | Required | Notes
------------- | ------------- | ------------- | ------------- | -------------
**body** | Option<[**MachineConfiguration**](MachineConfiguration.md)> | Machine Configuration Parameters |  |

### Return type

 (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## put_metrics

> put_metrics(body)
Initializes the metrics system by specifying a named pipe or a file for the metrics output.

### Parameters


Name | Type | Description  | Required | Notes
------------- | ------------- | ------------- | ------------- | -------------
**body** | [**Metrics**](Metrics.md) | Metrics system description | [required] |

### Return type

 (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## put_mmds

> put_mmds(body)
Creates a MMDS (Microvm Metadata Service) data store.

### Parameters


Name | Type | Description  | Required | Notes
------------- | ------------- | ------------- | ------------- | -------------
**body** | Option<**serde_json::Value**> | The MMDS data store as JSON. |  |

### Return type

 (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)


## put_mmds_config

> put_mmds_config(body)
Set MMDS configuration. Pre-boot only.

Configures MMDS version, IPv4 address used by the MMDS network stack and interfaces that allow MMDS requests.

### Parameters


Name | Type | Description  | Required | Notes
------------- | ------------- | ------------- | ------------- | -------------
**body** | [**MmdsConfig**](MmdsConfig.md) | The MMDS configuration as JSON. | [required] |

### Return type

 (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

