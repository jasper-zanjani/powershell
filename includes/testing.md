[**Pester**](https://pester.dev/docs/quick-start) tests are organized in a hierarchy of blocks and run with [`Invoke-Pester`](https://www.red-gate.com/simple-talk/sysadmin/powershell/introduction-to-testing-your-powershell-code-with-pester/):

```powershell
Describe
{
  Context # optional
  {
    It
    {
      Should # assertion statements accept a value passed in via pipe and **must** be called within a `Describe` block
    }
  }
}
```

```powershell
New-Fixture deploy Foo

function Foo 
{
  # ...
}

Describe 'Foo' 
{
    $true | Should -Be $true 
}
```

The block in braces is actually an argument pass to the `-Fixture` parameter.

```powershell
Describe "Best airports in the USA" -Fixture 
{
    It -Name "RDU is one of the best airports" -Test 
    {
        $Output = Get-Airport -City "Raleigh"
        $Output | Should -BeOfType System.Collections.Hashtable
    }
}
```
