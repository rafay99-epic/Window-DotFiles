function trash ($param) {
    Remove-ItemSafely $param
}
function clear_recycle() {
    Clear-RecycleBin
}
function rm() {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [ValidateNotNullOrEmpty()]
        [string]$Path
    )

    Remove-Item -Path $Path -Recurse -Force
}