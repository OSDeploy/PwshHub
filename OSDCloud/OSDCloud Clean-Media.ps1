$KeepTheseDirs = @('boot','efi','en-us','osdcloud','sources','fonts','resources')

Get-ChildItem "$(Get-OSDCloudWorkspace)\Media" | `
Where-Object {$_.PSIsContainer} | `
Where-Object {$_.Name -notin $KeepTheseDirs} | `
Remove-Item -Recurse -Force

Get-ChildItem "$(Get-OSDCloudWorkspace)\Media\Boot" | `
Where-Object {$_.PSIsContainer} | `
Where-Object {$_.Name -notin $KeepTheseDirs} | `
Remove-Item -Recurse -Force

Get-ChildItem "$(Get-OSDCloudWorkspace)\Media\EFI\Microsoft\Boot" | `
Where-Object {$_.PSIsContainer} | `
Where-Object {$_.Name -notin $KeepTheseDirs} | `
Remove-Item -Recurse -Force

New-OSDCloudISO