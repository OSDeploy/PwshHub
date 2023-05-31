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

<#
PS C:\> winget search TechSmith.Camtasia

Name     Id                 Version      Source
------------------------------------------------
Camtasia TechSmith.Camtasia 22.5.2.44147 winget
#>

winget install --id TechSmith.Camtasia --exact