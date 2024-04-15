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