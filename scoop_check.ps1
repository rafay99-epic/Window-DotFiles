# Check if Scoop is installed
$scoopCheck = (Get-Command "scoop" -ErrorAction SilentlyContinue)

if ($null -eq $scoopCheck) {
    Write-Host "Scoop is not installed. Installing Scoop..."
    Invoke-RestMethod get.scoop.sh | Invoke-Expression
    # This command installs Scoop if it's not found
    Write-Host "Scoop installation completed."
} else {
    Write-Host "Scoop is already installed."
}

# Install  Scoop  Libiary
scoop bucket add main
scoop bucket add extras