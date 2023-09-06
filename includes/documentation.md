Documentation or [**comment-based help**](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comment_based_help?view=powershell-7.3) is incorporated by means of specially formatted comments within the body of the function.
Even without comments, PowerShell will attempt to provide help to a user from the command-line using Get-Help.

```powershell title="Documentation"
<#
.SYNOPSIS
This script coordinates the process of creating new employees

.DESCRIPTION
This script creates new users in Active Directory...

.PARAMETER UserName
The official logon name for the user...

.PARAMETER HomeServer
The server name where the user's home folder will live...
#>

<#
.EXAMPLE
New-CorpEmployee -UserName John-Doe -HomeServer HOMESERVER1
This example creates a single new employee...
#>
```