# PowerShell


## Development tasks

--8<-- "includes/functions.md"

--8<-- "includes/parameters.md"

### Typing
:   
    --8<-- "includes/typing.md"


### Control flow
:   
    --8<-- "includes/control.md"


### Variables
:   
    --8<-- "includes/variables.md"


#### Sample enumeration
:   
    [PowerShellMagazine](https://www.powershellmagazine.com/2013/01/18/pstip-get-a-random-item-from-an-enumeration/)
    ```powershell
    Add-Type -AssemblyName System.Drawing
    $count = [Enum]::GetValues([System.Drawing.KnownColor]).Count
    [System.Drawing.KnownColor](Get-Random -Minimum 1 -Maximum $count)
    ```

#### Documentation
:   
    --8<-- "includes/documentation.md"


#### Error handling
:   
    --8<-- "includes/error.md"

#### Unit testing
:   
    --8<-- "includes/testing.md"

#### Modules
:   

    A [script module](https://learn.microsoft.com/en-us/powershell/scripting/developer/module/how-to-write-a-powershell-script-module?view=powershell-7.3) is any valid PowerShell script saved with a **.psm1** extension.
    Create a new module by placing a .psm1 file in a directory of the same name

    ```
    .
    └── Starships
        └── Starships.psm1
    ```

    Modules should be installed in a path that is listed under **PSModulePath** environment variable, or a path should be added.
    For Windows PowerShell this may include the following locations:

    - **$HOME\\Documents\\WindowsPowerShell\\Modules** Modules for a specific user
    - **$Env:ProgramFiles\\WindowsPowerShell\\Modules** All users

    Functions defined within the module can be loaded with [**Import-Module**][Import-Module] (execution policy must allow this).

    ```powershell
    Import-Module .\Starship
    ```

    To import classes, a [different syntax](https://info.sapien.com/index.php/scripting/scripting-classes/import-powershell-classes-from-modules) must be used.

    ```powershell
    Using module .\Starship
    ```

    A module manifest file is used to create more complex modules with multiple files.
    
    ```powershell
    New-ModuleManifest
    ```

## System administration tasks


```powershell title="Common tasks"
--8<-- "includes/common.ps1"
```

#### Profile
:   
    Similar to a bashrc file, PowerShell has various profiles which can contain custom variable and function definitions, accessible through automatic variables like **$PROFILE**, etc.
    These are loaded using syntax similar to that of bash.

    ```powershell
    # Reload profile
    . $PROFILE
    ```

#### Filtering
:   
    Filtering results can be done with 5 commands:

    - [ **Where-Object** ](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/where-object?view=powershell-7.3) (aliased to **where** and **?**): the most commonly used such command
    - **Select-Object** (**sced**) to specify specific columns of information to be displayed
    - **Select-String** (**sls**)
    - **ForEach-Object** (**foreach** and **%**) There are two different ways to construct a ForEach-Object statement:
        1. **Script block**, within which the variable **$\_** represents the current object
        2. **Operation statement**, more naturalistic, where you specify a property value or call a method.


    ```powershell title="Filtering a CSV table"
    $vms = Import-Csv decoms.csv
    $lxvms = $vms | where Name -Like *VL*
    ```

    ```powershell
    --8<-- "includes/cmdlets/Select-String.ps1
    ```

#### Scheduled task
:   

    ```powershell
    # Schedule SSH server on WSL to start on system start
    $action = New-ScheduledTaskAction -Execute C:\WINDOWS\System32\bash.exe -Argument '-c sudo service ssh start'
    $trigger = New-ScheduledTaskTrigger -AtLogon

    Register-ScheduledTask -TaskName 'SSH server' -Trigger $trigger -Action $action
    ```

#### Handle XML files
:   
    --8<-- "includes/xml.md"


#### Remote administration
:   
    Powershell [remoting][remoting] can be done [**explicitly**][explicit remoting] or [**implicitly**][implicit remoting].
    Remoting relies on [WinRM][WinRM], which is Microsoft's implementation of WSMAN.

    - Explicit remoting is also 1-to-1 remoting, where an interactive Powershell prompt is brought up on a remote computer.
    - One-to-many or fan-out remoting is possible with implicit remoting, where a command is transmitted to many computers.


    ```powershell title="Enable CredSSP on the server"
    Enable-PSRemoting
    Enable-WSManCredSSP
    ```

    ```powershell title="Configure CredSSP on the client"
    # Add the fully-qualified domain name of the Hyper-V server to be managed to the local system's WSMan trusted hosts list
    Set-Item WSMan:\localhost\client\trustedhosts -Value "hypervserver.domain.com"

    #Enable the use of CredSSP on the client 
    Enable-WSManCredSSP -Role client -Delegate
    ```

#### Text to speech
:   

    ```powershell title="Text to speech"
    --8<-- "includes/tts.ps1"
    ```

    1. [Powershell: Text To Speech in 3 lines of code](https://www.scriptinglibrary.com/languages/powershell/powershell-text-to-speech/)
    2. [Create Cortana Audio Files From Text Using PowerShell](https://thinkpowershell.com/create-cortana-audio-files-from-text-using-powershell/)

#### Restart Wi-Fi adapter
:   

    ```powershell
    $adaptor = Get-WmiObject -Class Win32_NetworkAdapter | Where-Object {$_.Name -like "*Wireless*"}
    $adaptor.Disable()
    $adaptor.Enable()
    ```

#### Registry
:   

    ```powershell
    --8<-- "includes/registry.ps1"
    ```

#### GUI application using WinForms
:   

    ```powershell
    --8<-- "includes/winforms.ps1"
    ```

## Hyper-V administration tasks

```powershell title="Common tasks"
# Create VM with installation media
New-VM PLABWIN102 1536mb 1 -SwitchName 'Private network 1' -NewVHDPath 'C:\Users\Public\Documents\Hyper-V\Virtual hard disks\PLABWIN102.vhdx' -NewVHDSizeBytes 127gb
Set-VMDvdDrive -VMName PLABWIN102 -Path 'C:\Users\Administrator.PRACTICELABS\Documents\Eval81.iso'


# Add new virtual network adapters to VMs
Add-VMNetworkAdapter -VMName server1 -SwitchName setswitch -Name set1


# Passthrough disk
Set-Disk -Number 2 -IsOffline $true
Add-VMHardDiskDrive -VMName server1 -ControllerType scsi -DiskNumber 2


# Switch Embedded Teaming (SET) is a Hyper-V-only variation of NIC teaming that is implemented wholly within a virtual switch
New-VMSwitch -Name SETSwitch -NetAdapterName "nic1","nic2" -EnableEmbeddedTeaming $true
```

```powershell title="Implement nested virtualization"
# Both the physical host and the nested virtual host must be running Windows Server 2016, but before installing Hyper-V on the nested host, the following configurations must be made.

# Provide nested host's processor with access to virtualization technology on the physical host
Set-VMProcessor -VMName server1 -ExposeVirtualizationExtensions $true

# Disable dynamic memory
Set-VMMemory -VMName SRV01 -DynamicMemoryEnabled $false

# Configure 2 virtual processors
Set-VMProcessor -VMName SVR01 -Count 2

# Turn on MAC address spoofing
Set-VMNetworkAdapter -VMName SVR01 -Name "NetworkAdapter" -MACAddressSpoofing On
```

#### VHDX file
:   
    **VHDX** is a virtual disk format that can be read only by servers running Windows Server 2012 or later or workstations running Windows 8 or later.
    VHDX image files can be as large as 64 TB, and they also support 4 KB logical sector sizes to provide compatibility with 4 KB native drives. 

    Create a new 256 GB dynamic VHDX file, mount it, initialize it, and create and format the partition.

    ```powershell
    --8<-- "includes/vhdx.ps1"
    ```


#### Configure Server Core
:   

    ```powershell
    --8<-- "includes/server-core.ps1"
    ```

    ```powershell title="Update Server Core images"
    Mount-WindowsImage -ImagePath .\CoreServer.vhdx -Path .\MountDir -Index 1
    Add-WindowsPackage -Path .\MountDir -PackagePath C:\ServicingPackages_cabs
    Dismount-WindowsImage -Path .\MountDir -Save
    ```

#### Implement DDA
:   

    ```powershell title="Implement Discrete Device Assignment"
    --8<-- "includes/dda.ps1"
    ```

#### Configure live migration
:   

    ```powershell title="Configure live migration"
    # Live migration is possible between Hyper-V hosts that are not clustered, but they must be within the same (or trusted) domains.
    Enable-VMMigration
    Set-VMMigrationNetwork 192.168.4.0
    Set-VMHost -VirtualMachineMigrationAuthenticationType Kerberos
    Set-VMHost -VirtualMachineMigrationPerformanceOption smbtransport
    ```

#### Configure S2D cluster
:   

    ```powershell title="Storage Spaces Direct cluster"
    New-Cluster -Name cluster1 -node server1,server2,server3,server4 -NoStorage
    Enable-ClusterStorageSpacesDirect
    ```

#### Site-aware failover cluster
:   

    Configure failover clusters for two offices

    ```powershell
    New-ClusterFaultDomain -Name ny -Type site -Description "Primary" -Location "New York, NY"
    New-ClusterFaultDomain -Name sf -Type site -Description "Secondary" -Location "San Francisco, CA"
    Set-ClusterFaultDomain -Name node1 -Parent ny
    Set-ClusterFaultDomain -Name node2 -Parent ny
    Set-ClusterFaultDomain -Name node3 -Parent sf
    Set-ClusterFaultDomain -Name node4 -Parent sf
    ```

#### Storage Spaces Direct
:   
    ```powershell title="Storage Spaces Direct"
    --8<-- "includes/ssd.ps1"
    ```



/--8<-- "includes/links.md"


