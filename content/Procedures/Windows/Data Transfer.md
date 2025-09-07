---
title: Data Transfer
updated: 2025-09-08
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

  - Restart Windows\
    _Force Restart Windows now to provide a clean environment befor proceeding_\
  - [ <font style="color:ORANGE">OPTIONAL</font> ] Create a new System Restore point

## Antivirus

  - Disable the Antivirus\
    _Some of our extraction tools prompt false positives in the majority of security software_

## Transfer Drive

- Create a Job folder on the Transfer Drive
    _naming convention:_\
    `Job#5000`
- [ <font style="color:ORANGE">OPTIONAL</font> ] Create a .txt file with the customer's name for quick identification when browsing job folders\
  *naming convention:*\
  `John Smith.txt`
- Create a dated Data Transfer folder inside of the Job folder\
  This is the folder where all exported user data will be saved for the data transfer\
  *naming convention:*\
  `Data-Transfer_2025-01-21`\
  *(append the date to this folder name, so we don't need to date each file individually, but should you add/edit export files inside this folder at a later date then append the date to those filenames)*
> [!example]- Example: Starting Export File Structure
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

  - _Copy `C:\Users\` folder to the Job folder on the Transfer Drive_

## Web Browsers

  For each installed web browser complete the following:

  - **Export Bookmarks**\
    _naming convention:_\
    `web-browser_google-chrome_bookmarks.html`\
    or\
    `Web Browser - Google Chrome - Bookmarks.html`
    - Google Chrome URL: `chrome://bookmarks`\
    - Microsoft Edge URL: `edge://favorites`\
    - AVG Secure Browser URL: `secure://bookmarks`\
    - Mozilla Firefox Hotkey: `Ctrl+Shift+O`\
    - Microsoft Internet Explorer: `%USERPROFILE%\Favorites`

  - **Export Passwords**\
    _naming convention:_\
    `web-browser_google-chrome_passwords.csv`\
    or\
    `Web Browser - Google Chrome - Passwords.csv`\
    - Google Chrome URL: `chrome://password-manager` or `chrome://settings/passwords` (older Chrome versions)\
    - Microsoft Edge URL: `edge://wallet/passwords` or `edge://settings/passwords` (older Edge versions)\
    - AVG Secure Browser URL: `secure://password-manager` or `secure://settings/passwords` (older Secure Browser versions)\
    - Mozilla Firefox URL: `about:logins`\
      *(Firefox may require multiple updates before the Export Passwords button is available)*
    - Microsoft Internet Explorer: use [Nirsoft IE PassView](https://www.nirsoft.net/utils/internet_explorer_password.html)

  - **Sync Accounts**\
    _Try to sync each browser with their relevant accounts if available_\
    _Manual exports of Bookmarks + Passwords is good, but syncing the entire browser is better_\
    _naming convention:_\
    `web-browser_google-chrome_sync.txt`\
    or\
    `Web Browser - Google Chrome - Sync.txt`\
    Save the sync account email address in this file and whether sync is enabled or note, and save "no account signed in" if there is no account signed in to the web browser.
    - Google Chrome: `Google Account`
      - `chrome://sync-internals`\
      - Check Enabled: `Sync Feature Enabled` = true\
      - Check Account: `Username`\
      - Checked Synced: `Last Synced` = Just now\
      - Check Not Actively Syncing: `Sync Cycle Ongoing` = false\
      - Force Sync (if required): `chrome://extensions` - enable `Developer mode` - click `Update`\
    - Microsoft Edge: `Microsoft Account`
      - `edge://sync-internals`\
      - Check Enabled: `Sync Feature Enabled` = true\
      - Check Account: `Username`\
      - Checked Synced: `Last Synced` = Just now\
      - Check Not Actively Syncing: `Sync Cycle Ongoing` = false\
      - Force Sync (if required): `edge://extensions` - enable `Developer mode` - click `Update`\
    - AVG Secure Browser: `AVG Account`
      <!-- - _TODO (but it's similar to Chrome)_\ -->
    - Mozilla Firefox: `Mozilla Account`
      <!-- - _TODO_ -->

## Programs

- **Export Installed Programs List**\
    _naming convention:_\
    `installed-programs_nirsoft-uninstallview.html`\
    or\
    `Installed Programs - Nirsoft Uninstallview.html`
	- Use `Nirsoft UninstallView` and `Nirsoft InstalledPackagesView`, save all as `Horizontal HTML`

- **Export Winget**\
    _naming convention:_\
    `winget.json`
    - Open a Terminal as Administrator\
      Run `wt` or `powershell` or `cmd`
    - Change in to Data Transfer folder\
      `cd d:\Job#5000\Data-Transfer_2025-01-21\`
    - Check Winget is installed\
      `winget -v` (this will throw an error if winget is unavailable)
    - Update Winget `winget source update`
    - Export Winget's list of installed programs\
      `winget export -o winget.json`\
    - [ <font style="color:ORANGE">OPTIONAL</font> ] Export a list of all programs that Winget cannot re-install at the same time with this extended command\
      `winget export -o winget.json > winget_unavailable.txt`
  - [ <font style="color:ORANGE">ALTERNATIVE</font> ] Create Winget Install Script using 3rd party site\
    [winstall.app](https://winstall.app/)\
    [winget.run](https://winget.run/)

## Licenses

  _naming convention:_\
  `license-keys_nirsoft-product-key-scanner.html`\
  or\
  `License Keys - Nirsoft Product Key Scanner.html`
  - _use Nirsoft Product Key Scanner or Nirsoft ProduKey, save all as Horizontal HTML_

## Emails / Calendars / Contacts

  - Extract Passwords and Server Settings
    - Nirsoft Mail PassView
    - Nirsoft WinMailPassRec
    - Nirsoft PstPassword
  - Backup any accounts set up as POP
    - [_How to export emails to file in Outlook_](https://support.microsoft.com/en-au/office/back-up-your-email-e5845b0b-1aeb-424f-924c-aa1c33b18833)
  - Export Calendars
  - Export Contacts

## Drivers

- Export Drivers\
  _naming convention:_\
  `TRANSFERDRIVE:\\Job#5000\drivers\`
- Open `PowerShell` as an Administrator and run the following script:\
  `Export-WindowsDriver -Online -Destination "REPLACE-WITH-TARGET-FOLDER"`\
  _update REPLACE-WITH-TARGET-FOLDER with the target drivers folder on the transfer drive_

## Other

- Check C: Drive for unusual files/folders to transfer\
  _copy to Job folder copying the C: Drive file structure (TransferDrive:\\Job\#5000\\C\\FolderToSave)_
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
> │  │  ├─ startup-items_nirsoft-whatinstartup.html
> │  │  ├─ symlinks_nirsoft-ntfslinksview.html
> │  │  ├─ trend-micro.txt
> │  │  ├─ users.txt
> │  │  ├─ web-browser_addons_nirsoft-browseraddonsview.html
> │  │  ├─ web-browser_google-chrome_bookmarks.html
> │  │  ├─ web-browser_google-chrome_passwords.csv
> │  │  ├─ web-browser_google-chrome_sync.txt
> │  │  ├─ web-browser_microsoft-edge_bookmarks.html
> │  │  ├─ web-browser_microsoft-edge_passwords.csv
> │  │  ├─ web-browser_micrsoft-edge_sync.txt
> │  │  ├─ web-browser_mozilla-firefox_bookmarks.html
> │  │  ├─ web-browser_mozilla-firefox_passwords.csv
> │  │  ├─ web-browser_mozilla-firefox_sync.txt
> │  │  ├─ windows.txt
> │  │  ├─ winget.json
> │  │  ├─ winget_unavailable.txt
> │  │  ├─ wireless-networks_nirsoft-wirelesskeyview.html
> │  ├─ John Smith.txt
> ```
> This should now be a comprehensive export of the old source device.\
> You may not import *all* of these exports on to the new target device, but you should have everything you *might* need to reference during the restoration process.

# Prepare New Device _(if required)_

- **Create a Local Account during Windows 10/11 Out of Box Experience (OOBE)**
  - **Option 1: No Internet Connected**\
    Bypass Network Registration
    - _Open Command Prompt:_ `Shift+F10` _(may require pressing `Fn` on some devices)_\
    - _Run command:_ `OOBE\BYPASSNRO` _(this will restart the OOBE if successful)_\
    - _Proceed through OOBE like normal until you get to the Network Selection screen_\
    - _Select_ `I don't have an internet connection` _(if this button is not available the bypass didn't work, proceed to Option 2)_\
    - _Select_ `Continue with limited setup`\
    - _Create a Local Account:_ `COPS` (no password)\
    - _Complete the OOBE as normal_
  - **Option 2: Internet Connected**\
    Force Local Account Creation
    - _Proceed though OOBE like normal until you get to the Login with a Microsoft Account screen_\
    - _Open Command Prompt:_ `Shift+F10` _(may require pressing `Fn` on some devices)_\
    - _Run command:_ `start ms-cxh:localonly`
    - _Create a Local Account:_ `COPS` (no password)\
    - _Complete the OOBE as normal_
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
- **Configure System Restore**\
- **Check installed Windows' Edition**\
  - _Run_ `winver`
- **Create a new System Restore point**\
  `COPS - Fresh Windows 10/11 Home/Pro Install` (use 10 or 11 and Home or Pro as per `winver`)
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
- **Update Microsoft Store Apps**\
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
  - Select `TODO: Create a new system restore point`
  - Select all missing/incorrect/corrupt drivers (as per bangs! in Device Manager)
  - Click `Install`
- **[ <font style="color:ORANGE">OPTIONAL</font> ] Update Outdated Drivers**
- **Verify Drivers**
>[!info]- How Verifier works
>- Windows Verifier works by stressing out drivers as they're loaded (it is expected that the computer's performance will be impacted while verifier is enabled)
>- If Windows loads into the desktop OK and does not crash with Verifier enabled, then all is good and you can proceed to turn it off
>- If Verifier induces a crash, Windows should produce a Blue Screen of Death (BSOD) with a STOP Code error and information on the driver that crashed, you can use this information to identify the faulty driver that caused the crash and replace it
  - **Turn On Windows Verifier:**
    - Run `verifier`
    - Select `Create standard settings`
    - Click `Next`
    - Select `Automatically select all drivers on this computer`
    - Click `Finish`
    - Restart Windows `shutdown -r -f -t 00`
  - **Turn Off Windows Verifier:**
    - Run `verifier`
    - Select `Delete existing settings`
    - Click `Finish`
    - Restart Windows `shutdown -r -f -t 00`

# Restore

- **Install Programs**
  - you can use the winget install script for this if you made one \ - _install programs before restoring the user profile, as otherwise some required registry entries may not exist yet_
- **Restore User Profiles**
  - make Administrator, make default user, set no password and set password does NOT expire
- **Copy over any C: Drive files/folders that were backed up**
- **Restart Windows** (this should log in to the restored user profile)
  - open a command prompt window (or similar) as Administrator to ensure account has admin priviledges
- **Install Printer Drivers**
  - If you can not install the printer drivers + software without the printer present, save the printer package installer to `C:\COPS\` and create a shortcut to it on the customer's desktop
- **Check Web Browsers and restore Bookmarks and Passwords from backups as required**
- **Activate software using extracted keys or accounts as required**
- **Configure email accounts as required**
- **Install additional drivers as required**
- **Move any USB Dongles from the old device (Wireless mice, wifi, blue adapters, etc...)**
- **Update Apps**\
  via `Microsoft Store`\
  via `Winget`
- **Update Windows**
- **Update Office apps** (if installed)
- **Restart Windows**
- **Remove 'COPS' user account**
  - Run `netplwiz` - Select `COPS` - Click `Remove`
  - Delete `C:\Users\COPS\` folder\
  _Windows may prevent you from removing this folder if it's currently accessing it in the background, if this happens just restart Windows and try to remove it again_
  - Empty Recycle Bin
- **System Maintenance/Repair**
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

- **Restart Windows**
- **Create a new System Restore point**\
  `COPS - Completed Data Transfer`


