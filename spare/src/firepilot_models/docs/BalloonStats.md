# BalloonStats

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**target_pages** | **i32** | Target number of pages the device aims to hold. | 
**actual_pages** | **i32** | Actual number of pages the device is holding. | 
**target_mib** | **i32** | Target amount of memory (in MiB) the device aims to hold. | 
**actual_mib** | **i32** | Actual amount of memory (in MiB) the device is holding. | 
**swap_in** | Option<**i64**> | The amount of memory that has been swapped in (in bytes). | [optional]
**swap_out** | Option<**i64**> | The amount of memory that has been swapped out to disk (in bytes). | [optional]
**major_faults** | Option<**i64**> | The number of major page faults that have occurred. | [optional]
**minor_faults** | Option<**i64**> | The number of minor page faults that have occurred. | [optional]
**free_memory** | Option<**i64**> | The amount of memory not being used for any purpose (in bytes). | [optional]
**total_memory** | Option<**i64**> | The total amount of memory available (in bytes). | [optional]
**available_memory** | Option<**i64**> | An estimate of how much memory is available (in bytes) for starting new applications, without pushing the system to swap. | [optional]
**disk_caches** | Option<**i64**> | The amount of memory, in bytes, that can be quickly reclaimed without additional I/O. Typically these pages are used for caching files from disk. | [optional]
**hugetlb_allocations** | Option<**i64**> | The number of successful hugetlb page allocations in the guest. | [optional]
**hugetlb_failures** | Option<**i64**> | The number of failed hugetlb page allocations in the guest. | [optional]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


