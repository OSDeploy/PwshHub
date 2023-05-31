#Install-Module -Name NuGet -Force
#Need to install ADK, MDT, DaRT

New-OSDCloudTemplate
New-OSDCloudWorkspace -WorkspacePath C:\OSDCloud
Edit-OSDCloudWinPE -CloudDriver * -UseDefaultWallpaper