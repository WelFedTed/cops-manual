

# Sideloading <!-- TODO: flesh this out -->

## Android

---

### Download

- Download desired .APK from 3rd party source or directly from the `Google Play` store using [Aurora Store](https://auroraoss.com/)
- [ <font style="color:ORANGE">If you can only download an App Bundle (.APKS, .XAPK, .APKM)</font> ]
  - Use [AntiSplit M](https://github.com/AbdurazaaqMohammed/AntiSplit-M) to merge the bundle components back in to a .APK file

<!-- notes from reddit (https://www.reddit.com/r/degoogle/comments/1bf4hwv/how_do_i_get_apks_from_aurora_store/)
  - Install the app you want the APK of via the Aurora Store. You don't need to run the app or give it any permissions.

  - Go back to your Aurora main screen and tap the downloads icon in the upper right corner.

  Find the app you just installed at the top of the list. Tap and hold on it. Select "Save App bundle". Save it somewhere. It will give you a ZIP file.

  - Download AntiSplit-M and install it.

  - Run AntiSplit-M and tap "Select split APK to Merge". Select the ZIP file you saved above.

  - Save the APK somewhere.

  - It runs for a few seconds.

  - You now have an APK. Do APK things with it.
 -->

### Upload

- Connect the Android device to a computer
- Navigate to it's mounted file system _(i.e. in `This PC`)_
- Open `Downloads` folder
- Copy `.APK` file in to the `Downloads` folder

### Install

- Enable Sideloading\
  _Depending on the manufacturer of the device, you may need to enable Sideloading before you can install .APK files_\
  [Samsung](https://www.samsung.com/ae/support/mobile-devices/how-to-enable-permission-to-install-apps-from-unknown-source-on-my-samsung-phone/ "How to enable sideloading on Samsung devices")
- Open `Files` app
- Navigate to `Downloads` folder
- Tap on the `.APK` file
- Tap `Install`

# USB Tool <!-- TODO: flesh this out -->

## Ventoy

## Medicat

## Bootable Tools

## Windows Tools

## COPS Extras (scripts, etc..)

# Reference


## Commands

---

### Windows

| Command                   | Description                                         | Use Case  |
| :---                      | :---                                                | :---      |
| `\`                       | Opens `%SYSTEMDRIVE%` folder                        | Quick access to `C:\` |
| `appwiz.cpl`              | Opens `Programs and Features` control panel window  | |
| `calc`                    | Opens `Calculator` app                              | |
| `charmap`                 | Opens `Character Map` app                           | |
| `chrome`                  | Opens `Google Chrome` app _(if installed)_          | |
| `cmd`                     | Opens `Command Prompt` app _(if installed)_         | |
| `code`                    | Opens `Visual Studio Code` app                      | |
| `compmgmt.msc`            | Opens `Computer Management` snap in                 | |
| `control`                 | Opens `Control Panel`                               | |
| `control folders`         | Opens `File Explorer Options` window                | |
| `control keyboard`        | Opens `Keyboard Properties` window                  | |
| `control printers`        | Opens `Bluetooth & devices` settings window         | Quick access to `Printers & scanners` |
| `control update`          | Opens `Windows Update` settings window              | |
| `desk.cpl`                | Opens `Display` settings window                     | Quick access to `Resolution` + `Multi-Montior` settings |
| `devmgmt.msc`             | Opens `Device Manager` snap in                      | Check `Drivers` |
| `diskmgmt.msc`            | Opens `Disk Management` snap in                     | Check connected drives|
| `diskpart`                | Opens `Microsoft DiskPart` command line interface   | |
| `documents`               | Opens current user's `Documents` folder             | |
| `downloads`               | Opens current user's `Downloads` folder             | |
| `dxdiag`                  | Opens `DirectX Diagnostic Tool` app                 | |
| `eventvwr.msc`            | Opens `Event Viewer` snap in                        | |
| `explorer`                | Opens `Windows Explorer`                            | |
| `firefox`                 | Opens `Mozilla Firefox` app _(if installed)_        | |
| `firewall.cpl`            | Opens `Windows Defender Firewall` control panel window ||
| `fonts`                   | Opens `Fonts` folder                                | |
| `gpedit.msc`              | Opens `Local Group Policy Editor` snap in           | |
| `iexplore`                | Opens `Internet Explorer` app                       | |
| `inetcpl.cpl`             | Opens `Internet Properties` window                  | Quick access to `Proxy server` settings |
| `joy.cpl`                 | Opens `Game Controllers` window                     | Use to test game controller inputs |
| `lusrmgr.msc`             | Opens `Local Users and Groups` snap in              | Powerful control over User Accounts and Groups, but does <u>not</u> work on Windows Home editions |
| `main.cpl`                | Opens `Mouse Properties` window                     | |
| `manage-bde c: -off`      | Run in a terminal to decrypt and disable `BitLocker` on C: drive ||
| `manage-bde -status`      | Run in a terminal to show `BitLocker` status of all drives ||
| `mdsched`                 | Opens `Windows Memory Diagnostic` app               | |
| `mmc`                     | Opens empty `Microsoft Management Console` snap in  | |
| `mmsys.cpl`               | Opens `Sound` window                                | |
| `mrt`                     | Opens `Microsoft Windows Malicious Software Removal Tool` app ||
| `msconfig`                | Opens `System Configuration` window                 | Quick access to `Safe boot` or Windows boot entries |
| `msedge`                  | Opens `Microsoft Edge` app                          | |
| `msinfo32`                | Opens `System Information`                          | |
| `mstsc`                   | Opens `Remote Desktop Connection` app               | |
| `ms-windows-store:`       | Opens `Microsoft Store` app                         | |
| `ncpa.cpl`                | Opens `Network Connections` control panel window    | |
| `netplwiz`                | Opens `User Accounts` window                        | Less powerful control over User Accounts, but does work on Windows Home editions |
| `notepad`                 | Opens `Notepad` app                                 | |
| `onedrive`                | Opens current user's `OneDrive` folder              | |
| `osk`                     | Opens `On-Screen Keyboard`                          | |
| `pictures`                | Opens current user's `Pictures` folder              | |
| `powercfg.cpl`            | Opens `Power Options` control panel window          | |
| `powershell`              | Opens `Powershell` app                              | |
| `regedit`                 | Opens `Registry Editor` app                         | |
| `resmon`                  | Opens `Resource Monitor app`                        | |
| `services.msc`            | Opens `Services` snap in                            | |
| `shell:appsfolder`        | Opens `Applications` folder                         | Useful for creating shortcuts to `Microsoft Store` apps |
| `shell:mycomputerfolder`  | Opens `This PC` folder                              | |
| `shell:recyclebinfolder`  | Opens `Recycle Bin` folder                          | |
| `shell:startup`           | Opens `Startup` folder                              | |
| `shutdown /h`             | Hibernate computer                                  | |
| `shutdown /l`             | Log off                                             | |
| `shutdown /r /fw /t 00`</br>Run as Administrator | Restart Windows and boot in to `BIOS` / `UEFI`      | |
| `shutdown /r /o /t 00`    | Restart Windows and boot in to `Recovery Environment` | |
| `shutdown /r /f /t 00`    | Force Restarts Windows immediately                  | |
| `shutdown /s /f /t 00`    | Force Shuts down Windows immediately                | |
| `snippingtool`            | Opens `Snipping Tool` app                           | |
| `sysdm.cpl`               | Opens `System Properties` window                    | Quick access to `System Restore` |
| `taskmgr`                 | Opens `Task Manager` app                            | |
| `taskschd.msc`            | Opens `Task Scheduler` snap in                      | |
| `timedate.cpl`            | Opens `Date and Time` window                        | |
| `verifier`                | Opens `Driver Verifier Manager` app                 | |
| `videos`                  | Opens current user's `Videos` folder                | |
| `vlc`                     | Opens `VLC Media Player` app _(if installed)_       | |
| `winver`                  | Opens `About Windows` window                        | Quick way to check installed Windows edition _(Home/Pro/Enterprise)_, version, and build |
| `wt`                      | Opens `Windows Terminal` app                        | |
| `%APPDATA%`               | Opens current user's `AppData\Roaming` folder       | |
| `%LOCALAPPDATA%`          | Opens current user's `AppData\Local` folder         | |
| `%SYSTEMDRIVE%`           | Opens the root folder of the system drive           | |
| `%TEMP%`                  | Opens current user's `Temp` folder                  | |
| `%USERPROFILE%`           | Opens current user's profile folder                 | |
| `%WINDIR%`                | Opens `Windows` folder                              | |
<!-- add sfc, dism, chkdsk, defrag, cleanmgr -->

## Hotkeys

### Windows

<!-- populate hotkeys (i.e Win+R, Win+E, Win+D, Ctrl+Shift+ESC, Win+X > A, Win+X > M, Win+X > U > U, etc..) -->

## Resources

### Hardware

|    |     |
|:-- | :-- |
| [iFixIt - Electronics Skills](https://www.ifixit.com/Device/Electronics_Skills) | Learn general device repair and electronics skills |
| [iFixIt - Repair Guides](https://www.ifixit.com/Guide) | Repository of repair guides for specific devices |
| [Repair Wiki](https://repair.wiki/) | Guides for troubleshooting more specific or niche device issues |
| [Keyboard Checker](https://keyboardchecker.com/) | Keyboard tester |
| [HardwareTester - Midi Tester](https://hardwaretester.com/midi) | Test MIDI input devices |
| [HardwareTester - Gamepad Tester](https://hardwaretester.com/gamepad) | Test Gamepads / Controllers |
| [HardwareTester - Microphone Tester](https://hardwaretester.com/microphone) | Test Microphones |
| [PassMark - CPU Benchmarks](https://www.cpubenchmark.net/) | Compare CPU's |
| [PassMark - Videocard Benchmarks](https://www.videocardbenchmark.net/) | Compare Videocards |
| [PassMark - Memory Benchmarks](https://www.memorybenchmark.net/) | Compare Memory Modules |
| [PassMark - Hard Drive Benchmarks](https://www.harddrivebenchmark.net/) | Compare HDD's / SSD's |
| [AirPrint](https://support.apple.com/en-us/HT201311) | List of Printers that support AirPrint |

### Networking

|    |     |
|:-- | :-- |
| [Port Forward](https://portforward.com/) | Repository of router port forwarding guides and ports for common software |
| [Router Passwords](https://www.routerpasswords.com/) | Repository of default router usernames/passwords and IP addresses |
| [SpeedTest](https://www.speedtest.net/) | Test internet connection download, upload, ping speeds |

### Security

|    |     |
|:-- | :-- |
| [Bitwarden Password Generator](https://bitwarden.com/password-generator/#password-generator) | Great password generator to create unique Passphrases<hr>_Type = Passphrase, Capitalize = Y, Include Number = Y, Word Separator = -, Length = 3_ |
| [Have I Been Pwned](https://haveibeenpwned.com/) ||

### Software

|    |     |
|:-- | :-- |
| [winstall](https://winstall.app/) | Make winget install scripts to batch install software |
| [Ninite](https://ninite.com/) | Make standalone batch software installers |
| [Adobe PDF Tools](https://www.adobe.com/au/acrobat/online.html) | Free to use PDF tools, use Incognito/Private mode to exceed free 'try' limits |
| [Photopea](https://www.photopea.com/) | Free Photoshop alternative that runs in the web browser |
| [PrintFriendly](https://www.printfriendly.com/) | Convert various file formats to PDF |
| [Watermark Remover](https://www.watermarkremover.io/) | AI watermark removing tool, use Incognito/Private mode to exceed free 'try' limits |
| [Monkeytype](https://monkeytype.com/) | Typing test website |
| [keybr](https://www.keybr.com/) | Typing practice website |

### Scripting / Coding

|    |     |
|:-- | :-- |
| [SS64.com](https://ss64.com/) | Quick reference from terminal shell commands, particularly helpful for CMD / Batch commands |

### Phonetic Alphabet

The NATO Phonetic Alphabet can be very useful when trying to provide remote support over the phone

<!-- REFERENCE: https://www.worldometers.info/languages/nato-phonetic-alphabet/ -->

|         |           |       |           |
| :--:    | :--:      | :--:  | :--:      |
| A       | Aplha     | N     | November  |
| B       | Bravo     | O     | Oscar     |
| C       | Charlie   | P     | Papa      |
| D       | Delta     | Q     | Quebec    |
| E       | Echo      | R     | Romeo     |
| F       | Foxtrot   | S     | Sierra    |
| G       | Golf      | T     | Tango     |
| H       | Hotel     | U     | Uniform   |
| I       | India     | V     | Victor    |
| J       | Juliett   | W     | Whiskey   |
| K       | Kilo      | X     | X-ray     |
| L       | Lima      | Y     | Yankee    |
| M       | Mike      | Z     | Zulu      |

