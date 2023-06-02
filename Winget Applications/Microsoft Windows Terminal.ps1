#Requires -RunAsAdministrator

# Install Winget
if (-not (Get-Command 'Winget' -ErrorAction SilentlyContinue)) {
    Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe -Verbose
}

if (Get-Command 'Winget' -ErrorAction SilentlyContinue) {
    winget
}
else {
    Write-Error -Message 'Winget could not be installed.'
}

winget install --id Microsoft.WindowsTerminal --exact