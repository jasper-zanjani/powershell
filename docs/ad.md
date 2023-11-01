# Active Directory

The Active Directory PowerShell module is used for managing Active Directory principals.

#### Search for users
:   

    ```powershell
    # Return a single user, passing distinguished name, GUID, security identifier, or SAM account name 
    # to -Identity parameter (which is also the first positional parameter by default.
    Get-ADUser jsmith

    # Return all principals in a container. Note that the container path is hierarchical, 
    Get-ADUser -Filter * -SearchBase "ou=it_systemengineers_users,ou=it_systemengineers,ou=it,ou=_production,dc=corp,dc=pods,dc=lcl"
    
    # Retrieve all groups a user is member of
    Get-ADPrincipalGroupMembership jsmith

    # Get all members of an Active Directory security group.
    # Interestingly, the objects returned are PSObject not ADUser.
    Get-ADGroupMember -Identity M365EnterpriseE3_License

    # Get all members that are member of both of two groups
    $it = Get-ADGroupMember -Identity 'IT Employees'
    $ite3 = $it |? -FilterScript {"M365EnterpriseE3_License" -in (Get-ADPrincipalGroupMembership $_).name}
    ```

#### Set new password
:   
    ```powershell
    --8<-- "includes/tasks/ad-reset-password.ps1"
    ```


??? info "ADSI"

    ADSI and ADSISearcher are Powershell type accelerators used to query Active Directory using LDAP (for [System.DirectoryServices.DirectoryEntry](https://learn.microsoft.com/en-us/dotnet/api/system.directoryservices.directoryentry?view=dotnet-plat-ext-5.0) and [System.DirectoryServices.DirectorySearcher](https://learn.microsoft.com/en-us/dotnet/api/system.directoryservices.directorysearcher?view=dotnet-plat-ext-5.0) respectively).
    These are VBScript techniques.

    ```powershell
    # Make an ADSI connection to a domain
    [adsi]$domain = "WinNT://$Env:USERDOMAIN"
    ```

    Properties are returned as hash tables, so additional formatting using **Select** is necessary to improve legibility.

    ```powershell
    $domain | Select @{Name="Name";Expression={$_.name.value}},
        @{Name="PwdHistory";Expression={$_.PasswordHistoryLength.value}},
        @{Name="MinPasswordAge";Expression={New-Timespan -seconds $_.MinPasswordAge.value}},
        @{Name="MaxPasswordAge";Expression={New-Timespan -seconds $_.MaxPasswordAge.value}}
    ```