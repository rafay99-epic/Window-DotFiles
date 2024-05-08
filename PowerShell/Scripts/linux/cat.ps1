# Function that will read file content and thn displayed into the terminal
function cat() {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [ValidateScript({ Test-Path $_ -PathType 'Leaf' })]
        [string]$FilePath
    )

    $content = Get-Content -Path $FilePath
    $content
}