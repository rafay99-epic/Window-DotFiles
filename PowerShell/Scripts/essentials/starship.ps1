$logFile = "starship_install_log.txt"

function LogError {
    param([string]$message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "----------------------------" | Out-File -FilePath $logFile -Append
    "Date: $timestamp" | Out-File -FilePath $logFile -Append
    "Error Message: $message" | Out-File -FilePath $logFile -Append
    "----------------------------" | Out-File -FilePath $logFile -Append
}

try {
    if (Get-Command starship -ErrorAction SilentlyContinue) {
        Invoke-Expression (&starship init powershell)
    }
    else {
        Write-Host "Starship is not installed. Installing now..."
        winget install starship --accept-source-agreements --accept-package-agreements
        if (-not (Get-Command starship -ErrorAction SilentlyContinue)) {
            throw "Failed to install Starship."
        }
        Invoke-Expression (&starship init powershell)
    }
}
catch {
    LogError $_
    Write-Host "An error occurred. Check $logFile for details." -ForegroundColor Red
}