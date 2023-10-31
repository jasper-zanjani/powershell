**Positional parameters** can be referenced using the **$args** array, which contains all arguments passed to the function on invocation.
PowerShell appears to automatically handle arrays passed in as the first argument and interpolates spaces between each item this way.

```powershell
function Hello-World
{
    Write-Output "Hello, $args!" # (1)
}
```

1. Note that the [subexpression operator](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_operators?view=powershell-7.3#subexpression-operator--) must be used to evaluate the index if one is provided.
```powershell
function Hello-World
{
    Write-Output "Hello, $($args[0])!"
}
```

There are two ways to declare a **named parameter**, with or without the **param** keyword.
These parameters are still usable as positional parameters, determined by the order in which they are defined, but note that the identifier is case-sensitive  (i.e. **\$name** would become the command-line option **-name**, whereas **\$Name** becomes **-Name** etc).

A named parameter defined without param is required by default.

```powershell
function Hello-World($Name='World')
{
    Write-Output "Hello, $Name!"
}
```

Using param, multiple parameters can be defined in a [**param block**](https://adamtheautomator.com/powershell-parameter/#creating-a-simple-parameter).
Here the single parameter is also [typed](#typing).

```powershell
function Hello-World
{
    param (
        [string]$Name='World'
    )
    Write-Output "Hello, $($Name)!"
}
```

Additional options are available using the [**Parameter** attribute](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_advanced_parameters?view=powershell-7.3#parameter-attribute), which takes various arguments to add functionality.

```powershell
function Hello-World
{
    param(
        [Parameter(Mandatory = $false, Position=0, ValueFromPipeline = $true)]
        [string]$Name = 'World'
    )
    Write-Output "Hello, $Name!"
}
```

**Switch parameters** are typed as a **`switch`** data type.
Boolean values can be explicitly set upon invocation using this syntax:

```powershell
function Switch-Item 
{
    param ([switch]$on)
    if ($on) { "Switch on" }
    else { "Switch off" }
}

Switch-Item             # => Switch off
Switch-Item -On         # => Switch on
Switch-Item -On:$false  # => Switch off
```

Attach common parameters to a custom function by placing **\[CmdletBinding()\]** within the body of a function. 
This allows use of options like **-Verbose** or **-Debug** with custom functions.
Now, using **Write-Verbose** and **Write-Debug** within the function body serve the dual purpose of outputting additional information at the time of execution, when needed, as well as documentation.
