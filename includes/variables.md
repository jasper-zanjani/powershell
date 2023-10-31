Variables are accessed by prefixing the identifier with **$**.

#### Hash tables

[**Hash tables**](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_hash_tables?view=powershell-7.3) are also known as dictionaries or associative arrays in other languages and are composed of key-value pairs.

```powershell title="Hash tables"
$fruit = @{
    Apple = 'red'
    Orange = 'orange'
    Eggplant = 'purple'
}

# Hash tables can be declared inline by placing semicolons between each key-value pair
$fruit = @{ Apple = 'red'; Orange = 'orange'; Eggplant = 'purple' }

# Use the Add method to construct hash tables
$fruit = @{}
$fruit.Add('Apple','red')
$fruit.Add('Orange','orange')
$fruit.Add('Kiwi','green')

# Deep copy or "clone" of a hashtable.
$fruitclone = $fruit.Clone()

$fruit.Keys # => @('Apple','Orange','Kiwi')
$fruit.Values # => @('red','orange','green')
$fruit.Count
$fruit.Remove('Apple')

# Unlike Python, a hash table can be made ordered, changing its data type:
$fruit = [ordered]@{ Apple = 'red'; Orange = 'orange'; Eggplant = 'purple' }
$fruit.GetType().Name # => OrderedDictionary
```

#### Here-strings

Multiline strings are called [**Here-strings**](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_quoting_rules?view=powershell-7.3#here-strings) and appear between **@"** and **"@**:

```powershell title="Multiline string example"
--8<-- "includes/swis-display-linux.ps1"
```

Note that a Here-string will not be processed as an array of lines as in Bash, so it must be split by the newline.

```powershell
$fruit = @"
kiwi
banana
strawberry
"@

$fruit.Split() |% { Write-Host "$_" }
```

#### Environmental variables

[**Automatic variables**](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_automatic_variables?view=powershell-7.3) are variables that store state information for PowerShell and are created and maintained by Powershell (**$$**, **$\_**, **$PSVersionTable**, **$IsLinux**, etc) are PowerShell-specific.

Traditional Windows environment variables are accessed through the **Env** virtual drive using syntax like **$Env:APPDATA**, **$Env:USERNAME**, etc.

#### Writing data to disk

PowerShell object data can be preserved on disk by using [**Export-Clixml**](https://powershellexplained.com/2017-03-18-Powershell-reading-and-saving-data-to-files/#save-rich-object-data-with-export-clixml) and imported again using **Import-Clixml**.

