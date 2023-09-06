# VMware

```powershell title="Display powered on Linux VMs"
get-vm -location (Get-Cluster -Name 'TPA-MGMT') |? Name -Like '*VL*' |? PowerState -eq 'PoweredOn' | ft -Property Name
```