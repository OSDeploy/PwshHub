<#PSScriptInfo
.VERSION 23.6.1.2
.GUID 41dbd315-8edb-4398-be86-2d36aa0b63e0
.AUTHOR David Segura
.COMPANYNAME David Segura
.COPYRIGHT (c) 2023 David Segura. All rights reserved.
.TAGS WinGet
.LICENSEURI https://raw.githubusercontent.com/git-for-windows/git/main/COPYING
.PROJECTURI https://github.com/git-for-windows
.ICONURI 
.EXTERNALMODULEDEPENDENCIES 
.REQUIREDSCRIPTS 
.EXTERNALSCRIPTDEPENDENCIES 
.RELEASENOTES
#>
#Requires -RunAsAdministrator
<#
.DESCRIPTION
Installs Git for Windows using WinGet
.LINK
https://gitforwindows.org/
#>
[CmdletBinding()]
param()

if (Get-Command 'WinGet' -ErrorAction SilentlyContinue) {
    # Show package information
    # winget show --id Git.Git
    
    # Show version information
    # winget show --id Git.Git --versions
    
    # Install
    winget install --id Git.Git --exact --accept-source-agreements --accept-package-agreements
}
else {
    Write-Error -Message 'WinGet is not installed.'
}