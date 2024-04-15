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
