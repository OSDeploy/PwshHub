<#PSScriptInfo
.VERSION 23.6.1.2
.GUID 6c128723-0f1b-4c22-8cf6-0a809a5b9757
.AUTHOR Jérôme Bezet-Torres
.COMPANYNAME Jérôme Bezet-Torres
.COPYRIGHT (c) 2023 Jérôme Bezet-Torres. All rights reserved.
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
Installs Hashicorp Packer using WinGet
#>
[CmdletBinding()]
param()

if (Get-Command 'WinGet' -ErrorAction SilentlyContinue) {
    # Show package information
    # winget show --id Hashicorp.Packer
    
    # Show version information
    # winget show --id Hashicorp.Packer --versions
    
    # Install
    winget install --id Hashicorp.Packer --exact --accept-source-agreements --accept-package-agreements
}
else {
    Write-Error -Message 'WinGet is not installed.'
}