---
title: CLI Cheat Sheet
updated:
tags:
  - "#references"
  - "#cheat"
  - "#sheet"
  - "#cli"
  - "#commands"
---
# DISM
Deployment Image Servicing and Management
## Repairs
### Scan Windows For Corruption
```powershell
DISM /Online /Cleanup-Image /ScanHealth
```
### Check If Windows Corruption Is Detected
```powershell
DISM /Online /Cleanup-Image /CheckHealth
```
### Repair Windows
```powershell
DISM /Online /Cleanup-Image /RestoreHealth
```
### Repair Windows With Offline Source
```powershell
DISM /Online /Cleanup-Image /RestoreHealth /Source:F:\sources\install.wim
```
### Repair Windows With Offline Source and Exclude Windows Update
```powershell
DISM /Online /Cleanup-Image /RestoreHealth /Source:F:\sources\install.wim /LimitAccess
```
## Component Store
### Analyse
```powershell
DISM /Online /Cleanup-Image /AnalyzeComponentStore
```
### Cleanup
```powershell
DISM /Online /Cleanup-Image /StartComponentCleanup /ResetBase
```
## Windows Images
### Image Info
```powershell
DISM /Get-ImageInfo /ImageFile:F:\sources\install.wim
DISM /Get-ImageInfo /ImageFile:F:\sources\install.wim /Index:1

or

Get-WindowsImage -ImagePath F:\sources\install.wim
Get-WindowsImage -ImagePath F:\sources\install.wim /Index:1
```
### Add Drivers
#### Online
```powershell
cd c:\drivers\
pnputil /add-driver *.inf /subdirs /install
```
#### Offline
```powershell
DISM /Image:C:\mount\ /Add-Driver /Driver:c:\drivers\ /Recurse /ForceUnsigned

or

Add-WindowsDriver -Path C:\mount\ -Driver C:\drivers\ -Recurse -ForceUnsigned
```
### Export Drivers
#### Online
```powershell
DISM /Online /Export-Driver /Destination:D:\drivers\

or

Export-WindowsDriver -Online -Destination D:\drivers\
```
#### Offline
```powershell
DISM /Image:C:\mount\ /Export-Driver /Destination:D:\drivers\

or

Export-WindowsDriver -Path C:\mount\ -Destination D:\drivers
```
### Mount Image
```powershell
DISM /Mount-Image /MountDir:C:\mount\ /ImageFile:F:\sources\install.wim /Index:1

or 

Mount-WindowsImage -Path C:\mount\ -ImagePath F:\sources\install.wim -Index 1
```
### Unmount Image
```powershell
DISM /Unmount-Image /MountDir:C:\mount\ /Commit
DISM /Unmount-Image /MountDir:C:\mount\ /Discard

or

Dismount-WindowsImage -Path C:\mount\ –Save
Dismount-WindowsImage -Path C:\mount\ –Discard
```

# GPUpdate
Group Policy Update
## Force Update Group Policy
```batch
GPUpdate /Force
```

# IPConfig
IP Configuration
## Show IP Configuration
```batch
ipconfig /All
```
## Flush DNS
```batch
ipconfig /FlushDNS
```
## Release Current IP Address
```batch
ipconfig /Release
```
## Request New IP Address
```batch
ipconfig /Renew  
```

# Ping
```batch
ping 8.8.8.8
ping google.com
ping google.com -t
```

# PnPUtil
## Add Drivers To Online Windows
```batch
pnputil /Add-Driver D:\drivers\*.inf /SubDirs /Install
```
# SFC
System File Checker
## Scan Online Windows
```batch
sfc /scannow
```
## Scan Offline Windows
```batch
sfc /scannow /offbootdir:D:\ /offwindir:D:\Windows
```

# Winget
Windows Package Manager
## Update Repository
```batch
winget source update
```
## Upgrade Installed Packages
```batch
winget upgrade --all --silent
```
## Search For App
```batch
winget search chrome
```
## Show Info For App
```batch
winget show google.chrome
```
## Install App
```batch
winget install google.chrome
```
## List Installed Apps
```batch
winget list
```
### Filter Installed Apps List
```batch
winget list -q chrome
```