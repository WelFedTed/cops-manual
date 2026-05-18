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

# Install Windows on an External Drive
%% REF: https://vonmatterlorenzohorn.medium.com/heres-how-to-do-a-clean-install-of-windows-11-on-an-external-hard-disk-33ab06a9214f %%
Use this method to install Windows directly on to offline drive from another computer running Windows.\
(this could be used for other operating systems too)

> [!info] Note on installing Windows via DISM
> This can also be achieved with DISKPART + DISM, but it's more complicated with more room for error.\
> This method using VM's should be simpler and more reliable.

## Target Drive
- Connect target drive\
  *(could be physical or virtual disk)*
- Ensure target drive is not mounted
## Windows Installer
- Have target Windows installer .iso ready\
  *(download new installer if required*)
## Hyper-V
- Install `Hyper-V` if not installed already\
  *(requires Windows Pro license or greater)*
- Create new VM
	- Use Windows installer .iso as install media
	- Use Physical Hard Disk drive -> target drive
- Boot up VM
	- Install Windows like usual
	- After the installer finishes copying and preparing the installer, you should see the 'Restarting in 10 seconds' screen.\
	  Turn off the VM when you see this.
## Migrate Drive
- Safely unmount/eject your target drive.
- The drive should now be ready to install into another device (or another VM) for use.\
  *(this will be a stock Windows install that may be missing drivers for the target device's hardware, inject drivers as required)*
