---
title: Windows
updated: 2025-08-30
tags:
  - procedures
  - system-service
  - windows
---
# Software

- **Restart Windows**\
  _Force Restart Windows now to provide a clean environment befor proceeding_\
  `shutdown -r -f -t 00`

- **System Restore**\
  - Check System Restore configuration\
    _Make sure System Restore is Enabled on C: and set the allocation to 7%_ 
  - Create a new System Restore point\
    `COPS - Pre System Service`

- **Task Manager**
  - Disable unwanted startup items

- **Wintoys**
  - Install [Wintoys](https://apps.microsoft.com/detail/9p8ltpgcbzxd)\
    `winget install wintoys`\
    or\
    `winget install 9P8LTPGCBZXD`\
    or\
    `ms-windows-store://pdp/?ProductId=9P8LTPGCBZXD`
  - Performance Tab
    - `Ultimate performance power plan`\
      Turn ON if Desktop\
      Turn OFF if Laptop
    - `HAGS (hardware-accelerated GPU scheduling)` | Turn ON
    - `VBS (virtualization-base security)` | Turn ON
    - `Startup apps` | Disable unwanted startup items
    - `Search indexing` | Turn ON
    - `Delivery optimization` | Turn ON
    - `Network adapter onboard processor` | Turn ON
  - Health Tab
    - `Fast startup` | Turn ON
    - `Drive optimization` | Turn ON and run (click config icon and optimise each drive)
    - `Storage sense` | Turn ON and run (click config icon and click 'Run Storage Sense now')
    - `Cleanup` | Run 'Junk' + 'Microsoft Store' + 'DNS'
    - `System updates` | Set to 'Default'
    - `App updates` | Turn ON
    - `Graphics driver` | Click 'Restart'
    - `Icons cache` | Click 'Rebuild'
  - Tweaks Tab
    - `Desktop` | Turn ON 'This PC' + 'Recycle Bin'
- **Updates**
  - Update Windows\
    _old Windows 10 builds can use the `Windows 10 Update Assistant` to jump to the latest build_
  - Update Apps via `Winget`
  - Update Apps via `Microsoft Store`
  - Update Office Apps\
    `"C:\Program Files\Common Files\microsoft shared\ClickToRun\OfficeC2RClient.exe" /update user forceappshutdown=true`

- **Drivers**
  - Update Drivers using `SDIO`
  - Verify Drivers using `verifier`

- **System Maintenance/Repair**
  - Open a Terminal as Administrator\
    Run `wt` or `powershell` or `cmd`
  - Run the following commands:
    ```powershell
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
  - Disk Cleanup
    - Run `cleanmgr /sageset:10`
    - Click `Clean up system files`
    - Tick all checkboxes EXCEPT the following:
	    - [ ] System error memory dump files
	    - [ ] System error minidump files
	    - [ ] Windows error reports and feedback diagnostics
	    - [ ] User file history
    - Click `OK`
    - Run `cleanmgr /sagerun:10`
  - Memory Diagnostics
    - Run `Windows Memory Diagnostics`
    - Click 'Restart now and check for problems (recommended)'
    - After Windows boots back up, check results:\
      `Event Viewer` - Windows Logs - System - Filter Current Log... - Event sources - Tick 'MemoryDiagnostics-Results' - Click OK
  - Create a new System Restore point\
    `COPS - Post System Service`

# Hardware

- Check all buttons and ports are free from debris and working functioning correctly
- Air compress out system as required
- Wipe down device and clean surfaces
- Add a `Serviced by COPS` sticker or replace old worn stickers as required