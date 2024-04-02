Write-Output "

        ███████╗██╗██╗     ███████╗    ██████╗ ██╗      █████╗  ██████╗███████╗███╗   ███╗███████╗███╗   ██╗████████╗
        ██╔════╝██║██║     ██╔════╝    ██╔══██╗██║     ██╔══██╗██╔════╝██╔════╝████╗ ████║██╔════╝████╗  ██║╚══██╔══╝
        █████╗  ██║██║     █████╗      ██████╔╝██║     ███████║██║     █████╗  ██╔████╔██║█████╗  ██╔██╗ ██║   ██║   
        ██╔══╝  ██║██║     ██╔══╝      ██╔═══╝ ██║     ██╔══██║██║     ██╔══╝  ██║╚██╔╝██║██╔══╝  ██║╚██╗██║   ██║   
        ██║     ██║███████╗███████╗    ██║     ███████╗██║  ██║╚██████╗███████╗██║ ╚═╝ ██║███████╗██║ ╚████║   ██║   
        ╚═╝     ╚═╝╚══════╝╚══════╝    ╚═╝     ╚══════╝╚═╝  ╚═╝ ╚═════╝╚══════╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝   ╚═╝   
                                                                                                             
"
#  Optimized Version of the Script
function CopyFolder($sourcePath, $destinationPath) {
    try {
        if (Test-Path $sourcePath) {
            Copy-Item -Path $sourcePath -Destination $destinationPath -Recurse -Force
            Write-Host "📁 Folder copied successfully to $destinationPath 🎉"
        } else {
            throw "❌ Source folder not found at $sourcePath"
        }
    } catch {
        Write-Host "An error occurred: $_" -ForegroundColor Red
        Write-Host "Please check the paths and try again." -ForegroundColor Yellow
    }
}

function MoveFolder($sourceFolder, $destinationPath) {
    try {
        $username = $env:USERNAME
        $userDestinationPath = "C:\Users\$username\$destinationPath"
        if (!(Test-Path $userDestinationPath)) {
            Write-Host "❌ Destination folder not found for user $username"
        } else {
            Move-Item -Path $sourceFolder -Destination $userDestinationPath -Force
            Write-Host "✅ Folder moved to $destinationPath for user $username"
        }
    } catch {
        Write-Host "❌ An error occurred: $_.Exception.Message"
    }
}

# Copying the .config folder
$currentUsername = $env:USERNAME
$sourcePath = ".\.config"
$destinationPath = "C:\Users\$currentUsername\"
CopyFolder $sourcePath $destinationPath

# Moving the PowerShell and WindowPowerShell folders
MoveFolder ".\PowerShell" "Documents"
MoveFolder ".\WindowsPowerShell" "Documents"

# Moving the Window Terminal settings.json file
$destinationPath = "AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"
MoveFolder ".\Window-Terminal\settings.json" $destinationPath




#  Orginal Code

# try {
#     $currentUsername = $env:USERNAME

#     $sourcePath = ".\.config"
#     $destinationPath = "C:\Users\$currentUsername\"

#     try {
#         if (Test-Path $sourcePath) {
#             Copy-Item -Path $sourcePath -Destination $destinationPath -Recurse -Force
#             Write-Host "📁 Folder Copyed successfully to $destinationPath 🎉"
#         } else {
#             throw "❌ Source folder not found at $sourcePath"
#         }
#     } catch {
#         Write-Host "An error occurred: $_" -ForegroundColor Red
#         Write-Host "Please check the paths and try again." -ForegroundColor Yellow
#     }    
# }
# catch {
#     Write-Host "❌ An error occurred: $_.Exception.Message"
# }


# # Moving the PowerShell and WindowPowerShell Config Files

# try {
#     # Get the username of the currently logged-in user
#     $username = $env:USERNAME

#     # Check if the Documents directory exists for the user
#     $documentsPath = "C:\Users\$username\Documents"
#     if (!(Test-Path $documentsPath)) {
#         Write-Host "📁 Documents directory not found for user $username"
#     } else {
#         # Move the 'PowerShell' and 'WindowPowerShell' folders to the Documents directory
#         Move-Item -Path ".\PowerShell" -Destination $documentsPath -Force
#         Move-Item -Path ".\WindowsPowerShell" -Destination $documentsPath -Force
#         Write-Host "✅ Folders moved to Documents directory for user $username"
#     }
# } catch {
#     Write-Host "❌ An error occurred: $_.Exception.Message"
# }


# # config File for Window Terminal

# try {
#     # Get the username of the currently logged-in user
#     $username = $env:USERNAME

#     # Check if the user's folder exists
#     $destinationPath = "C:\Users\$username\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"
#     if (!(Test-Path $destinationPath)) {
#         Write-Host "❌ Destination folder not found for user $username"
#     } else {
#         # Move the 'settings.json' file to the destination folder
#         $sourceFile = ".\Window-Terminal\settings.json"  # Replace with the actual path of your 'settings.json' file
#         Move-Item -Path $sourceFile -Destination $destinationPath -Force
#         Write-Host "✅ 'settings.json' file moved to destination folder for user $username"
#     }
# } catch {
#     Write-Host "❌ An error occurred: $_.Exception.Message"
# }