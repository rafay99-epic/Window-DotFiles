function flutter_build() {
    $logFile = "build_log.txt"

    if (!(Test-Path "pubspec.yaml") -or !(Test-Path "lib")) {
        Write-Host "This does not appear to be a Flutter project." -ForegroundColor Red
        return
    }

    Write-Host 'Enter your platform (android or web)' -ForegroundColor Blue
    $platform = Read-Host

    function LogError {
        param([string]$message)
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        "----------------------------" | Out-File -FilePath $logFile -Append
        "Date: $timestamp" | Out-File -FilePath $logFile -Append
        "Error Message: $message" | Out-File -FilePath $logFile -Append
        "----------------------------" | Out-File -FilePath $logFile -Append
    }

    try {
        if ($platform -eq 'android') {
            flutter build apk --release
        }
        elseif ($platform -eq 'web') {
            Write-Host 'Building for web...' -ForegroundColor Yellow
            flutter build web --release
        }
        else {
            Write-Host "Invalid platform. Please enter 'android' or 'web'." -ForegroundColor Red
        }
    }
    catch {
        LogError "Failed to build for $platform : $_"
        Write-Host "Failed to build for $platform. Check $logFile for details." -ForegroundColor Red
    }
}

