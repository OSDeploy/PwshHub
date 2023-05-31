#Requires -RunAsAdministrator

# Install Desktop App Installer
if (-not (Get-Command 'Winget' -ErrorAction SilentlyContinue)) {
    Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe -Verbose
}

if (Get-Command 'Winget' -ErrorAction SilentlyContinue) {
    winget
}
else {
    Write-Error -Message 'Winget could not be installed.'
}

#Microsoft ADK Windows 11 22H2 10.1.22621.1
winget show --id Microsoft.WindowsADK --versions
winget install --id Microsoft.WindowsADK --version 10.1.22621.1 --exact

winget show --id Microsoft.ADKPEAddon --versions
winget install --id Microsoft.ADKPEAddon --version 10.1.22621.1 --exact

New-Item -Path 'C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs' -ItemType Directory -Force

#Microsoft Deployment Toolkit
winget install --id Microsoft.DeploymentToolkit --version 6.3.8456.1000 --exact

#Microsoft Visual Studio Code
winget install --id Microsoft.VisualStudioCode --scope machine --override '/SILENT /mergetasks="!runcode,addcontextmenufiles,addcontextmenufolders"' --accept-source-agreements --accept-package-agreements