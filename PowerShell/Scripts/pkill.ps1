# this function will kill a process instantly.
function pkill($name) {
    Get-Process $name -ErrorAction SilentlyContinue | Stop-Process
}