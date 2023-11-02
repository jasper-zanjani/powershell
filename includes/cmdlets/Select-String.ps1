# Run DNS queries on a range of hosts, simplifying output
1..3 | { nslookup "TPASTVLRBTQ0$_" | Select-String "TPASTVLRBTQ0$_" -Context 0,1 }