Functions are declared with the **function** keyword and the body in braces.

```powershell
function Hello-World
{
    Write-Output "Hello, World!"
}
```

**Positional parameters** can be referenced using the **$args** array, which contains all arguments passed to the function on invocation.
PowerShell appears to automatically handle arrays passed in as the first argument and interpolates spaces between each item this way.

```powershell
function Hello-World
{
    Write-Output "Hello, $($args[0])!"
}
```

There are two ways to declare a **named parameter**, with or without the **param** keyword.
These parameters are still usable as positional parameters, determined by the order in which they are defined (?), but note that the case of the identifier is preserved to define the option (i.e. "$name" becomes "-name", etc).
A named parameter has to be used.

```powershell
function Hello-World($Name='World')
{
    Write-Output "Hello, $($Name)!"
}
```

Using param, multiple parameters can be defined in a [**param block**](https://adamtheautomator.com/powershell-parameter/#creating-a-simple-parameter), which would probably make more sense for complicated functions using multiple parameters.
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

<!-- 

**Named parameters** can be declared in one of two ways. 

- Within the function body using the **param** keyword, followed by the name of the variable representing the parameter's value, enclosed in **`$(...)`**:
- Directly after the function name in parentheses, with each parameter separated by a comma.

The name of the variable becomes the named parameter used when invoking the function.
Default values for parameters can be specified by placing them within the parentheses.

Parameters can be made mandatory by preceding the parameter name with `[Parameter(Mandatory=$true)]`. 
Parameters can be static typed by preceding the parameter identifier with the data type in brackets.

=== "Positional parameter"

    ```powershell
    function Get-LargeFiles 
    {
        Get-ChildItem C:\Users\Michael\Documents |
            where {$_.Length -gt $args[0] and !$_PSIscontainer} |
            Sort-Object Length -Descending
    }
    ```

=== "Named parameter"

    ```powershell
    function Get-LargeFiles($Size) 
    {
        # param ($Size)
        Get-ChildItem C:\Users\Michael\Documents |
            where {$_.Length -gt $Size -and !$_.PSIsContainer} |
            Sort-Object Length -Descending
    }
    ```

=== "Using param"

    ```powershell
    function Get-LargeFiles 
    {
        param ($Size)
        Get-ChildItem C:\Users\Michael\Documents |
            where {$_.Length -gt $Size -and !$_.PSIsContainer} |
            Sort-Object Length -Descending
    }
    ```

=== "Default value"

    ```powershell
    function Get-LargeFiles 
    {
        param ($Size=2000)
        Get-ChildItem C:\Users\Michael\Documents |
            where {$_.Length -gt $Size -and !$_.PSIsContainer} |
            Sort-Object Length -Descending
    }
    ```

=== "Typed"

    ```powershell
    function Get-LargeFiles 
    {
        param ([int]$Size=2000)
        Get-ChildItem C:\Users\Michael\Documents |
            where {$_.Length -gt $Size -and !$_.PSIsContainer} |
            Sort-Object Length -Descending
    }
    ```

=== "Invocation"

    ```powershell
    Get-LargeFiles -Size 2000
    ```

**Switch parameters** are typed as a **`switch`** data type.
Boolean values can be explicitly set upon invocation using this syntax:

=== "Switch-Item"

    ```powershell
    function Switch-Item 
    {
        param ([switch]$on)
        if ($on) { "Switch on" }
        else { "Switch off" }
    }
    ```

=== "Invocation"

    ```powershell
    Switch-Item             # => Switch off
    Switch-Item -On         # => Switch on
    Switch-Item -On:$false  # => Switch off
    ```

Attach common parameters to a custom function by placing the `[CmdletBinding()]` within the body of a function. 
This allows use of options like `-Verbose` or `-Debug` with custom functions.
Now, using `Write-Verbose` and `Write-Debug` within the function body serve the dual purpose of outputting additional information at the time of execution, when needed, as well as documentation.


-->