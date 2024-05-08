# Check Internet and Update powerShell
. $PSScriptRoot\Scripts\essentials\internetAndUpdate.ps1
# Getting Zoxide
. $PSScriptRoot\Scripts\essentials\zoxide.ps1
# Getting Terminal Icons
. $PSScriptRoot\Scripts\essentials\terminalIcons.ps1
# Geting Chocolate Package Manager
. $PSScriptRoot\Scripts\essentials\choco.ps1
# Getting Recommended
. $PSScriptRoot\Scripts\essentials\recycle_module.ps1
# Getting FastFetch
. $PSScriptRoot\Scripts\essentials\fastfetch.ps1
#  Getting starShip 
. $PSScriptRoot\Scripts\essentials\starship.ps1
# Getting psreadline.ps1
. $PSScriptRoot\Scripts\essentials\psreadline.ps1

# PRedice the command
Set-PSReadLineOption -PredictionSource History

# Linux Commands 
. $PSScriptRoot\Scripts\linux\sudo.ps1
. $PSScriptRoot\Scripts\linux\rm.ps1
. $PSScriptRoot\Scripts\linux\touch.ps1
. $PSScriptRoot\Scripts\linux\cat.ps1
. $PSScriptRoot\Scripts\linux\reload_profile.ps1
. $PSScriptRoot\Scripts\linux\find_file.ps1
. $PSScriptRoot\Scripts\linux\unzip.ps1
. $PSScriptRoot\Scripts\linux\pkill.ps1
. $PSScriptRoot\Scripts\linux\reboot.ps1
. $PSScriptRoot\Scripts\linux\shutdown.ps1

# System Commands
. $PSScriptRoot\Scripts\system\editior.ps1
. $PSScriptRoot\Scripts\system\folderRedirect.ps1
. $PSScriptRoot\Scripts\system\commands.ps1

# Git Commands
. $PSScriptRoot\Scripts\git\git_run.ps1
. $PSScriptRoot\Scripts\git\git_status.ps1

# Flutter Commands
. $PSScriptRoot\Scripts\flutter\flutter_run.ps1
. $PSScriptRoot\Scripts\flutter\flutter_build.ps1
. $PSScriptRoot\Scripts\flutter\flutter_add.ps1

# hugo
. $PSScriptRoot\Scripts\hugo\hugo.ps1

