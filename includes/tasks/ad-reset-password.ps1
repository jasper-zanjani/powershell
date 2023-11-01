# Set password interactively
Set-ADAccountPassword -Identity jzhang

# Using a credential object
$cred = Get-Credential
Set-ADAccountPassword -Identity jzhang -Reset -NewPassword $cred.Password

# Set password using distinguished name
$distinguishedName = (Get-ADUser jzhang).DistinguishedName
Set-ADAccountPassword -Identity $distinguishedName -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "p@ssw0rd" -Force)