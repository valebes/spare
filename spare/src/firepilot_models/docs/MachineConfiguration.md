# MachineConfiguration

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**cpu_template** | Option<[**models::CpuTemplate**](CpuTemplate.md)> |  | [optional]
**smt** | Option<**bool**> | Flag for enabling/disabling simultaneous multithreading. Can be enabled only on x86. | [optional][default to false]
**mem_size_mib** | **i32** | Memory size of VM | 
**track_dirty_pages** | Option<**bool**> | Enable dirty page tracking. If this is enabled, then incremental guest memory snapshots can be created. These belong to diff snapshots, which contain, besides the microVM state, only the memory dirtied since a previous snapshot. Full snapshots each contain a full copy of the guest memory. | [optional][default to false]
**vcpu_count** | **i32** | Number of vCPUs (either 1 or an even number) | 
**huge_pages** | Option<**String**> | Which huge pages configuration (if any) should be used to back guest memory. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


