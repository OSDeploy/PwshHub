winget show --id Microsoft.WindowsADK --versions
winget install --id=Microsoft.WindowsADK --version 10.1.22000.1 --exact

winget show --id Microsoft.ADKPEAddon --versions
winget install --id=Microsoft.ADKPEAddon --version 10.1.22000.1 --exact

New-Item -Path 'C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\x86\WinPE_OCs' -ItemType Directory -Force