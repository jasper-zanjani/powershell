Types are placed in brackets immediately preceding the variable name when declaring variables.

```powershell title="Typing"
[double]$Price
[int]$Quantity
[string]$Description
```

Data can be **cast** to specific types by placing the data type in brackets immediately preceding the literal.

```powershell title="Casting"
$Number = [int]'04'
$FailedCast = [int]'Hello'
```

A value's type can be inspected by using the [**GetType()**](https://practicalpowershell.com/what-type-gettype/) method on a variable or even literal.

```powershell
# Get type of a variable
$PSVersionTable.GetType() # (1)

# Get type of an integer literal
(12).GetType() # (2)
```

1. 
```
IsPublic IsSerial Name                                     BaseType
-------- -------- ----                                     --------
True     False    PSVersionHashTable                       System.Collections.Hashtable
```
2. 
```
IsPublic IsSerial Name                                     BaseType
-------- -------- ----                                     --------
True     True     Int32                                    System.ValueType
```

A **type accelerator** is an alias for a .NET class.
In fact the example types used above (double, int, string, etc) are technically type accelerators.

```powershell
[System.Management.Automation.PSObject].Assembly.GetType("System.Management.Automation.TypeAccelerators")::Get
```