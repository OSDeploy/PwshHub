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
PS C:\> winget search TechSmith.Snagit

Name        Id                    Version      Source
------------------------------------------------------
Snagit 2022 TechSmith.Snagit.2022 22.1.1.21427 winget
Snagit 2021 TechSmith.Snagit.2021 21.4.5.16756 winget
Snagit 2020 TechSmith.Snagit.2020 20.1.8.16558 winget
Snagit 2023 TechSmith.Snagit.2023 23.1.1.27519 winget
#>

#winget install --id TechSmith.Snagit.2020 --exact
#winget install --id TechSmith.Snagit.2021 --exact
#winget install --id TechSmith.Snagit.2022 --exact
winget install --id TechSmith.Snagit.2023 --exact