#region PowerShell Prompt
function Prompt {
    $(if (Test-Path variable:/PSDebugContext) {'[DBG]: '} else {'[pwsh]: '}) + 'PS ' + $(Get-Location) + $(if ($NestedPromptLevel -ge 1) {'>>'}) + '> '
}
#endregion

#region Nuget
    $nugetUrl = 'https://nuget.org/nuget.exe'
    $nugetFileName = 'NuGet.exe'

    $nugetProgramData = Join-Path -Path $env:ProgramData -ChildPath 'Microsoft\Windows\PowerShell\PowerShellGet\'
    if (-not (Test-Path -Path $nugetProgramData)) {
        Write-Host -ForegroundColor DarkGray "Nuget: creating directory $nugetProgramData"
        $null = New-Item -Path $nugetProgramData -ItemType Directory -Force -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
    }

    $nugetFullName = Join-Path -Path $nugetProgramData -ChildPath $nugetFileName
    if (-not (Test-Path -Path $nugetProgramData)) {
        Write-Host -ForegroundColor DarkGray "Nuget: downloading to $nugetFullName"
        $null = Invoke-WebRequest -UseBasicParsing -Uri $nugetUrl -OutFile $nugetFullName
    }

    $nugetLocalAppData = Join-Path -Path $env:LOCALAPPDATA -ChildPath 'Microsoft\Windows\PowerShell\PowerShellGet\'
    if (-not (Test-Path -Path $nugetLocalAppData)) {
        Write-Host -ForegroundColor DarkGray "Nuget: creating directory $nugetLocalAppData"
        $null = New-Item -Path $nugetLocalAppData -ItemType Directory -Force -ErrorAction SilentlyContinue -WarningAction SilentlyContinue
    }
    $nugetFullName = Join-Path -Path $nugetLocalAppData -ChildPath $nugetFileName
    if (-not (Test-Path -Path $nugetLocalAppData)) {
        Write-Host -ForegroundColor DarkGray "Nuget: downloading to $nugetFullName"
        $null = Invoke-WebRequest -UseBasicParsing -Uri $nugetUrl -OutFile $nugetFullName
    }
#endregion

#region PackageManagement
    if (-not (Get-Module -Name PowerShellGet -ListAvailable | Where-Object {$_.Version -ge '2.2.5'})) {
        Write-Host -ForegroundColor DarkGray 'Install-Package PackageManagement,PowerShellGet [AllUsers]'
        Install-Package -Name PowerShellGet -MinimumVersion 2.2.5 -Force -Confirm:$false -Source PSGallery | Out-Null

        Write-Host -ForegroundColor DarkGray 'Import-Module PackageManagement,PowerShellGet [Global]'
        Import-Module PackageManagement,PowerShellGet -Force -Scope Global
    }
#endregion

#region PowerShellGet
    $PowerShellGet = 'https://psg-prod-eastus.azureedge.net/packages/powershellget.2.2.5.nupkg'
    $InstalledModule = Import-Module PowerShellGet -PassThru -ErrorAction Ignore
    if (-not (Get-Module -Name PowerShellGet -ListAvailable | Where-Object {$_.Version -ge '2.2.5'})) {
        Invoke-WebRequest -UseBasicParsing -Uri $PowerShellGet -OutFile "$env:TEMP\powershellget.2.2.5.zip"
        $null = New-Item -Path "$env:TEMP\2.2.5" -ItemType Directory -Force
        Expand-Archive -Path "$env:TEMP\powershellget.2.2.5.zip" -DestinationPath "$env:TEMP\2.2.5"
        $null = New-Item -Path "$env:ProgramFiles\WindowsPowerShell\Modules\PowerShellGet" -ItemType Directory -ErrorAction SilentlyContinue
        Move-Item -Path "$env:TEMP\2.2.5" -Destination "$env:ProgramFiles\WindowsPowerShell\Modules\PowerShellGet\2.2.5"
        Import-Module PowerShellGet -Force -Scope Global
    }
#endregion

#region OSD Module
    $InstallModule = $false
    $PSModuleName = 'OSD'
    $InstalledModule = Get-Module -Name $PSModuleName -ListAvailable -ErrorAction Ignore | Sort-Object Version -Descending | Select-Object -First 1
    $GalleryPSModule = Find-Module -Name $PSModuleName -ErrorAction Ignore -WarningAction Ignore

    if ($GalleryPSModule) {
        if (($GalleryPSModule.Version -as [version]) -gt ($InstalledModule.Version -as [version])) {
            Write-Host -ForegroundColor DarkGray "$((Get-Date).ToString('yyyy-MM-dd-HHmmss')) $PSModuleName $($GalleryPSModule.Version) [AllUsers]"
            Install-Module $PSModuleName -Scope AllUsers -Force -SkipPublisherCheck
            Import-Module $PSModuleName -Force
        }
    }
#endregion

#region OSDPad
    $OSDPadParams = @{
        Brand           = "PwshHub"
        RepoOwner       = 'OSDeploy'
        RepoName        = 'pwshhub.live'
        OAuth           = $OAuth
    }
    #Start-OSDPad @OSDPadParams -RepoFolder
#endregion