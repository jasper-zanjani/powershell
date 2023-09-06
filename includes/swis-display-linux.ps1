$SwqlQuery = @"
SELECT Caption,IPAddress,SystemUpTime,CPUCount 
FROM Orion.Nodes 
WHERE VENDOR = 'Linux' 
AND Status = 1 
ORDER BY Caption ASC
"@

Get-SwisData -SwisConnection $swis -Query $SwqlQuery