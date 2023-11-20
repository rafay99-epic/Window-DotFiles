Write-Output "

██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     ██╗███╗   ██╗ ██████╗     ███████╗ ██████╗ ███╗   ██╗████████╗███████╗
██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ██║████╗  ██║██╔════╝     ██╔════╝██╔═══██╗████╗  ██║╚══██╔══╝██╔════╝
██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     ██║██╔██╗ ██║██║  ███╗    █████╗  ██║   ██║██╔██╗ ██║   ██║   ███████╗
██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ██║██║╚██╗██║██║   ██║    ██╔══╝  ██║   ██║██║╚██╗██║   ██║   ╚════██║
██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗██║██║ ╚████║╚██████╔╝    ██║     ╚██████╔╝██║ ╚████║   ██║   ███████║
╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝     ╚═╝      ╚═════╝ ╚═╝  ╚═══╝   ╚═╝   ╚══════╝
                                                                                                                            
"

# Change to the 'fonts' directory within the current directory where the script is located
Set-Location -Path ".\fonts"

# Get all font files in the 'fonts' directory
$fontFiles = Get-ChildItem -Path "." -Filter *.ttf -Recurse

foreach ($fontFile in $fontFiles) {
    $fontName = $fontFile.Name
    Write-Host "⬇️ Installing font: $fontName"
    
    # Install the font for the current user
    $fontPath = $fontFile.FullName
    $fontFolder = [System.Environment]::GetFolderPath('Fonts')
    $fontDestination = Join-Path -Path $fontFolder -ChildPath $fontName
    
    try {
        [System.IO.File]::Copy($fontPath, $fontDestination, $true)
        Write-Host "✅ Font '$fontName' installed successfully."
    } catch {
        Write-Host "❌ Failed to install font '$fontName'. Error: $_"
    }
}
