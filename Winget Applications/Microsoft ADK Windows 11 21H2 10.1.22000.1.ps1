<#PSScriptInfo
.VERSION 23.6.1.2
.GUID f857b95f-4cd5-43f1-839d-712d3e1dbb21
.AUTHOR David Segura
.COMPANYNAME David Segura
.COPYRIGHT (c) 2023 David Segura. All rights reserved.
.TAGS WinGet
.LICENSEURI 
.PROJECTURI https://github.com/OSDeploy/PwshHub
.ICONURI 
.EXTERNALMODULEDEPENDENCIES 
.REQUIREDSCRIPTS 
.EXTERNALSCRIPTDEPENDENCIES 
.RELEASENOTES
#>
#Requires -RunAsAdministrator
<#
.DESCRIPTION
Installs Microsoft ADK and the Windows PE add-on for Windows 11, version 21H2, using WinGet
.LINK
https://learn.microsoft.com/en-us/windows-hardware/get-started/adk-install
#>
[CmdletBinding()]
param()

if (Get-Command 'WinGet' -ErrorAction SilentlyContinue) {
    winget show --id Microsoft.WindowsADK --versions
    winget install --id=Microsoft.WindowsADK --version 10.1.22000.1 --exact --accept-source-agreements --accept-package-agreements

    winget show --id Microsoft.ADKPEAddon --versions
    winget install --id=Microsoft.ADKPEAddon --version 10.1.22000.1 --exact --accept-source-agreements --accept-package-agreements
    
    New-Item -Path 'C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs' -ItemType Directory -Force
}
else {
    Write-Error -Message 'WinGet is not installed.'
}