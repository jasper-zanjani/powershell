Variables are accessed by prefixing the identifier with **$**.



[**Automatic variables**](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_automatic_variables?view=powershell-7.3) are variables that store state information for PowerShell and are created and maintained by Powershell (**$$**, **$\_**, **$PSVersionTable**, **$IsLinux**, etc) are PowerShell-specific.

Traditional Windows environment variables are accessed through the **Env** virtual drive using syntax like **$Env:APPDATA**, **$Env:USERNAME**, etc.

Data types are placed in brackets immediately preceding the variable name when declaring variables.

```powershell title="Typing"
[double]$Price
[int]$Quantity
[string]$Description
```

Data can be cast by placing the data type in brackets immediately preceding the literal.

```powershell title="Casting"
$Number = [int]'04'
$FailedCast = [int]'Hello'
```

```powershell title="Hash tables"
$fruit = @{
    Apple = 'red'
    Orange = 'orange'
    Eggplant = 'purple'
}

# Hash tables can be declared inline by placing semicolons between each key-value pair
$fruit = @{ Apple = 'red'; Orange = 'orange'; Eggplant = 'purple' }

# Use methods to construct hash tables
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

**Template strings**
