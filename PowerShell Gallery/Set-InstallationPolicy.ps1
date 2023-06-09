<#PSScriptInfo
.VERSION 23.6.8.1
.GUID fe207d11-cf51-437b-98e9-b078eb94475f
.AUTHOR David Segura
.COMPANYNAME David Segura
.COPYRIGHT (c) 2023 David Segura. All rights reserved.
.TAGS Microsoft PowerShell Gallery
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
Install the Microsoft Graph PowerShell SDK
.LINK
https://learn.microsoft.com/en-us/powershell/microsoftgraph/installation?view=graph-powershell-1.0
#>

if ((Get-PSRepository -Name PSGallery) -eq 'Untrusted') {
    try {
        Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
    }
    catch {
        Throw
    }
}