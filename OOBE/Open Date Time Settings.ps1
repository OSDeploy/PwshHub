function osdcloud-SetWindowsDateTime {
    [CmdletBinding()]
    param ()
    Write-Host -ForegroundColor Yellow 'Verify the Date and Time is set properly including the Time Zone'
    Write-Host -ForegroundColor Yellow 'If this is not configured properly, Certificates and Domain Join may fail'
    Start-Process 'ms-settings:dateandtime' | Out-Null
    $ProcessId = (Get-Process -Name 'SystemSettings').Id
    if ($ProcessId) {
        Wait-Process $ProcessId
    }
}
osdcloud-SetWindowsDateTime