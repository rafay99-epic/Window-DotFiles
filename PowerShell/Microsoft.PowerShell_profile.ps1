# Import-Module PSReadLine
neofetch
# starship Promote
Invoke-Expression (&starship init powershell)
# this is the terminal icons for dir command
Import-Module -Name Terminal-Icons
Set-PSReadLineOption -PredictionSource History
                                         

#  Open Up the ::Administrator Powershell
function sudo {
    if ($args.Count -gt 0) {
        $argList = "& '" + $args + "'"
        $wtExe = "wt.exe"
        Start-Process -FilePath $wtExe -ArgumentList "-p", "Windows PowerShell", "-NoExit", "-c", $argList -Verb RunAs
    }
    else {
        $wtExe = "wt.exe"
        Start-Process -FilePath $wtExe -ArgumentList "-p", "Windows PowerShell", "pwsh.exe" -Verb RunAs
    }
}

# Function to Remove Items 
function rm {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [ValidateNotNullOrEmpty()]
        [string]$Path
    )

    Remove-Item -Path $Path -Recurse -Force
}

# function to create a new file
function touch {
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

# Function that will read file content and thn displayed into the terminal
function cat {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [ValidateScript({Test-Path $_ -PathType 'Leaf'})]
        [string]$FilePath
    )

    $content = Get-Content -Path $FilePath
    $content
}

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

# Function to restart a system 
function Restart-System {
    [CmdletBinding()]
    param (
        [switch]$Force
    )

    if ($Force) {
        Restart-Computer -Force
    }
    else {
        Restart-Computer
    }
}
# A function for shutting Down the system
function Shutdown-System {
    [CmdletBinding()]
    param (
        [switch]$Force
    )

    if ($Force) {
        Stop-Computer -Force
    }
    else {
        Stop-Computer
    }
}

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
