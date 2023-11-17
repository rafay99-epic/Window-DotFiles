# Script Parts
    # Check system 
        # 1. Scoop Check 
        # 2. Winget Check
        # 3. Admin Check 

    #  Install application 
        # 1. Winget Install 
        # 2. Scoop install application

    # Placing the configuration files into the correct place
        # 1. lsd config 
        # 2. neofetch config 
        # 3. starship promote 
        # 4. Window Terminal config File
        # 5. PowerShell Config files
        # 6. PowerShell
        
Write-Output"

██╗    ██╗██╗███╗   ██╗██████╗  ██████╗ ██╗    ██╗███████╗    ███████╗ ██████╗██████╗ ██╗██████╗ ████████╗
██║    ██║██║████╗  ██║██╔══██╗██╔═══██╗██║    ██║██╔════╝    ██╔════╝██╔════╝██╔══██╗██║██╔══██╗╚══██╔══╝
██║ █╗ ██║██║██╔██╗ ██║██║  ██║██║   ██║██║ █╗ ██║███████╗    ███████╗██║     ██████╔╝██║██████╔╝   ██║   
██║███╗██║██║██║╚██╗██║██║  ██║██║   ██║██║███╗██║╚════██║    ╚════██║██║     ██╔══██╗██║██╔═══╝    ██║   
╚███╔███╔╝██║██║ ╚████║██████╔╝╚██████╔╝╚███╔███╔╝███████║    ███████║╚██████╗██║  ██║██║██║        ██║   
 ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝  ╚══╝╚══╝ ╚══════╝    ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝╚═╝        ╚═╝   
                                                                                                          
"

# Check if the script is running as administrator
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (-not $isAdmin) {
    Write-Host "PowerShell session is not running with administrator privileges. Exiting..."
    exit
} else {
    Write-Host "PowerShell session is running with administrator privileges."
    
    #  Some commadn that are required
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
    Install-Module -Name Terminal-Icons -Repository PSGallery

    # Running Part:  
    # check for winget
    .\winget-check.ps1
    # check for scoop
    .\scoop_check.ps1
    # instlling Fonts
    .\install-fonts.ps1
    # Installing application
    .\installApp.ps1
}











