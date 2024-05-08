function find_file($name) {
    Get-ChildItem -recurse -filter "*${name}*" -ErrorAction SilentlyContinue | ForEach-Object {
        $place_path = $_.directory
        $file_name = $_.Name
        Write-Host "File: $file_name" -ForegroundColor Cyan
        Write-Host "Location: $place_path" -ForegroundColor Green
        Write-Host "-------------------------" -ForegroundColor Yellow
    }
}