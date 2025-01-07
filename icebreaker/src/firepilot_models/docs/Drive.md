# Drive

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**drive_id** | **String** |  | 
**partuuid** | Option<**String**> | Represents the unique id of the boot partition of this device. It is optional and it will be taken into account only if the is_root_device field is true. | [optional]
**is_root_device** | **bool** |  | 
**cache_type** | Option<**String**> | Represents the caching strategy for the block device. | [optional][default to Unsafe]
**is_read_only** | Option<**bool**> | Is block read only. This field is required for virtio-block config and should be omitted for vhost-user-block configuration. | [optional]
**path_on_host** | Option<**String**> | Host level path for the guest drive. This field is required for virtio-block config and should be omitted for vhost-user-block configuration. | [optional]
**rate_limiter** | Option<[**models::RateLimiter**](RateLimiter.md)> |  | [optional]
**io_engine** | Option<**String**> | Type of the IO engine used by the device. \"Async\" is supported on host kernels newer than 5.10.51. This field is optional for virtio-block config and should be omitted for vhost-user-block configuration. | [optional][default to Sync]
**socket** | Option<**String**> | Path to the socket of vhost-user-block backend. This field is required for vhost-user-block config should be omitted for virtio-block configuration. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


