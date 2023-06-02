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

#winget install --id Microsoft.PowerShell --exact --accept-source-agreements --accept-package-agreements
winget install --id Microsoft.PowerShell --exact --scope machine --override '/quiet ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL=1 ADD_PATH=1' --accept-source-agreements --accept-package-agreements