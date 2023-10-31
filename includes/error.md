[**Write-Error**](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/write-error?view=powershell-7.3) declare a non-terminating error.

```powershell
Write-Error "Hello, World!"
```

[**Get-Error**](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/get-error?view=powershell-7.3) displays the most recent error in the **error stream**.

[**Try-catch** blocks](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_try_catch_finally?view=powershell-7.3) can be used for error handling.
An error raised within the try block is handled in an appropriate catch block.

Here, the specific error raised when an AD group is not found is handled in the first catch block.
The second catch block, which will handle all other errors, will never be reached.

```powershell
try {
    Get-ADGroup NoSuchGroup
}
catch [Microsoft.ActiveDirectory.Management.ADIdentityNotFoundException] {
    Write-Error "No such group found!"
}
catch {
    Write-Error "Other error!"
}
```

Within the catch block, the current error can be accessed using **\$_** or **\$PSItem**

[**Trap**](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_trap?view=powershell-7.3) handles a terminating error and appears to be a coarser and less recommended way of handling exceptions.