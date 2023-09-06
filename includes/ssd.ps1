# Create storage pool
New-Cluster -Name HC-CLU1 -Node node1, node2, node3, node4 -NoStorage
Enable-ClusterStorageSpacesDirect -CacheMode Disabled -AutoConfig:0 -SkipEligibilityChecks
New-StoragePool -StorageSubSystemFriendlyName *Cluster* -FriendlyName S2DPool -ProvisioningTypeDefault Fixed -PhysicalDisk (Get-PhysicalDisk | Where-Object -Property CanPool -eq $true)

# Create storage tiers
$pool = Get-StoragePool S2DPool
New-StorageTier -StoragePoolUniqueID ($pool).UniqueID -FriendlyName Performance -MediaType HDD -ResiliencySettingName Mirror
New-StorageTier -StoragePoolUniqueID ($pool).UniqueID -FriendlyName Capacity -MediaType HDD -ResiliencySettingName Parity

# Create a new volume
New-Volume -StoragePool $pool -FriendlyName SharedVol1 -FileSystem CSVFS_REFS -StorageTiersFriendlyNames Performance, Capacity -StorageTierSizes 2GB, 10GB
