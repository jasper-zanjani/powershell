```powershell
if ($condition) { <# ... #> }

switch ($reference) 
{
    $value1 { ... }
    $value2 { ... }
}

while ($true) 
{
    (++$Tick)
    if ($Tick -gt 2) 
    { 
        break 
    } 
} # => @(1,2,3)

do 
{ 
    'Hello, world!' 
} while ($false) # => @('Hello, world!')
```

Loops are implemented with **ForEach-Object**.

```powershell
1..5 | ForEach-Object {$_ + 2} # => @(3,4,5,6,7)
```

When values are stored in a variable at the end of a pipeline, it will create an array. 
**while** and **do while** loops are available, as well as **until** and **do until** loops which operate so long as their condition is **false**.

```powershell title="Loop examples"
# Process multiple files in a directory
Get-ChildItem . | ForEach-Object { 
    ffmpeg -i $_.Name $_.Name.Replace('m4a','mp3') 
}

# Audible alert when connection re-established
while ($true) {
    if ((Test-NetConnection 8.8.8.8 -WarningAction SilentlyContinue).PingSucceeded -eq $true) {
        [System.Console]::Beep(1000,100)
        break
    }
}

# Download multiple files using template strings and number ranges
1..24 | ForEach-Object {
    Invoke-WebRequest -OutFile ("TGC_3466_Lect{0:d2}_FallPagansOriginsMedievalChristianity.m4v" -f $_) ("https://securedownloads.teach12.com/anon.eastbaymedia-drm/courses/3466/m4v/TGC_3466_Lect{0:d2}_FallPagansOriginsMedievalChristianity.m4v?userid=$USERID&orderid=$ORDERID&courseid=$COURSEID&FName=TGC_3466_Lect{0:d2}_FallPagansOriginsMedievalChristianity" -f $_)
}
```