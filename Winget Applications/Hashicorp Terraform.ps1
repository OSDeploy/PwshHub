<#PSScriptInfo
.VERSION 23.6.1.2
.GUID 6c766924-9436-496c-9217-f36adcdccf01
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
Installs Hashicorp Terraform using WinGet
#>
[CmdletBinding()]
param()

if (Get-Command 'WinGet' -ErrorAction SilentlyContinue) {
    # Show package information
    # winget show --id Hashicorp.Terraform
    
    # Show version information
    # winget show --id Hashicorp.Terraform --versions
    
    # Install
    winget install --id Hashicorp.Terraform --exact --accept-source-agreements --accept-package-agreements
}
else {
    Write-Error -Message 'WinGet is not installed.'
}