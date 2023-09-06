[Where-Object]: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/where-object?view=powershell-7.3
[Import-Module]: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/import-module?view=powershell-7.3
[Get-Content]: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-content?view=powershell-7.3
[Select-Xml]: https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/select-xml?view=powershell-7.3

[USERPROFILE]: #variables '```&#10;[PS] Write-Host $Env:USERPROFILE&#10;```&#10;Location of profile directory of current user (i.e. "C:\Users\jsmith")'
[USERNAME]: #variables '```&#10;[PS] Write-Host $Env:USERNAME&#10;```&#10;Name of current user (i.e. "jsmith").'
[APPDATA]: #variables '```&#10;[PS] Write-Host $Env:APPDATA&#10;```&#10;The file-system directory that serves as a common repository for application-specific data (i.e. "C:\Users\jsmith\AppData\Roaming").'
[LOCALAPPDATA]: #variables '```&#10;[PS] Write-Host $Env:LOCALAPPDATA&#10;```&#10;The file-system directory that serves as a data repository for local, non-roaming applications (i.e. "C:\Users\jsmith\AppData\Local").'
[WINDIR]: #variables '```&#10;[PS] Write-Host $Env:WINDIR&#10;```&#10;Windows folder in the system drive'

[endpoint]: # 'endpoint&#10;a particular configuration item in WinRM, representing a specific application for which WinRM can receive traffic'
[explicit remoting]: # 'explicit remoting&#10;opening a temporary or persistent Powershell session to a remote system&#10;Zacker, Craig. _Installation, Storage and Compute with Windows Server 2016: Exam Ref 70-740_. 2017: 176'
[external virtual switch]: # 'external virtual switch&#10;bound to networking protocol stack in the host operating system and connected to a physical network interface adapter on the host, allowing VMs to access the network to which the physical adapter is connected&#10;Zacker, Craig. _Installation, Storage and Compute with Windows Server 2016: Exam Ref 70-740_. 2017: 241'
[implicit remoting]: # 'implicit remoting&#10;running a cmdlet specifying the `ComputerName` parameter, which directs its function to the remote system&#10;Zacker, Craig. _Installation, Storage and Compute with Windows Server 2016: Exam Ref 70-740_. 2017: 177'
[internal virtual switch]: # 'internal virtual switch&#10;Bound to a separate instance of the networking protocol stack in the host operating system, independent from the physical network interface adapter and its connected network, it allows VMs to access the virtual network, including the host operating system.&#10;Zacker, Craig. _Installation, Storage and Compute with Windows Server 2016: Exam Ref 70-740_. 2017: 241'
[listener]: # 'listener&#10;configuration item in WinRM representing the ability of the service to accept incoming network traffic, associated with a TCP port number'
[NuGet]: # 'NuGet&#10;.NET package manager'
[private virtual switch]: # 'private virtual switch&#10;Exists only in the Hyper-V server and is accessible only to the VMs running on it, and is inaccessible to the host operating system itself.&#10;Zacker, Craig. _Installation, Storage and Compute with Windows Server 2016: Exam Ref 70-740_. 2017: 241'
[remoting]: # 'remoting&#10;term applied to the use of WinRM in Powershell over port 5985 (or 5986 for HTTPS)'
[WinRM]: # 'Windows Remote Management (WinRM)&#10;Microsoft implementation of the WSMAN protocol, which handles communications and authentication for connections for many applications.&#10;Unlike MMCs, which are based on DCOM (legacy technology), WinRM is considered firewall-friendly and is the preferred option'