# Check if the module is already imported
if (-not (Get-Module -Name PSReadLine)) {
  
    Import-Module -Name PSReadLine
}