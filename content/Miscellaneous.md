---
title: Miscellaneous
updated: 2025-09-07
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

## How to Reset Hibernation File (hiberfil.sys) (Windows)

%% Reference: https://learn.microsoft.com/en-us/troubleshoot/windows-client/setup-upgrade-and-drivers/disable-and-re-enable-hibernation %%

Windows uses the hiberfil.sys file to store a copy of the system memory on the hard disk when the hybrid sleep setting is turned on. If this file is not present, the computer cannot hibernate.
> [!info]- More Info
> The hiberfil.sys hidden system file is located in the root folder of the drive where the operating system is installed. The Windows Kernel Power Manager reserves this file when you install Windows. The size of this file is approximately equal to how much random access memory (RAM) is installed on the computer.
### Disable Hibernation

`powercfg -h off`\
or\
`powercfg.exe /hibernate off`

### Re-Enable Hibernation

`powercfg -h on`\
or\
`powercfg.exe /hibernate on`

## How to Install / Repair Winget

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

