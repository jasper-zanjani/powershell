# Discrete Device Assignment is a Hyper-V feature that enables passthrough of any PCI Express device, including GPUs or network adapters.

# Find the Instance ID of the device needed to be passed through.
Get-PnpDevice -PresentOnly

# Remove host-installed drivers
Disable-PnpDevice -InstanceId

# Provide `InstanceId` and `KeyName` values in order to get value for `LocationPath` parameter in next command
Get-PnpDeviceProperty

# Remove the device from host control
Dismount-VmHostAssignableDevice -LocationPath

# Attach the device to a guest
Add-VMAssignableDevice -VM -LocationPath