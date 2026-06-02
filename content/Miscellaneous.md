---
title: Miscellaneous
updated:
tags:
  - miscellaneous
---
%% TODO: verify steps and incorporate these entries into main doc %%
## How to Hard Refresh Web Browsers

%% Reference: https://help.gavel.io/articles/how-to-do-a-hard-refresh-in-any-browser %%

>[!info]- What is a Hard Refresh?
>A hard refresh clears your browser cache for a specific page, which forces it to load the most recent version of that page. This could include new scripts, styles or features.
>>[!important] Important: Clicking the "Refresh" button on your browser address bar is not a hard refresh, and will simply reload the already cached version of the page.

- Google Chrome\
  Windows: `Ctrl and then press F5`\
  macOS: `Cmd + Shift + R`
- Firefox\
  Windows: `Ctrl + F5`\
  macOS: `Cmd + Shift + R`
- Safari (Mac)\
  Empty Cache: Go to Safari > Empty Cache, or hit `Opt + Cmd + E`\
  Refresh: Click the refresh button on the address bar or press `Cmd + R`
- Internet Explorer/Microsoft Edge (Windows)\
  `Ctrl + F5`

## How to Manually Clear the Print Queue (Windows)

%% TODO: also make this a script on USB tool 'Clear-Print-Queue.bat' %%

- Open a terminal as Administrator
- Run the following commands:
  ```batch
	net stop spooler
	del %SYSTEMROOT%\System32\spool\PRINTERS\* /Q
	net start spooler
	```

## How to Generate Battery Report (Windows)

- Open a terminal as Administrator
- Export Battery Report\
  `powercfg /batteryreport /output c:\batt.html`
- Open Battery Report\
  `start c:\batt.html`

## How to Reset Page File (pagefile.sys) (Windows)

%% Reference: https://www.thewindowsclub.com/how-to-reset-virtual-memory-or-page-file-in-windows %%

>[!info]-What is a Page File?
> A page file (also known as a "paging file") is an optional, hidden system file on a hard disk.
> Page files enable the system to remove infrequently accessed modified data from physical memory to let the system use physical memory more efficiently for more frequently accessed data.\
> Page files extend how much `Committed Memory` (also known as "virtual memory") is used to store modified data.
> > [!tip] How to check Committed Memory
> > - Open `Task Manager`
> > - Click `Performance`
> > - Click `Memory`
> > - Read the `Commited` value\
> >   <em>This comitted memory value should represent Total Physical Memory + Page File size</em>
### Method 1: Registry

- Run `regedit` as Administrator (Shift + Enter)
- Navigate to `HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management`
- Open `ClearPageFileAtShutdown` (Double-Click)
  - Change `Value data` to `1`
  - Click `OK`
- Close `Registry Editor`
- Restart Windows\
  `shutdown /r /f /t 00`

### Method 2: Group Policy

- Run `gpedit.msc` as Administrator (Shift + Enter)
- Navigate to `Local Computer Policy > Computer Configuration > Windows Settings > Security Settings > Local Policies > Security Options`
- Open `Shutdown: Clear virtual memory pagefile` (Double-Click)
  - Select `Enabled`
  - Click `OK`
- Close `Local Group Policy Editor`
- Run a terminal as Administrator\
  `wt` or `powershell` or `cmd`
- Run the following command:\
  `gpupdate /force`
- Restart Windows\
  `shutdown /r /f /t 00`

### Method 3: Manual

#### Disable Page File

- Open `System Properties`\
  `sysdm.cpl`
- Click `Advanced` tab
- `Performance`
  - Click `Settings...` button
  - Click `Advanced` tab
  - `Virtual Memory`
    - Click `Change...` button
    - Take not of the current settings (we'll need to re-apply these later)
    - Uncheck `Automatically manage paging file size for all drives`
    - Select `C:` drive
    - Select `No paging file`
    - Click `Set`
    - Click `Yes`
    - Click `OK`
- Restart Windows\
  `shutdown /r /f /t 00`

#### Re-Enable Page File

- Open `System Properties`\
  `sysdm.cpl`
- Click `Advanced` tab
- `Performance`
  - Click `Settings...` button
  - Click `Advanced` tab
  - `Virtual Memory`
    - Click `Change...` button
    - Re-Apply Settings as they were before disabling
    - Click `OK`
- Restart Windows\
  `shutdown /r /f /t 00`

# How to Reset Hibernation File (hiberfil.sys) (Windows)

%% Reference: https://learn.microsoft.com/en-us/troubleshoot/windows-client/setup-upgrade-and-drivers/disable-and-re-enable-hibernation %%

Windows uses the hiberfil.sys file to store a copy of the system memory on the hard disk when the hybrid sleep setting is turned on. If this file is not present, the computer cannot hibernate.
> [!info]- More Info
> The hiberfil.sys hidden system file is located in the root folder of the drive where the operating system is installed. The Windows Kernel Power Manager reserves this file when you install Windows. The size of this file is approximately equal to how much random access memory (RAM) is installed on the computer.
## Disable Hibernation

`powercfg -h off`\
or\
`powercfg.exe /hibernate off`

## Re-Enable Hibernation

`powercfg -h on`\
or\
`powercfg.exe /hibernate on`

# How to Install / Repair Winget

%% Reference: https://github.com/asheroto/winget-install  %%

- Connect to the internet
- Open a terminal as Administrator
- Run `irm asheroto.com/winget | iex`
- Wait for script to complete
- Close + Re-open the terminal\
  _winget should now be working again_
- Run `winget -v` to test

# Script: Network Status Logger

Use this script to log network / internet connection status over time.\
*(i.e. customer reports Wi-Fi dropping out occasionally)*

```batch
rem save with filename net-check.bat

@echo off

title Network Status Logger

set "log_file=net-check.log"
set "line=--------------------------------------------------"

:loop

echo %DATE% %TIME% >> %log_file%
echo %line% >> %log_file%
echo: >> %log_file%

echo Pinging google.com...
echo:
ping google.com >> %log_file%
echo: >> %log_file%

timeout 30
echo:

goto :loop
```

# How to check Wi-Fi signal strength
> [!info]- What is RSSI
> RSSI stands for Received Signal Strength Indicator and measures how well a client device can hear (receive) a signal.
> The greater the RSSI value, the stronger the signal.
> Therefore, when an RSSI value is represented in a negative form (e.g. −100), the closer the value is to 0, the stronger the received signal is.
> RSSI values are similar to taking a dBm (decibel milliwatt) reading, but RSSI values are not actually in decibels.
> 
> There is no standardization or RSSI values, so wireless adapters from different manufacturers could be using different RSSI scales.
> But as a rough guide refer to the following:
> - Excellent signal (> -70)
> - Good signal (-70 to -85)
> - Fair signal (-86 to -100)
> - Poor signal (< -100)
## Windows
- Open a terminal\
  `wt` or `powershell` or `cmd`
- Run this command:\
  `netsh wlan show interfaces`
- Check the reported `RSSI` value of the current wireless connection
## macOS
- Open `Wireless Diagnostics`\
  Press and hold the `Option` key, click the `Wi-Fi` status menu in the menu bar, then choose `Open Wireless Diagnostics`.
- Click on `Window` in the Title Bar
- Click `Scan` from the drop down menu.\
  *You'll see a list of all of the **Wireless Access Points** in your area*
- Click `Scan Now`
- Check the reported `RSSI` value of the target wireless network
## Tools
 Use MetaGeek's tools\
 https://www.metageek.com/downloads/
### MetaGeek inSSIDer
- Scan nearby networks
- Check the `Signal` value reported in dBm
> [!info]- What is dBm
> dBm stands for Decibel (milliwatts) and measures the strength of a signal.\
> While RSSI is a relative measurement that changes between chip manufacturers,\
> dBm is an absolute measurement (this is strongly preferred).
> 
> dBm is a logarithmic scale (usually -30 to -100), and thus the following is true:
> - 3 dB of loss = -3 dB = halves signal strength
> - 3 dB of gain = +3 dB = doubles signal strength
> - 10 dB of loss = -10 dB = 10 times less signal strength
> - 10 dB of gain = +10 dB = 10 times more signal strength
>
>General signal strength guide:
>- Excellent signal (-30 dBm) *this is the maximum strength signal*
>- Strong signal (-67 dBm)
>- Good signal (-70 dBm)
>- Poor signal (-80 dBm) *connection may be unstable*
>- Bad signal (-90 dBm) *basically unusable*

# How to check Windows Version / Edition
## Online
- Run `winver`
## Offline
### ntdll.dll
- Open `Explorer`
- Navigate to `:\Windows\System32`
- Open `Properties` of `ntdll.dll`
- Click `Details` tab
- Check `File version`\
  *this version number should represent the installed Windows Build Number, use Google to help identify the build number if you're unsure which version it is*
### Registry
- Open `Registry Editor`\
  `regedit`
- Expand `Computer`
	- Select `HKEY_LOCAL_MACHINE`
- Click `File`
	- Click `Load Hive...`
	- Open the `SOFTWARE` registry hive of the target offline Windows installation
	- Enter `OFFLINE_SOFTWARE` as Key Name
	- Click `OK`
- Navigate to `HKEY_LOCAL_MACHINE\OFFLINE_SOFTWARE\Microsoft\Windows NT\CurrentVersion`
	- Check the following registry entries:\
	  `CurrentBuild`\
	  `EditionID`\
	  `ProductName`

# Windows 10 ESU (Extended Security Updates)
## Check Enrolled Status
- Run
```powershell
  slmgr.vbs /dli
```
- Check for the following:\
  `Windows(R), Client-ESU-Year1 add-on`\
  `Windows(R), Client-ESU-Year2 add-on`\
  `Windows(R), Client-ESU-Year3 add-on`\
  `Windows(R), Client-ESU-Year6 add-on`
## Enrol
### Official
- Open `Windows Update`\
  `control update`
- Click `Enroll Now`
	- Follow the prompts to enrol *(may require a Microsoft Account)*
### Unofficial
- Open a terminal as Administrator\
  `wt` or `powershell` or `cmd`
- Run [MAS (Microsoft Activation Scripts)](https://massgrave.dev/)
```powershell
  irm https://get.activated.win | iex
```
- Press `3` for `TSForge`
- Press `2` for `Activate - ESU`

# How to Mount Drives using Diskpart (Windows)
Occassionally Windows won't automatically mount (or assign a drive letter) to drives you connect, and if your drive is Read-Only then you won't be able to assign a drive letter using Disk Management.\
When this happens, use Diskpart to mount the drive / volume instead.
- Open a terminal as Administrator\
  `wt` or `powershell` or `cmd`
- Run `diskpart`\
  *This will open the Diskpart CLI program*
  - List all volumes\
    `list vol`
  - Select target volume\
    `select vol X`\
    *( X = the listed number for the target volume )*
  - Mount selected volume\
    `assign letter=Z`\
    *( Z = desired drive letter )*

# Secure Boot Recovery Utility
If you encounter a `Secure Boot Fail` error, you could try making a Secure Boot Recovery Utility.\
\
To recover the system:\
On a second Windows PC with the July 2024 or newer Windows update installed, copy SecureBootRecovery.efi from C:\Windows\Boot\EFI\.\
\
Place the file on a FAT32-formatted USB drive under \EFI\BOOT\ and rename it to bootx64.efi.\
\
Boot the affected device from the USB drive and allow the recovery utility to run.\ The utility will add the Windows UEFI CA 2023 to the DB.\
\
There is a PowerShell command that can verify whether you have the 2023 certificates or not.

# Check if BIOS or UEFI from Windows
- Open `System Information`\
  Run: `msinfo32`
	- Select `System Summary` in left window pane
	  - Check `BIOS Mode` in right window pane\
	    Legacy = BIOS\
	    UEFI = UEFI