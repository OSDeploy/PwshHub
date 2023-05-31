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
PS C:\> winget search Notepad++.Notepad++

Name      Id                  Version Source
---------------------------------------------
Notepad++ Notepad++.Notepad++ 8.5.3   winget
#>

winget install --id Notepad++.Notepad++ --exact