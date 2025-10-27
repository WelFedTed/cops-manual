---
title: Data Transfer
updated:
tags:
  - "#procedures"
  - "#ios"
  - "#data-transfer"
  - "#backup"
  - "#restore"
  - "#apple"
  - "#iphone"
  - "#ipad"
---
# Native Options

## Apple Quick Start ( "Bonk" )
%% reference: https://support.apple.com/en-au/HT210216 %%
Wireless device to device transfer during OOBE.

*We refer to this transfer method as a "Bonk" as you 'bonk' the phones together to complete the transfer.*

## Apple Software

Use any current Apple device management software to first backup the source device and then restore the backup to the target device.
- macOS
	- Apple Configurator 2
	- Finder
- Windows
	- Apple Devices
	- iTunes *( deprecated )*
> [!info] iOS Backup Encryption
> %% refernce: https://support.apple.com/en-au/108353 %%
> iOS device backups require encryption to be enabled to backup 'sensitive data'.
> Sensitive data includes:
> - Saved Passwords
> - Wi-Fi Settings
> - Website History
> - Health Data
> - Call History
>   
> *( Encrypted backups don't include Face ID, Touch ID or device passcode data )*
> 
> Be sure to use encryption to transfer as much user data as possible, and use a simple generic password for the backup *(e.g. `COPS`)*.

> [!tip]- How To Reset iOS Backup Encryption Password
> %% https://support.apple.com/en-au/108313 %%
> If the iOS device has used a password for encrypted backups before you will be prompted for this password when trying to create new encrypted backups.
> 
> If you don't have this password, you can reset the iOS backup encryption password by 'Resetting All Settings' on devices with iOS 11 or later:\
> *( note: this will not change the password for existing encrypted backups, but it will let you set a new password for new encrypted backups )*
> 1. On the device, open `Settings`
> 2. Tap `General`
> 3. Tap `Transfer or Reset [Device]` *( will say 'iPhone' or 'iPad' as per the device )*
> 4. Tap `Reset`
> 5. Tap `Reset All Settings`\
>    Enter the passcode when prompted
> 6. Tap `Reset All Settings`
> 7. Follow the steps to reset the settings.\
>    *This won't affect the user data or passwords, but it will reset settings such as display brightness, Home Screen layout and wallpaper. It also removes the encrypted backup password.*

# 3rd Party Options

## iMazing

### Device to Device Transfer

- Open `iMazing`
- Connect both devices to the PC
- Select the source device from the device list
- Select `Transfer`
- Select the target device

### Backup and Restore

- Open iMazing
- Backup
	- Connect the source device to the PC
	- Select the source device from the device list
	- Select `Backup`
	- Ensure the backup has encryption turned on\
	  *( reset the device's backup encryption password if required )*
	- Disconnect source device when backup is complete
- Restore
	- Connect the target device to the PC
	- Select the target device from the device list
	- Select `Restore`
	- Select the desired backup of the source device
	- Enable `Erase Device` as if required\
	  *( this will first erase / factory reset the target device before restoring from the backup )*