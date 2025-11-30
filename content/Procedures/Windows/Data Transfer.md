---
title: Data Transfer
updated:
tags:
  - procedures
  - windows
  - data
  - transfer
  - backup
  - restore
---
# Backup

## Windows

  - [ <font style="color:ORANGE">OPTIONAL</font> ] Restart Windows\
    _Force Restart Windows now to provide a clean environment before proceeding_
  - [ <font style="color:ORANGE">OPTIONAL</font> ] Create a new System Restore point\
    `COPS - Pre Data Transfer`

## Transfer Drive

- Create a Job folder on the Transfer Drive\
  _naming convention:_\
  `Job#5000`
- [ <font style="color:ORANGE">OPTIONAL</font> ] Create a .txt file with the customer's name for quick identification when browsing job folders\
  *naming convention:*\
  `John Smith.txt`
- Create a dated `Data Transfer folder` inside of the Job folder\
  *naming convention:*\
  `Data-Transfer_2025-01-21`\
  This is the folder where all exported user data will be saved for the data transfer\
  *( append the date to this folder name, so we don't need to date each file individually, but should you add/edit export files inside this folder at a later date then append the date to those filenames )*
> [!example] Example: Starting Export File Structure
> The starting file/folder structure should look similar to this example:
> ```
> /
> ├─ Job#5000/
> │  ├─ John Smith.txt
> │  ├─ Data-Transfer_2025-01-21/
> │  │  ├─ User Data Goes Here
> ```

> [!tip]- Note on filenames
> Many software tools (particularly CLI tools) don't interperet `spaces` in filenames correctly and this can cause issues when saving or loading files.\
> For this reason, it is recommended to save files without `spaces` or 'white space' in file and folder names, and to instead use hyphens and/or underscores.\
> e.g. using `web-browser_google-chrome_passwords.csv`\
> instead of `Web Browser - Google Chrome - Passwords.csv`\
> (and using all lowercase characters is just easier/quicker to type)\
> \
> If you do have `spaces` or other 'white space' in your filenames, then you will need to wrap the filenames in quotes when using CLI tools.\
> i.e. `winget export -o "My Winget Export.json"`\
> vs. `winget export -o my-winget-export.json`

## User Profiles

### RClone
Use `rclone` to copy user data if available, as it is multi-threaded (faster) and verifies copied files
- Open a terminal as Administrator\
  `wt` or `powershell` or `cmd`
- Check if `rclone` is installed\
  `rclone -V`\
  *( this will show an error if not installed )*
- If `rclone` not installed:
	- Install `rclone`\
	  `winget install rclone.rclone`
	- Close and re-open the terminal\
	  *( this will refresh the environment path/variables to make rclone available )*
- Change in to Data Transfer folder\
  `cd d:\Job#5000\Data-Transfer_2025-01-21\`
- Copy `C:\Users` to `Data Transfer folder`\
  `rclone copy c:\users users --progress`
### Windows Explorer
If `rclone` is unavailable, simply use Windows Explorer, just know it is single-threaded (slower) and does <u>not</u> verify copied files
- Copy `C:\Users` to `Data Transfer folder` using `Windows Explorer`

## Security
*naming convention:*\
`security.txt`\
`security_nirsoft-securitysoftview.html`

Create a new text document for noting their security software details
- Add the name of the security software
- Add if the software is PAID or FREE
- Add the serial number / license key used to activate the software *( if available )*
- Add the add the username/email of the account signed in to the software *( if available )*
- Disable the Security's Real-Time Protection\
  *Some of our extraction tools prompt false positives in the majority of security software*
> [!example] Example: security.txt
> ```
> Trend Micro Internet Security
> 
> PAID
> 
> PVMD-0123-1234-2345-3456
> 
> john.smith@example.com
> example-password
> ```
### Tools
- Open `Nirsoft SecuritySoftView` as Administrator
	- Select all\
	  `ctrl+a`
	- Save as `Horizontal HTML` in `Data Transfer folder`\
	  `ctrl+s`


## Web Browsers
Complete the following exports for each installed web browser
### Bookmarks
*naming convention:*\
`web-browser_google-chrome_bookmarks.html`
- Google Chrome URL: `chrome://bookmarks`
- Microsoft Edge URL: `edge://favorites`
- AVG Secure Browser URL: `secure://bookmarks`
- Mozilla Firefox Hotkey: `Ctrl+Shift+O`
- Microsoft Internet Explorer: `%USERPROFILE%\Favorites`
### Passwords
_naming convention:_\
`web-browser_google-chrome_passwords.csv`
- Google Chrome URL\
  `chrome://password-manager` or `chrome://settings/passwords` ( older Chrome versions )
- Microsoft Edge URL\
  `edge://wallet/passwords` or `edge://settings/passwords` ( older Edge versions )
- AVG Secure Browser URL\
  `secure://password-manager` or `secure://settings/passwords` ( older Secure Browser versions )
- Mozilla Firefox URL\
  `about:logins`\
  *( Firefox may require multiple updates before the Export Passwords button is available )*
- Microsoft Internet Explorer: use [Nirsoft IE PassView](https://www.nirsoft.net/utils/internet_explorer_password.html)
### Sync
*naming convention:*\
`web-browser_google-chrome_sync.txt`

Sync each browser with their relevant accounts ( if available )\
*Manual exports of Bookmarks + Passwords are good, but syncing the entire browser is better, try to do both*
- Google Chrome: `Google Account`
	- `chrome://sync-internals`
	- Check Enabled: `Sync Feature Enabled` = true
	- Check Account: `Username`
	- Checked Synced: `Last Synced` = Just now
	- Check Not Actively Syncing: `Sync Cycle Ongoing` = false
	- Force Sync (if required): `chrome://extensions` - enable `Developer mode` - click `Update`
- Microsoft Edge: `Microsoft Account`
	- `edge://sync-internals`
	- Check Enabled: `Sync Feature Enabled` = true
	- Check Account: `Username`
	- Checked Synced: `Last Synced` = Just now
	- Check Not Actively Syncing: `Sync Cycle Ongoing` = false
	- Force Sync (if required): `edge://extensions` - enable `Developer mode` - click `Update`
- Mozilla Firefox: `Mozilla Account`
  %% TODO %%
> [!example] Example: web-browser_google-chrome_sync.txt (ENABLED)
> ```
> ENABLED
> 
> john.smith@example.com
> 
> sync up to date
> ```

> [!example] Example: web-browser_google-chrome_sync.txt (DISABLED)
> ```
> DISABLED
> 
> no account signed in
> ```

### Extensions
  *naming convention:*\
  `web-browser_google-chrome_extensions.txt`

Save list of ENABLED and DISABLED web browser extensions.
- Google Chrome\
  `chrome:\\extensions`
- Microsoft Edge\
  `edge:\\extensions`
- Mozilla Firefox
  %% TODO %%
> [!example] Example: web-browser_google-chrome_extensions.txt
> ```
> ENABLED
> 
> Adobe Acrobat Reader
> Bitwarden Password Manager
> uBlock Origin
> 
> DISABLED
> Google Docs Offline
> ```
## Programs
_naming convention:_\
`installed-programs_nirsoft-uninstallview.html`\
`winget.json`\
`winget_unavailable.txt`
### Winget
- Open a Terminal as Administrator\
  Run `wt` or `powershell` or `cmd`
- Change in to Data Transfer folder\
  `cd d:\Job#5000\Data-Transfer_2025-01-21\`
- Check Winget is installed\
  `winget -v` (this will throw an error if winget is unavailable)
- Update Winget `winget source update`
- Export Winget's list of installed programs\
  `winget export -o winget.json`
- Export a list of all programs that the Winget export will not re-install\
  `winget export -o winget.json > winget_unavailable.txt`
### Tools
- Open `Nirsoft InstalledAppView` as Administrator
	- Select all\
	  `ctrl+a`
	- Save as `Horizontal HTML` to `Data Transfer folder`\
	  `ctrl+s`
- Open `Nirsoft InstalledPackagesView` as Administrator
	- Select all\
	  `ctrl+a`
	- Save as `Horizontal HTML` to `Data Transfer folder`\
	  `ctrl+s`
- Open `Nirsoft UninstallView` as Administrator
	- Select all\
	  `ctrl+a`
	- Save as `Horizontal HTML` to `Data Transfer folder`\
	  `ctrl+s`

## Licenses
  _naming convention:_\
  `license-keys_nirsoft-product-key-scanner.html`
- Open `Nirsoft Product Key Scanner` as Administrator
	- Select `Scan your current running system`
	- Tick `Search product key with WMI`
	- Tick `Search product key in BIOS`
	- Click `OK`
	- Select all\
	  `ctrl+a`
	- Save as `Horizontal HTML` to `Data Transfer folder`\
	  `ctrl+s`
- Open `Nirsoft ProduKey` as Administrator
	- Select all\
	  `ctrl+a`
	- Save as `Horizontal HTML` to `Data Transfer folder`\
	  `ctrl+s`

## Mail Clients

*naming convention:*\
`mail-clients_nirsoft-mail-passview.html`\
`outlook_export_john.smith@example.com.pst`\
`outlook-classic.txt`\
`outlook_profile.reg`

### Outlook (Classic)
- Create `outlook-classic.txt` in `Data Transfer folder`
- Open `Control Panel`\
  `control`
- Click `Mail`
- Note all email addresses in `outlook-classic.txt`
- Note all data files in `outlook-classic.txt`
> [!example] Example outlook-classic.txt
> ```
> EMAILS
> 
> john.smith@example.com
> 
> 
> DATA FILES
> 
> john.smith@example.com.pst
> C:\Users\jsmith\AppData\Local\Microsoft\Outlook\john.smith@example.com.pst
> 
> Archive
> C:\Users\jsmith\AppData\Local\Microsoft\Outlook\archive.pst
> ```
#### Outlook Profile
%% REFERENCE: https://design2web.ca/blog/how-to-backup-restore-your-outlook-profile/ %%
Export the appropriate Registry keys for the installed Outlook (classic) version as `outlook_profile.reg`

- Open `regedit` as Administrator\
  `regedit`
- Navigate to the appropriate registry location (as per table below)
- Right Click on the `Outlook` key/folder
- Click `Export`

| Office Version | Outlook Profile Registry Location                                                                           |
| :------------- | :---------------------------------------------------------------------------------------------------------- |
| 2007 / 2010    | HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Windows Messaging Subsystem\Profiles\Outlook |
| 2013           | HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Outlook                                                    |
| 2016+          | HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook                                                    |
#### Exports
- [How to export emails to file in Outlook](https://support.microsoft.com/en-au/office/back-up-your-email-e5845b0b-1aeb-424f-924c-aa1c33b18833)
- [How to export Contacts in Outlook (classic)](https://support.microsoft.com/en-au/office/import-or-export-contacts-in-outlook-using-a-csv-file-bb796340-b58a-46c1-90c7-b549b8f3c5f8#picktab=classic_outlook)
### Outlook (new)
- Create `outlook-new.txt` file in `Data Transfer folder`
- Open Outlook (new)
- Note all email addresses and their connection type in `outlook-new.txt`
> [!example] Example outlook-new.txt
> ```
> john.smith@example.com (IMAP)
> john.smith@hotmail.com (outlook.com)
> john.smith@bigpond.com (POP)
> ```
#### Exports
- [How to export Contacts in Outlook (new)](https://support.microsoft.com/en-au/office/import-or-export-contacts-in-outlook-using-a-csv-file-bb796340-b58a-46c1-90c7-b549b8f3c5f8#picktab=new_outlook)
### Windows Mail
[How to export Contacts in Windows Mail (People App)](https://support.microsoft.com/en-au/office/export-emails-and-contacts-from-windows-mail-or-people-and-import-to-new-outlook-7ced6135-3d1d-409b-b2da-4282a69c151b)

### Windows Live Mail
[How to export Contacts in Windows Live Mail](https://oryon.net/knowledge-base/article/how-do-i-export-email-addresses-from-windows-live-mail/)

### Mozilla Thunderbird
Profile Location: `%APPDATA%\Roaming\Thunderbird`\
[How to migrate Thunderbird profile to another PC](https://support.mozilla.org/en-US/kb/moving-thunderbird-data-to-a-new-computer)

### eM Client
[How to migrate eM Client profile to another PC](https://forum.emclient.com/t/transfer-em-from-one-pc-to-another/58064/9)

### Tools
- Open `Nirsoft Mail PassView` as Administrator
	- Select all\
	  `ctrl+a`
	- Save as `Horizontal HTML` to `Data Transfer folder`\
	  `ctrl+s`
- Open `Nirsoft PstPassword` as Administrator
	- Select all\
	  `ctrl+a`
	- Save as `Horizontal HTML` to `Data Transfer folder`\
	  `ctrl+s`
- Open `Nirsoft WinMailPassRec` as Administrator
	- Select `Current user on this system`
	- Click `OK`
	- Select all\
	  `ctrl+a`
	- Save as `Horizontal HTML` to `Data Transfer folder`\
	  `ctrl+s`

## Printers
  *naming convention:*\
  `printers.txt`
- Open `Printers and Scanners`\
  `control printers`
- Note each installed printer model and port in `printers.txt`\
  *( also note which printer is set as the default if available )*
> [!example] Example: printers.txt
> ```
> Canon TR8660a (USB) [DEFAULT]
> Epson WF-2530 (WSD)
> Brother MFC-L3755CDW (IP)
> ```
### Installers
- Create a `printers` folder
	- Create a subfolder for each installed printer\
	  eg. `Canon TR8600 series`
		- Download the full driver + software installer for this printer and save to this subfolder
## Drivers
- Open a Terminal as Administrator\
  Run `wt` or `powershell` or `cmd`
- Change in to Data Transfer folder\
  `cd d:\Job#5000\Data-Transfer_2025-01-21\`
- Make empty `drivers` directory\
  `mkdir drivers`
- Export Drivers\
  `Export-WindowsDriver -Online -Destination drivers`
## Users
*naming convention:*\
`users.txt`\
`users_nirsoft-userprofilesview.html`
- Run `netplwiz` for a list of valid users
- Note each username, it's group (User or Administrator), and whether they're a Microsoft or Local account in `users.txt`
> [!example] Example users.txt
> ```
> john (john.smith@example.com) [ADMIN]
> 
> jane (local account) [USER]
> ```
### Tools
- Open `Nirsoft UserProfilesView` as Administrator
	- Select all\
	  `ctrl+a`
	- Save as `Horizontal HTML` to `Data Transfer folder`\
	  `ctrl+s`

## Office
*naming convention:*\
`office.txt`

- Note which office suite the customer is currently using, along with if and how it is activated (including the attached Microsoft Account if available)
> [!example] Example office.txt
> ```
> Microsoft Office 2019
> 
> john.smith@example.com
> 
> XJGKF-ALJDP-4VKE9-E99SD-ABCDE
> ```
## Fonts
### RClone
Use `rclone` to copy user data if available, as it is multi-threaded (faster) and verifies copied files
- Open a terminal as Administrator\
  `wt` or `powershell` or `cmd`
- Check if `rclone` is installed\
  `rclone -V`\
  *( this will show an error if not installed )*
- If `rclone` not installed:
	- Install `rclone`\
	  `winget install rclone.rclone`
	- Close and re-open the terminal\
	  *( this will refresh the environment path/variables to make rclone available )*
- Change in to Data Transfer folder\
  `cd d:\Job#5000\Data-Transfer_2025-01-21\`
- Copy `C:\Windows\Fonts` to `Data Transfer folder`\
  `rclone copy c:\windows\fonts fonts --progress`
### Windows Explorer
If `rclone` is unavailable, simply use Windows Explorer, just know it is single-threaded (slower) and does <u>not</u> verify copied files
- Copy `C:\Windows\Fonts` to `Data Transfer folder` using `Windows Explorer`

## Desktop
*naming convention:*\
`desktop_screenshot.png`\
`desktop_wallpaper.jgp`
### Screenshot
- Close all programs *( to show only pinned taskbar shortcuts )*
- Screenshot the entire desktop\
  `Win+Shift+S`
- Click `Fullscreen snip` on the snipping tool pop-up (4th option)
- Click the Snipping Tool notification pop-up
	- Save to `Data Transfer folder`\
	  `ctrl+s`
- If the Snipping Tool notification does not pop-up
	- Open Paint\
	  `mspaint`
	- Paste\
	  `ctrl+v`
	- Save to `Data Transfer folder`\
	  `ctrl+s`
### Wallpaper
- Run `%APPDATA%\Microsoft\Windows\Themes`
- Copy `transcoded`to the `Data Transfer folder`\
  *( this is the current transcoded copy of the desktop wallpaper )*
- Rename the copied `transcoded` to `desktop_wallpaper.jpg`

## OneDrive
*naming convention:*\
`onedrive.txt`
>[!example] Example onedrive.txt
>```
>ENABLED
>
>john.smith@example.com
>
>sync up to date
>```

## Passwords
*naming convention:*\
`passwords_nirsoft-lostmypassword.html`
- Open `Nirsoft LostMyPassword` as Administrator
	- Select `Search your passwords as Administrator`
	- Click `OK`
	- Select all\
	  `ctrl+a`
	- Save as `Horizontal HTML` to `Data Transfer folder`\
	  `ctrl+s`
- Open `Nirsoft Password Security Scanner` as Administrator
	- Select all\
	  `ctrl+a`
	- Save as `Horizontal HTML` to `Data Transfer folder`\
	  `ctrl+s`
- Open `Nirsoft CredentialsFileView` as Administrator
	- Select all\
	  `ctrl+a`
	- Save as `Horizontal HTML` to `Data Transfer folder`\
	  `ctrl+s`
- Open `Nirsoft VaultPasswordView` as Administrator
	- Select all\
	  `ctrl+a`
	- Save as `Horizontal HTML` to `Data Transfer folder`\
	  `ctrl+s`
	  

## Drives
*naming convention:*\
`drives_nirsoft-driveletterview.html`
- Open `Nirsoft DriveLetterView` as Administrator
	- Select all\
	  `ctrl+a`
	- Save as `Horizontal HTML` to `Data Transfer folder`\
	  `ctrl+s`

## Networking
_naming convention:_\
`network-interfaces_nirsoft-networkinterfacesview.html`\
`network-credentials_nirsoft-network-password-recovery.html`\
`wireless-networks_nirsoft-wirelesskeyview.txt`
### Credentials
- Open `Nirsoft Network Password Recovery` as Administrator
	- Select All\
	  `ctrl + a`
	- Save as `Horizontal HTML`\
	  `ctrl + s`
- Open `Nirsoft Remote Desktop PassView` as Administrator
	- Select All\
	  `ctrl + a`
	- Save as `Horizontal HTML`\
	  `ctrl + s`
- Open `Nirsoft VNCPassView` as Administrator
	- Select All\
	  `ctrl + a`
	- Save as `Horizontal HTML`\
	  `ctrl + s
### Interfaces
- Open `Nirsoft NetworkInterfacesView` as Administrator
	- Select All\
	  `ctrl + a`
	- Save as `Horizontal HTML`\
	  `ctrl + s`
### Wi-Fi Keys
- Open `Nirsoft WirelessKeyView` as Administrator
	- Click `File`
	- Click `Export All`
	- Save export to transfer folder
## Other
- Check C: Drive for unusual files/folders to transfer\
  _copy to Job folder copying the C: Drive file structure\
  ( TransferDrive:\\Job\#5000\\c\\DataToCopy )_
- Repeat this process for any additional drive letters the device may have installed

> [!example]- Example: Final Export File Structure
> This is what the final export file/folder structure should look like:
> ```
> /
> ├─ Job#5000/
> │  ├─ Data-Transfer_2025-01-21/
> │  │  ├─ c/
> │  │  │  ├─ data
> │  │  ├─ dlls/
> │  │  ├─ drivers/
> │  │  │  ├─ exports
> │  │  ├─ fonts/
> │  │  ├─ printers/
> │  │  │  ├─ installers
> │  │  ├─ Users/
> │  │  ├─ web-browsers/
> │  │  │  ├─ google-chrome/
> │  │  │  │  ├─ extensions/
> │  │  │  │  ├─ profile/
> │  │  │  ├─ microsoft-edge/
> │  │  │  │  ├─ extensions/
> │  │  │  │  ├─ profile/
> │  │  │  ├─ mozilla-firefox/
> │  │  │  │  ├─ extensions/
> │  │  │  │  ├─ profile/
> │  │  ├─ bluetooth-devices.txt
> │  │  ├─ default-apps.txt
> │  │  ├─ desktop_screenshot.png
> │  │  ├─ desktop_wallpaper.jpg
> │  │  ├─ dlls_nirsoft-regdllview.html
> │  │  ├─ domain.txt
> │  │  ├─ drives_nirsoft-driveletterview.html
> │  │  ├─ email-client_nirsoft-mail-passview.html
> │  │  ├─ email-client_nirsoft-pstpassword.html
> │  │  ├─ email-client_nirsoft-winmailpassrec.html
> │  │  ├─ hostname.txt
> │  │  ├─ installed-programs_nirsoft-installedpackagesview.html
> │  │  ├─ installed-programs_nirsoft-uninstallview.html
> │  │  ├─ license-keys_nirsoft-product-key-scanner.html
> │  │  ├─ license-keys_nirsoft-produkey.html
> │  │  ├─ netword-shares.txt
> │  │  ├─ network-credentials_nirsoft-network-password-recovery.html
> │  │  ├─ network-interfaces_nirsoft-networkinterfacesview.html
> │  │  ├─ office.txt
> │  │  ├─ outlook_export_archive.pst
> │  │  ├─ outlook_export_calendar.pst
> │  │  ├─ outlook_export_contacts.csv
> │  │  ├─ outlook_export_john@example.com.pst
> │  │  ├─ outlook_export_profile.reg
> │  │  ├─ passwords_nirsoft-lostmypassword.html
> │  │  ├─ printers.txt
> │  │  ├─ registry.reg
> │  │  ├─ remote-desktop_nirsoft-remote-desktop-passview.html
> │  │  ├─ remote-desktop_nirsoft-vncpassview.html
> │  │  ├─ security-software_nirsoft-securitysoftview.html
> │  │  ├─ security.txt
> │  │  ├─ startup-items_nirsoft-whatinstartup.html
> │  │  ├─ symlinks_nirsoft-ntfslinksview.html
> │  │  ├─ users.txt
> │  │  ├─ web-browser_addons_nirsoft-browseraddonsview.html
> │  │  ├─ web-browser_google-chrome_bookmarks.html
> │  │  ├─ web-browser_google-chrome_extensions.txt
> │  │  ├─ web-browser_google-chrome_passwords.csv
> │  │  ├─ web-browser_google-chrome_sync.txt
> │  │  ├─ web-browser_microsoft-edge_bookmarks.html
> │  │  ├─ web-browser_microsoft-edge_extensions.txt
> │  │  ├─ web-browser_microsoft-edge_passwords.csv
> │  │  ├─ web-browser_microsoft-edge_sync.txt
> │  │  ├─ web-browser_mozilla-firefox_bookmarks.html
> │  │  ├─ web-browser_mozilla-firefox_extensions.txt
> │  │  ├─ web-browser_mozilla-firefox_passwords.csv
> │  │  ├─ web-browser_mozilla-firefox_sync.txt
> │  │  ├─ windows.txt
> │  │  ├─ winget.json
> │  │  ├─ winget_unavailable.txt
> │  │  ├─ wireless-networks_nirsoft-wirelesskeyview.txt
> │  ├─ John Smith.txt
> ```
> This should now be a comprehensive export of the old source device.\
> You may not import *all* of these exports on to the new target device, but you should have everything you *might* need to reference during the restoration process.

# Prepare New Device *( if required )*

## OOBE
Create a Local Account during Windows 10/11 Out of Box Experience ( OOBE )
- **Option 1: No Internet Connected**\
  Bypass Network Registration
	- _Open Command Prompt:_ `Shift+F10` _( may require pressing `Fn` on some devices )_
	- _Run command:_ `OOBE\BYPASSNRO` _( this will restart the OOBE if successful )_
	- _Proceed through OOBE like normal until you get to the Network Selection screen_
	- _Select_ `I don't have an internet connection` _( if this button is not available the bypass didn't work, proceed to Option 2 )_
	- _Select_ `Continue with limited setup`
	- _Create a Local Account:_ `COPS` ( no password )
	- _Complete the OOBE as normal_
- **Option 2: Internet Connected**\
  Force Local Account Creation
	- _Proceed though OOBE like normal until you get to the Login with a Microsoft Account screen_
	- _Open Command Prompt:_ `Shift+F10` _( may require pressing `Fn` on some devices )_
	- _Run command:_ `start ms-cxh:localonly`
	- _Create a Local Account:_ `COPS` ( no password )
	- _Complete the OOBE as normal_
- **Option 3: Internet Connected ( New Bypass )**
  %% reference: https://github.com/ChrisTitusTech/bypassnro %%
  %% reference: https://www.youtube.com/watch?v=aEWb1otLVPo %%
  Apply unattend.xml
	- Open Command Prompt: `Shift+F10` ( may require pressing `Fn` on some devices )
	- Run the following commands:
	  ```batch
	  curl -L christitus.com/bypass -o skip.cmd
	  skip.cmd
	  ```
- Note regarding Windows 10/11 S Mode\
    In some cases you won't be able to open the Command Prompt, you may only see it's black box flash up on the screen and quickly dissapear. This is could be a indication of the Windows 10/11 install being in S Mode (Store Mode), which disables access to terminals (i.e. Command Prompt) and execution of non Microsoft Store apps.\
    If you encounter this, you will <u>not</u> be able create a Local Account during the OOBE, and you will need to complete the OOBE with the customer's Microsoft Account.
    After the OOBE is complete and you've reached the Windows Desktop environment, you may need to [Switch Out of S Mode](https://support.microsoft.com/en-au/windows/switching-out-of-s-mode-in-windows-4f56d9be-99ec-6983-119f-031bfb28a307) to proceed with the Data Transfer, as S Mode restricts us from running our tools if required.
    - [ <font style="color:ORANGE">OPTIONAL</font> ] Switch Out of S Mode
 >[!info]- How to switch out of S Mode
 >>[!warning] WARNING: Switching out of S Mode is a permanent change and can <u>NOT</u> be reverted
 > - Connect to the internet
 > -  Open a terminal as Administrator\
 >   or\
 >   Run `ms-windows-store://pdp/?productid=BF712690PMLF&OCID=windowssmodesupportpage`
 > - Follow the prompts to Switch Out of S Mode\
 >   *this will change the Windows edition installed to Windows 10/11 Home or Pro as per it's installed license*
## Setup Device
- **Configure System Restore**\
  enable on C:\ with 7% allocation
- **Check installed Windows' Edition**\
  `winver`
- **Create a new System Restore point**\
  `COPS - Fresh Windows 10/11 Home/Pro Install`\
  ( use 10 or 11 and Home or Pro as per `winver` )
- **Connect to the Internet** (if not already)
- **Check Windows is activated**\
  `ms-settings:activation`\
  or\
  `ms-settings:activation?activationSource=SMC-Article-12440`
- **Configure Time/Date**
- **Configure Windows Update**
- Open Windows Update\
    Run `control update`
- Click `Resume updates` if updates are currently paused
- Disable `Get the latest updates as soon as they're available`
- Advanced options
	- Enable `Receive update for other Microsoft products`
	- Disable `Get me up to date`
	- Enable `Notify me when a restart is required to finish updating`
	- Delivery Optimization
	- Enable `Allow downloads from other devices`
		- Select `Devices on my local network`
- **Update Microsoft Store Apps**
	- Open Microsoft Store\
	  `ms-windows-store:`
		- Click `Downloads`
		- Click `Check for updates`
		- Click `Update all`
- **Update Winget Apps**\
	- Open a Terminal\
	  `wt` or `powershell` or `cmd`
	- Run the following commands:
    ```batch
    winget source update
    winget upgrade --all --silent
    ```
- **Update Windows**\
  `control update`
- **Update Office apps**\
  `"C:\Program Files\Common Files\microsoft shared\ClickToRun\OfficeC2RClient.exe" /update user forceappshutdown=true`
- **Check Drivers**\
  Bangs(!) exclamation marks in Device Manager indicates missing, incorrect, or corrupt drivers
	- Open `Device Manager` to check for Bangs(!)
	- Run `Snappy Driver Installer Origin (SDIO)` as an Administrator
	- Select `Create a new system restore point`
	- Select all missing/incorrect/corrupt drivers (as per bangs! in Device Manager)
	- Click `Install`
	- [ <font style="color:ORANGE">OPTIONAL</font> ] Update Outdated Drivers
- **Verify Drivers**
	- **Turn On Windows Verifier:**
		- Run `verifier`
		- Select `Create standard settings`
		- Click `Next`
		- Select `Automatically select all drivers on this computer`
		- Click `Finish`
		- Restart Windows\
		  `shutdown -r -f -t 00`
	  - **Turn Off Windows Verifier:**
		- Run `verifier`
		- Select `Delete existing settings`
		- Click `Finish`
		- Restart Windows\
		  `shutdown -r -f -t 00`
>[!info]- How Verifier works
>- Windows Verifier works by stressing out drivers as they're loaded (it is expected that the computer's performance will be impacted while verifier is enabled)
>- If Windows loads into the desktop OK and does not crash with Verifier enabled, then all is good and you can proceed to turn it off
>- If Verifier induces a crash, Windows should produce a Blue Screen of Death (BSOD) with a STOP Code error and information on the driver that crashed, you can use this information to identify the faulty driver that caused the crash and replace it


# Restore

## User Accounts
- Log in to the `COPS` user account
- Run: `netplwiz`
	- Create a new local user account for each user profile to be transferred\
	  *( reuse the usernames from the old device )*
	- Change the group of these new accounts to `Administrator` as per the old device
- Log in and out of each of these new user accounts\
  *( this lets Windows setup the new user profiles for us to update )*
	- Check that each new user account has Administrator permissions as expected\
	  *try to open a terminal as Administrator, see if it asks you to log in as an Administrator*

## User Profiles
- Log in to the `COPS` user account
- Copy the user data from the transfer drive to the device\
  *( skip `AppData` and `OneDrive` for now, and do <u>NOT</u> copy the `NTUser.dat` )*
	- If there was data in the `OneDrive` folder on the old device and you can't sign back in to it on the new machine, then copy the contents of the `OneDrive` folder in to the User Profile directly

## Programs
- Log in to the new User account\
  *( some programs are installed to the current user )*
- Import winget export from old device\
  `winget import winget.json`
- Go through `winget_unavailable.txt` and manually install any missed programs as required\
  `winget search program-name` or search internet for installers
- Activate programs as required\
  *Office apps, Security apps, etc..*

## Web Browsers
### Sync
Sign in to the customer's sync accounts if available for all web browsers
### Manual
If not using Sync, manually import customer's data for all web browsers\
*( Bookmarks, Passwords, Extensions )*

## Mail Clients
- Restore Mail Client Profiles if available\
  `outlook_profile.reg` or backed up Thunderbird profile, etc..
- Manually re-set up mail clients/accounts as required
	- Import old emails
	- Import contacts as required

## Printers
*naming convention:*\
`Install Printer (Canon TR8600 series).ink`

Most printers can not be installed without the printer present/connection, especially networked printers.\
So we make the installers available for the user to install themselves when they're back on site with their printer(s).

- Copy printer installers folder to `C:\COPS\printers\`
- Create shortcuts to each printer installer in `C:\Users\Public\Desktop\`\
  *( this will make the shortcuts appear on every user's desktop )*
	- Move the shortcuts to the top right of the new user account's desktop if possible\
	  *( making it easy for the user to find the installers )*

## Other
- Copy over any C: Drive files/folders that were backed up\
  *( also do so for any other drive letters that were backed up )*

## Hardware
- Move any USB Dongles across from the old PC to this new PC\
  *( Wireless Mouse/Keyboard Dongles, Wi-Fi Adapaters, Bluetooth Adapters, etc.. )*
	- Install additional drivers as required\
	  `SDIO`
## Updates
- Update Apps\
	- Microsoft Store\
	  `ms-windows-store:`
	- Winget
	  ```
	  winget source update
	  winget upgrade --all --silent
	  ```
- Update Windows\
  `control update`
- Update Office apps (if installed)\
  `"C:\Program Files\Common Files\microsoft shared\ClickToRun\OfficeC2RClient.exe" /update user`
## Cleanup
- Restart Windows\
  `shutdown -r -f -t 00`
- Log in to the new User account (that's an Administrator)
- Remove the `COPS` user account
	- Run `netplwiz`
	- Select `COPS`
	- Click `Remove`
	- Delete `C:\Users\COPS` folder\
	  *( Windows may prevent you from removing this folder if it's currently accessing it in the background, if this happens just restart Windows and try to remove it again )*
- Empty `Recycle Bin`
- Disk Cleanup
	- Configure `Disk Cleanup Tool`\
	  `cleanmgr /sageset:10`
	- Run `Disk Cleanup Tool`\
	  `cleanmgr /sagerun:10`
## System Maintenance/Repair
  - Open a Terminal as Administrator\
    `wt` or `powershell` or `cmd`
  - Run the following commands:
    ```batch
    winget source reset --force
    winget source update
    winget upgrade --all --silent
    sfc /scannow
    dism /online /cleanup-image /startcomponentcleanup /resetbase
    dism /online /cleanup-image /restorehealth
    sfc /scannow
    defrag /c /o
    chkdsk c: /r /scan /perf
    ```
>[!tip]- Useful Tip
>You can queue up multiple commands in PowerShell by pressing `Shift+Enter` to add a new line before pressing `Enter` to execute the all of the queued up commands one after another

- Restart Windows
- Create a new System Restore point\
  `COPS - Completed Data Transfer`


