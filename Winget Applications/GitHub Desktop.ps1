<#PSScriptInfo
.VERSION 23.6.1.2
.GUID 4a7ed6d8-7b58-4f97-9214-0b727fed59a7
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
Installs GitHub Desktop using WinGet
#>
[CmdletBinding()]
param()

if (Get-Command 'WinGet' -ErrorAction SilentlyContinue) {
    # Show package information
    # winget show --id GitHub.GitHubDesktop
    
    # Show version information
    # winget show --id GitHub.GitHubDesktop --versions
    
    # Install
    winget install --id GitHub.GitHubDesktop --exact --accept-source-agreements --accept-package-agreements
}
else {
    Write-Error -Message 'WinGet is not installed.'
}