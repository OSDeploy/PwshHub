<#PSScriptInfo
.VERSION 23.6.1.2
.GUID 779bd0b9-c695-439e-a64c-51bacbd4894a
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
Install Package Visual Studio Entreprise 2022 using WinGet
#>
[CmdletBinding()]
param(
    [ValidateNotNullOrEmpty()]
    [string]$id = 'Microsoft.VisualStudio.2022.Enterprise'
)

if (Get-Command 'WinGet' -ErrorAction SilentlyContinue) {
    # Show package information
    # winget show --id $id
    
    # Show version information
    # winget show --id $id --versions
    
    # Install
    winget install --id $id --exact --accept-source-agreements --accept-package-agreements
}
else {
    Write-Error -Message 'WinGet is not installed.'
}