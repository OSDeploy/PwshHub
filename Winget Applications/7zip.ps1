<#PSScriptInfo
.VERSION 23.6.1.2
.GUID c59ab872-e655-4585-9b2b-3d99e6a77710
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
Installs 7zip using WinGet
#>
[CmdletBinding()]
param()

if (Get-Command 'WinGet' -ErrorAction SilentlyContinue) {
    # Show package information
    # winget show --id 7zip.7zip
    
    # Show version information
    # winget show --id 7zip.7zip --versions
    
    # Install
    winget install --id 7zip.7zip -exact --accept-source-agreements --accept-package-agreements
}
else {
    Write-Error -Message 'WinGet is not installed.'
}