# Import-Module PSReadLine
neofetch
# starship Promote
Invoke-Expression (&starship init powershell)
# this is the terminal icons for dir command
Import-Module -Name Terminal-Icons
Set-PSReadLineOption -PredictionSource History
         
. $PSScriptRoot\Scripts\sudo.ps1
. $PSScriptRoot\Scripts\rm.ps1
. $PSScriptRoot\Scripts\touch.ps1
. $PSScriptRoot\Scripts\cat.ps1
. $PSScriptRoot\Scripts\reload_profile.ps1
. $PSScriptRoot\Scripts\find_file.ps1
. $PSScriptRoot\Scripts\unzip.ps1
. $PSScriptRoot\Scripts\pkill.ps1
. $PSScriptRoot\Scripts\reboot.ps1
. $PSScriptRoot\Scripts\shutdown.ps1
. $PSScriptRoot\Scripts\git_run.ps1
. $PSScriptRoot\Scripts\flutter_run.ps1
. $PSScriptRoot\Scripts\git_status.ps1
. $PSScriptRoot\Scripts\folderRedirect.ps1


# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
    Import-Module "$ChocolateyProfile"
}
