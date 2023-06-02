<#PSScriptInfo
.VERSION 23.6.1.2
.GUID 69f67667-2df9-4e6f-bf78-2a206d46e0ae
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
Installs Microsoft ADK and the Windows PE add-on for Windows 11, version 22H2, using WinGet
.LINK
https://learn.microsoft.com/en-us/windows-hardware/get-started/adk-install
#>
[CmdletBinding()]
param()

if (Get-Command 'WinGet' -ErrorAction SilentlyContinue) {
    # Show package information
    # winget show --id Microsoft.WindowsADK

    # Show version information
    # winget show --id Microsoft.WindowsADK --versions

    # Install
    winget install --id Microsoft.WindowsADK --version 10.1.22621.1 --exact --accept-source-agreements --accept-package-agreements
    
    # Show package information
    # winget show --id Microsoft.ADKPEAddon
    
    # Show version information
    # winget show --id Microsoft.ADKPEAddon --versions
    
    # Install
    winget install --id Microsoft.ADKPEAddon --version 10.1.22621.1 --exact --accept-source-agreements --accept-package-agreements
    
    New-Item -Path 'C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs' -ItemType Directory -Force
}
else {
    Write-Error -Message 'WinGet is not installed.'
}