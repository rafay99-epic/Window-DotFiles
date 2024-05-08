function Install-Fastfetch {
    $logFile = "install_log.txt"

    function LogError {
        param([string]$message)
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        "----------------------------" | Out-File -FilePath $logFile -Append
        "Date: $timestamp" | Out-File -FilePath $logFile -Append
        "Error Message: $message" | Out-File -FilePath $logFile -Append
        "----------------------------" | Out-File -FilePath $logFile -Append
    }

    try {
        if (-not(Get-Command fastfetch -ErrorAction SilentlyContinue)) {
            if (Get-Command scoop -ErrorAction SilentlyContinue) {
                Write-Host "Scoop is installed."
                scoop install fastfetch
                Start-Sleep -Seconds 10  # Add a delay to give fastfetch time to finish running
            }
            else {
                Write-Host "Scoop is not installed."
                Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
                Invoke-RestMethod -Uri https://get.scoop.sh -UseBasicParsing | Invoke-Expression
                if (Get-Command scoop -ErrorAction SilentlyContinue) {
                    scoop install fastfetch
                    Start-Sleep -Seconds 10  # Add a delay to give fastfetch time to finish running
                }
                else {
                    throw "Failed to install Scoop and Fastfetch."
                }
            }
        }
        else {
            fastfetch
        }
    }
    catch {
        LogError $_
        Write-Host "An error occurred. Check $logFile for details." -ForegroundColor Red
    }
}

Install-Fastfetch