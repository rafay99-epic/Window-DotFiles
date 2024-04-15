# Import-Module PSReadLine
neofetch
# starship Promote
Invoke-Expression (&starship init powershell)
# this is the terminal icons for dir command
Import-Module -Name Terminal-Icons
Set-PSReadLineOption -PredictionSource History
                                         

#  Open Up the ::Administrator Powershell
function sudo() {
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


function rm() {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [ValidateNotNullOrEmpty()]
        [string]$Path
    )

    Remove-Item -Path $Path -Recurse -Force
}

# function to create a new file
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

# Function that will read file content and thn displayed into the terminal
function cat() {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [ValidateScript({ Test-Path $_ -PathType 'Leaf' })]
        [string]$FilePath
    )

    $content = Get-Content -Path $FilePath
    $content
}

# This function will reload the profile
function reload_profile() {
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
    $fullFile = Get-ChildItem -Path $pwd -Filter .\cove.zip | ForEach-Object { $_.FullName }
    Expand-Archive -Path $fullFile -DestinationPath $pwd
}
# this function will kill a process instantly.
function pkill($name) {
    Get-Process $name -ErrorAction SilentlyContinue | Stop-Process
}

# Function to restart a system 
function reboot() {
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
function shutdown() {
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

function git_run() {
    # Check if the current directory is a Git repository
    if (-not (Test-Path .git)) {
        Write-Host "❌ This directory is not a Git repository."
    }
    else {
        Write-Host "🚀 Welcome to the Git Commit Script! 🚀"
        Write-Host "This script helps you to commit and push your changes to Git."
        Write-Host
    
        $commitMessage = Read-Host -Prompt "Enter your commit message:"
    
        Write-Host "🛠️ Running Git commands... 🛠️"
    
        $gitCommands = @(
            @{
                Command        = { git add * }
                SuccessMessage = "✅ Git command: git add * executed successfully."
            },
            @{
                Command        = {
                    $maxRetries = 3
                    $retryCount = 0
                    while ($retryCount -lt $maxRetries) {
                        try {
                            git commit -m $commitMessage --gpg-sign
                            break
                        }
                        catch {
                            $retryCount++
                            if ($retryCount -eq $maxRetries) {
                                throw
                            }
                            Start-Sleep -Seconds 5
                        }
                    }
                }
                SuccessMessage = "✅ Git command: git commit -m '$commitMessage' executed successfully."
            },
            @{
                Command        = { git push }
                SuccessMessage = "✅ Git command: git push executed successfully."
            }
        )
    
        foreach ($gitCommand in $gitCommands) {
            try {
                & $gitCommand.Command
                Write-Host $gitCommand.SuccessMessage
            }
            catch {
                Write-Host "❌ An error occurred while executing the Git commands: $_"
                $_ | Out-File -FilePath .\error.log -Append
                break
            }
        }
    
        Write-Host "✅ Git commands executed successfully. Your changes have been committed and pushed."
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
