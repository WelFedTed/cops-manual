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
### Use a Wired Connection
%% reference: https://support.apple.com/en-au/117383?device-type=iphone %%
Apple Quick Start is typically a wireless transfer method, but Apple does support using a cable too.\
> [!tip] Useful if completing multiple iPhone data transfers next to each other
> A wired connection may not always be faster, as most iPhones only support USB 2.0 transfer speeds, but it could be very useful if you're doing multiple Quick Start ("Bonk") data transfers next to each other, as their Bluetooth connections will slow down if transferring too close to each other
- Make sure both iPhones are charged up\
  *don't use this method if either iPhone has an unreliable battery*
- Restart both iPhones
- Disable Bluetooth on the Source iPhone\
  *this is to ensure the transfer initializes via the cable and not Bluetooth like normal*
- Connect both iPhones together with a good cable *(that supports data)*\
  *via USB-C to USB-C cable*\
  *or USB-C to Lighting cable*\
  *or USB-A to Lightning cable + [Apple Lightning to USB 3 Camera Adapter](https://www.apple.com/shop/product/mx5j3am/a/lightning-to-usb-3-camera-adapter)*
- Complete the on-screen prompts on the Target iPhone until you reach the Quick Start setup page\
  *this iPhone should now be looking for nearby iPhones to transfer from*
- Lock the Source iPhone and wake up the screen without unlocking\
  *you should now see a Quick Start setup notification on the Source iPhone's screen*
- Tap the Quick Start setup notification on the Source iPhone and proceed like normal
> [!warning] USB-C Reverse Charging
> One iPhone may start charging from the other iPhone when connected.
> If the battery running out during the transfer is a concern, you may want to use a wireless charger on the iPhone that's being drained.
> 
> *i.e. USB-C to Lighting cable*
> *The Lightning iPhone will charge from the USB-C iPhone, so put the USB-C iPhone on a wireless charging pad to try and mitigate the extra battery drain*

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
> iOS device backups require encryption to be enabled to backup 'sensitive data'.\
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