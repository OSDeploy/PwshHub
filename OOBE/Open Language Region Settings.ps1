function osdcloud-SetWindowsLanguage {
    [CmdletBinding()]
    param ()
    Write-Host -ForegroundColor Yellow 'Verify the Language, Region, and Keyboard are set properly'
    Start-Process 'ms-settings:regionlanguage' | Out-Null
    $ProcessId = (Get-Process -Name 'SystemSettings').Id
    if ($ProcessId) {
        Wait-Process $ProcessId
    }
}
osdcloud-SetWindowsLanguage