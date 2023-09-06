# SolarWinds

[**OrionSDK**](https://github.com/solarwinds/OrionSDK) provides PowerShell modules for interacting with SolarWinds (this is apparently a PowerShell Desktop module that installs in **C:\\Program Files\\WindowsPowerShell\\Modules\\SwisPowerShell**).
The name of the module derives from the [**SolarWinds Information Service**](https://github.com/solarwinds/OrionSDK/wiki/About-SWIS), the data access layer for the SolarWinds [**Orion Platform**](https://www.solarwinds.com/orion-platform).

A SwisConnection object has to be constructed from a SolarWinds server hostname and credential.

```powershell
$swserver = 'TPAPDVWSWDS01'
$cred = Get-Credential

$swis = Connect-Swis -Credential $cred -Hostname $swserver
```

Any further work in the module takes this connection object.

Displaying information can be performed with one of two cmdlets:

- **Get-SwisData** takes a SWQL query with strings that **must** be single-quoted
- **Get-SwisObject** takes a URI

```powershell title="Get-SwisData example"
--8<-- "includes/swis-display-linux.ps1"
```

The OrionSDK documentation provides information on the schema for tables like **Orion.Nodes**.

Another important table is [**Orion.NodeIPAddress**](http://solarwinds.github.io/OrionSDK/2020.2/schema/Orion.NodeIPAddresses.html)



The URI is an important property in the SWIS taxonomy, for example when removing a computer from monitoring:

```powershell title="Remove-SwisObject example"
# SWQL supports the LIKE operator
$nodes = Get-SwisData $swis "SELECT URI FROM Orion.Nodes WHERE Caption LIKE 'tpatevlrbtq%'"
$nodes |% { Remove-SwisObject -SwisConnection $swis -Uri $serveruri }
```