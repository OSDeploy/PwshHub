#===================================================================================================
#   Scripts/Initialize-OSDisk.ps1
#   Don't allow USB Drives at this time so there is no worry about Drive Letters
#===================================================================================================
Write-Host -ForegroundColor DarkCyan    "================================================================="
Write-Host -ForegroundColor White       "$((Get-Date).ToString('yyyy-MM-dd-HHmmss')) " -NoNewline
Write-Host -ForegroundColor Green       "Scripts/Initialize-OSDisk.ps1"

$RemoveUSBDrive = $true
if ($RemoveUSBDrive) {
    if (Get-USBDisk) {
        do {
            Write-Warning "Remove all attached USB Drives until Initialize-OSDisk has completed"
            $RemoveUSB = $true
            pause
        }
        while (Get-USBDisk)
    }
}

Clear-LocalDisk -Force
New-OSDisk -Force
Start-Sleep -Seconds 3
if (-NOT (Get-PSDrive -Name 'C')) {
    Write-Warning "Disk does not seem to be ready.  Can't continue"
    Break
}