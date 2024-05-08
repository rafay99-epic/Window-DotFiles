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