# display neofetch
# neofetch
winfetch

# Find out if the current user identity is elevated (has admin rights)
$identity = [Security.Principal.WindowsIdentity]::GetCurrent()
$principal = New-Object Security.Principal.WindowsPrincipal $identity
$isAdmin = $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
                                             
# this function will launch nodepad
function n      { notepad $args }

# This function will prmote the current user to admin
function prompt 
{ 
    if ($isAdmin) 
    {
        "[" + (Get-Location) + "] # " 
    }
    else 
    {
        "[" + (Get-Location) + "] $ "
    }
}

$Host.UI.RawUI.WindowTitle = "PowerShell {0}" -f $PSVersionTable.PSVersion.ToString()
if ($isAdmin)
{
    $Host.UI.RawUI.WindowTitle += " [ADMIN]"
}

# Simple function to start a new elevated process. If arguments are supplied then 
# a single command is started with admin rights; if not then a new admin instance
# of PowerShell is started.
function admin
{
    if ($args.Count -gt 0)
    {   
       $argList = "& '" + $args + "'"
       Start-Process "$psHome\powershell.exe" -Verb runAs -ArgumentList $argList
    }
    else
    {
       Start-Process "$psHome\powershell.exe" -Verb runAs
    }
}


# Set UNIX-like aliases for the admin command, so sudo <command> will run the command
# with elevated rights. 
Set-Alias -Name su -Value admin
Set-Alias -Name sudo -Value admin
# Set-Alias -Name cat -Value Get-Content
# Set-Alias -Name touch -Value New-Item


# This function will reload the profile
function reload-profile {
    & $profile
}
# this function will find  the file in the current directory
function find-file($name) {
    Get-ChildItem -recurse -filter "*${name}*" -ErrorAction SilentlyContinue | ForEach-Object {
            $place_path = $_.directory
            Write-Output "${place_path}\${_}"
    }
}
# this function will unzip a file in the current directory
function unzip ($file) {
    Write-Output("Extracting", $file, "to", $pwd)
$fullFile = Get-ChildItem -Path $pwd -Filter .\cove.zip | ForEach-Object{$_.FullName}
    Expand-Archive -Path $fullFile -DestinationPath $pwd
}
# this function will kill a process instantly.
function pkill($name) {
    Get-Process $name -ErrorAction SilentlyContinue | Stop-Process
}

# starship Promote
Invoke-Expression (&starship init powershell)
# this is the terminal icons for dir command
Import-Module -Name Terminal-Icons
# Adding the tab collection to the Powershell
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

                                         
# Alias for Powershell
Set-Alias -Name Restart-Computer -Value reboot
Set-Alias -Name ls -Value dir
Set-Alias -Name Stop-Computer -Value Shutdown

# These are the command that will can give the powershell like fish shell abilities
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History


# Programs used:
# All of these Application can be installed using Sccop 
# learn about scoop here: https://scoop.sh/
# Sccop 
# winfetch or Neofetch 
# terminal-icons
#  lsd
# starship