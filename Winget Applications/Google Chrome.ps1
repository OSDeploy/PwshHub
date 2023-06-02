<#PSScriptInfo
.VERSION 23.6.1.2
.GUID 663f8d08-d625-46de-8158-3eb7b35035e4
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
Installs Google Chrome using WinGet
#>
[CmdletBinding()]
param()

if (Get-Command 'WinGet' -ErrorAction SilentlyContinue) {
    # Show package information
    # winget show --id Google.Chrome
    
    # Show version information
    # winget show --id Google.Chrome --versions
    
    # Install
    winget install --id Google.Chrome --exact --accept-source-agreements --accept-package-agreements
}
else {
    Write-Error -Message 'WinGet is not installed.'
}