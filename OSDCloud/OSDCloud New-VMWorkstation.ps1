#Requires -Modules @{ ModuleName="vmxtoolkit"; ModuleVersion="4.5.3.1" }
#Requires -PSEdition Core



#Set VMware Workstation Configuration
$vmName = "OSDCloud $(Get-Random)"
$vmIso = Join-Path $(Get-OSDCloudWorkspace) 'OSDCloud_NoPrompt.iso'
$vmMemory = 16364
$vmProcessorCount = 2
$DiskSize = 100GB

new-VMX -VMXName $vmName -Type windows9-64 -Firmware EFI | New-VMXScsiDisk -NewDiskSize $DiskSize -NewDiskname SCSI0_0 | Add-VMXScsiDisk -LUN 0 -Controller 0 `
 | Connect-VMXcdromImage -ISOfile $vmIso | Set-VMXmemory -VMXName OSDClouDemo -MemoryMB $vmMemory | out-null


 Set-VMXNetworkAdapter -VMXName $vmName -Adapter 0 -ConnectionType bridged -AdapterType e1000e   -config "D:\Virtual Machines\$VmName\$VmName.vmx" | out-null

 New-VMXSnapshot -VMXName $vmname -SnapshotName "New-VM" -config "D:\Virtual Machines\$VmName\$VmName.vmx" | out-null

Start-Sleep -Seconds 3

get-VMX -VMXName $vmName | Start-VMX 