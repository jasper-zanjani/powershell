Find a sample XML file [here](https://docs.microsoft.com/en-us/previous-versions/windows/desktop/ms762271(v=vs.85) "books.xml")


```powershell
# Assign the output of Get-Content to a variable
[xml]$xdoc = Get-Content books.xml

# The object itself can be treated as a first-class Powershell object using dot notation.
$xdoc.catalog.book | Format-Table -Autosize

# Arrays of elements can be accessed by their index
$xdoc.catalog.book[0]
```

Nodes in the XML object can also be navigated using **XPath** notation with the **SelectNodes** and **SelectSingleNode** methods.

```powershell
$xdoc.SelectNodes('//author')
This produces the same output as the command above (in XPath nodes are 1-indexed).
```powershell
$xdoc.SelectSingleNode('//book[1]')
```

[**Select-Xml**][Select-Xml] wraps the returned XML node with additional metadata, including the pattern searched.

```powershell
(Select-Xml -Xml $xdoc -Xpath '//book[1]').Node

# It can also accept piped input
($xml | Select-Xml -Xpath '//book[1]').Node
```