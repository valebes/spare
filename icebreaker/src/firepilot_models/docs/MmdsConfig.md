# MmdsConfig

## Properties

Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**version** | Option<**String**> | Enumeration indicating the MMDS version to be configured. | [optional][default to V1]
**network_interfaces** | **Vec<String>** | List of the network interface IDs capable of forwarding packets to the MMDS. Network interface IDs mentioned must be valid at the time of this request. The net device model will reply to HTTP GET requests sent to the MMDS address via the interfaces mentioned. In this case, both ARP requests and TCP segments heading to `ipv4_address` are intercepted by the device model, and do not reach the associated TAP device. | 
**ipv4_address** | Option<**String**> | A valid IPv4 link-local address. | [optional][default to 169.254.169.254]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


