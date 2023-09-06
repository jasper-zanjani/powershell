# Display hostname
Get-ComputerInfo -Property CsName
$Env:computername

# Generate password
Add-Type -AssemblyName 'System.Web'
[System.Web.Security.Membership]::GeneratePassword(20, 3)

# Save credential in variable
$pw = ConvertTo-SecureString "Password" -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential ("FullerP", $pw)

# Produce a dialog box for interactive entry
$cred = Get-Credential

# Add a new local admin
New-LocalUser ansible
Add-LocalGroupMember Administrators ansible