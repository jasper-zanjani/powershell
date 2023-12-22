# VMware

```powershell
# Login to management server
$cred = Get-Credential
Connect-ViServer -Credential $cred -Server tpapdvavctr01

# Display powered on Linux VMs in production
Get-VM -Location (Get-Cluster -Name 'TPA-MGMT') |? 
{ 
    $_.Name -Like '*VL*' -and $_.PowerState -eq 'PoweredOn'  
} | Format-Table -Property Name

# Display powered-on Linux VMs in stage
Get-VM -Location (Get-Cluster -Name 'TPA-STAGE') |? 
{ 
    $_.Name -Like '*VL*' -and $_.PowerState -eq 'PoweredOn'  
} | Format-Table -Property Name

```
