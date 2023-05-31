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
winget install --id=Microsoft.WindowsADK --version 10.1.22000.1 --exact

winget show --id Microsoft.ADKPEAddon --versions
winget install --id=Microsoft.ADKPEAddon --version 10.1.22000.1 --exact

New-Item -Path 'C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs' -ItemType Directory -Force