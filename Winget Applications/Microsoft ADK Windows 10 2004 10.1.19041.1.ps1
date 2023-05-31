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

winget show --id Microsoft.WindowsADK --versions
winget install --id=Microsoft.WindowsADK --version 10.1.19041.1 --exact

winget show --id Microsoft.ADKPEAddon --versions
winget install --id=Microsoft.ADKPEAddon --version 10.1.19041.1 --exact