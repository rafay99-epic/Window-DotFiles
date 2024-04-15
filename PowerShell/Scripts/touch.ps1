function touch() {
    [CmdletBinding()]
    param (
        [Parameter(Position = 0, Mandatory = $true)]
        [Alias("Path")]
        [string]$FilePath,
        
        [Parameter(Position = 1)]
        [Alias("ItemType")]
        [string]$Type = "File"
    )

    New-Item -Path $FilePath -ItemType $Type
}