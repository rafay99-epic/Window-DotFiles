if (-not (Get-Module -ListAvailable -Name Recycle)) {
    # If not, install it
    Install-Module -Name Recycle -Scope CurrentUser -Force -SkipPublisherCheck
}

if (-not (Get-Module -Name Recycle)) {
    # If not, import it
    Import-Module -Name Recycle
}