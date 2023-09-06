# Manually configure network interface, if a DHCP server is unavailable
New-NetIPAddress 10.0.0.3 -InterfaceAlias "Ethernet" -PrefixLength 24

# Configure the DNS server addresses for the adapter
Set-DnsClientServerAddress -InterfaceIndex 6 -ServerAddresses ("192.168.0.1","192.168.0.2")

# Rename the computer and join it to a domain
Add-Computer -DomainName adatum.com -NewName Server8 -Credential adatum\administrator