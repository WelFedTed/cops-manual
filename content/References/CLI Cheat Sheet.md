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
## Maintenance
```powershell
dism /online /cleanup-image /startcomponentcleanup /resetbase
dism /online /cleanup-image /restorehealth
```

# Ping
```batch
ping 8.8.8.8
ping google.com
ping google.com -t
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