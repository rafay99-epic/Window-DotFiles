Write-Output "

██████╗ ██╗  ██╗███████╗ ██████╗██╗  ██╗     ██╗    ██╗██╗███╗   ██╗ ██████╗ ███████╗████████╗
██╔════╝██║  ██║██╔════╝██╔════╝██║ ██╔╝    ██║    ██║██║████╗  ██║██╔════╝ ██╔════╝╚══██╔══╝
██║     ███████║█████╗  ██║     █████╔╝     ██║ █╗ ██║██║██╔██╗ ██║██║  ███╗█████╗     ██║   
██║     ██╔══██║██╔══╝  ██║     ██╔═██╗     ██║███╗██║██║██║╚██╗██║██║   ██║██╔══╝     ██║   
╚██████╗██║  ██║███████╗╚██████╗██║  ██╗    ╚███╔███╔╝██║██║ ╚████║╚██████╔╝███████╗   ██║   
 ╚═════╝╚═╝  ╚═╝╚══════╝ ╚═════╝╚═╝  ╚═╝     ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝   ╚═╝   
                                                                                                                                                                                 
"
# Check if Winget is installed
$wingetCheck = (Get-Command "winget" -ErrorAction SilentlyContinue)

if ($null -eq $wingetCheck) {
    Write-Host "Winget is not installed. Installing Winget..."
    $wingetInstallerUrl = "https://github.com/microsoft/winget-cli/releases/latest/download/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.appxbundle"
    $tempFile = "$env:TEMP\winget.appxbundle"

    # Download the Winget installer
    Invoke-WebRequest -Uri $wingetInstallerUrl -OutFile $tempFile

    # Install Winget
    Add-AppxPackage -Path $tempFile

    Write-Host "Winget installation completed."
} else {
    Write-Host "Winget is already installed."
}
