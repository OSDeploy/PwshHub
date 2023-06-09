<#PSScriptInfo
.VERSION 23.6.8.1
.GUID aae0cd11-3e0d-4384-92d2-eade0def8ff9
.AUTHOR David Segura
.COMPANYNAME David Segura
.COPYRIGHT (c) 2023 David Segura. All rights reserved.
.TAGS Microsoft Graph SDK
.LICENSEURI 
.PROJECTURI
.ICONURI 
.EXTERNALMODULEDEPENDENCIES 
.REQUIREDSCRIPTS 
.EXTERNALSCRIPTDEPENDENCIES 
.RELEASENOTES
#>
<#
.DESCRIPTION
API Version
By default, the SDK uses the Microsoft Graph REST API v1.0.
Cmdlets are available for the API version that is selected.
You can change the profile by using the Select-MgProfile command.
.LINK
https://learn.microsoft.com/en-us/powershell/microsoftgraph/get-started?view=graph-powershell-1.0
#>
[CmdletBinding()]
param()

if ((Get-ExecutionPolicy -Scope CurrentUser) -eq 'Restricted') {
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
}

try {
    Get-InstalledModule Microsoft.Graph -ErrorAction Stop
}
catch {
    Install-Module Microsoft.Graph -Scope CurrentUser -Verbose
}

Get-InstalledModule Microsoft.Graph