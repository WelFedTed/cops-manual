---
title: OS Install
updated: 2025-09-02
tags:
  - procedures
  - windows
  - install
  - operating
  - system
  - os
  - download
  - flash
  - usb
  - installer
---
%% TODO: flesh this out %%
# Download Image

- Download from [massgrave.dev](https://massgrave.dev/genuine-installation-media)

# Verify Image

- Verify checksums against [rg-adguard.net](https://files.rg-adguard.net/)

# Flash Image to USB

- Flash image to USB using [Rufus](https://rufus.ie/en/)\
  `winget install rufus.rufus`

# Inject Drivers

- **Prep**
  - Have a folder with extracted drivers ready to go\
    `C:\drivers\` for this example
  - Create an empty directory ready to mount the Windows image to for editing\
    `C:\mount\` for this example
  - Have a Windows image ready to go\
    `F:\sources\install.wim` for this example

- **Mount**
  - Open Powershell as admin
  - Find index of the Windows image you want to mount\
    `Get-WindowsImage -ImagePath F:\sources\install.wim`
  - Mount the Windows image\
    `Mount-WindowsImage -Path C:\mount\ -ImagePath F:\sources\install.wim -Index 1`

- **Add Drivers**
  - `Add-WindowsDriver -Path C:\mount\ -Driver C:\drivers\ -Recurse -ForceUnsigned`

- **Unmount**
  - `Dismount-WindowsImage -Path C:\mount\ –Save`
