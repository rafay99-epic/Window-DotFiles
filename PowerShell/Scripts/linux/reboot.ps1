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