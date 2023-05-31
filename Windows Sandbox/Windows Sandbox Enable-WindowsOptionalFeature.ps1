#https://learn.microsoft.com/en-us/windows/security/threat-protection/windows-sandbox/windows-sandbox-overview

#Windows 10
#dism /online /Enable-Feature /FeatureName:"Containers-DisposableClientVM" -All

#Windows 11
Enable-WindowsOptionalFeature -FeatureName "Containers-DisposableClientVM" -All -Online -NoRestart -Verbose

#If you're using a virtual machine, run the following PowerShell command to enable nested virtualization:
#Set-VMProcessor -VMName <VMName> -ExposeVirtualizationExtensions $true