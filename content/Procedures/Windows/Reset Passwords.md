---
title: Reset Passwords
updated:
tags:
  - procedures
  - windows
  - reset
  - passwords
  - account
  - user
  - login
---
# Method 1: Tools

%% TODO: Flesh out  steps  %%
    
## Medicat
- Boot in to `Medicat`
- Select `Password Tools`
- Select `Jayroy's Lockpick` *( folder )*
- Select `Jayroy's Lockpick` *( image )*
- Select `Normal` *( boot mode )*
- Select `PC Unlocker` from tool list

## PC Unlocker
- Boot in to `PC Unlocker`
- Select SAM registry file from the target Windows drive if its not automatically selected\
  `C:\Windows\System32\config\SAM`\
  *( if you can not browse the target drive, then it may have BitLocker enabled )*
- Select the target User Account
- Click `Reset`
- Leave password fields blank and click `OK`\
  *( leaving these fields blank will remove the password from the account entirely )*

# Method 2: Manual

%% TODO: Verify + flesh out  steps %%
%% REFERENCE: https://4sysops.com/archives/reset-a-windows-10-password/ %%

## Exploit Utilman.exe

- Hold `Shift` key + click `Restart`\
  *Continue to hold shift until the screen goes black*\
  Windows should reboot in to the `Recovery Environment`
- Click `Troubleshoot`
- Click `Advanced`
- Click `Command Prompt`
- Navigate to the System32 directory\
  `cd c:\windows\system32`\
  _Depending on the number logical volumes the computer has connected at the time, the volume that contains the Windows directory may be mounted to a different drive letter, but it's usually mounted as C:_\
  <details>
    <summary>How to find the correct drive letter that contains the Windows directory</summary>
    If `C:` does not contain the `Windows` directory, then you can repeat the following steps with different letters to locate which drive does:\
    - Run `D:`
    - Run `dir`
    - Check the output of `dir` for both the `Users` and `Windows` directories
  </details>
  - Backup Utility Manager\
    `copy utilman.exe utilman.exe.bak`
  - Replace Utility Manager with Command Prompt\
    `copy cmd.exe utilman.exe`
  - Reboot\
    `wpeutil reboot`

## Create Temporary Local Admin Account

- Click the `Utility Manager` icon\
  _Command Prompt should now open instead of the Utility Manager_
- Enter the following commands:\
  `net user temp /add`\
  `net localgroup administrators temp /add`\
  `exit`

## Reset User Password

- Sign in to the new `temp` user account\
  _If you don't see the `temp` user account, restart Windows and check again_
- Run `netplwiz`
- Select the target user account
- Click `Reset Password`
- Enter new password or leave empty for no password
- Click `OK`
- Sign Out

## Remove Temporary Local Admin Account

- Sign in to an admin user account\
  _not the temp user account_
- Run `netplwiz`
- Select the `temp` user account
- Click `Remove`
- Click `Yes`
- Click `OK`

## Restore Utilman.exe

- Hold `Shift` key + click `Restart`\
  _Continue to hold shift until the screen goes black_\
  Windows should reboot in to the `Recovery Environment`
- Click `Troubleshoot`
- Click `Advanced`
- Click `Command Prompt`
- Navigate to the System32 directory\
  `cd c:\windows\system32`\
  _Depending on the number logical volumes the computer has connected at the time, the volume that contains the Windows directory may be mounted to a different drive letter, but it's usually mounted as C:_
> [!question]- How to find the correct drive letter that contains the Windows directory
> If `C:` does not contain the `Windows` directory, then you can repeat the following steps with different letters to locate which drive does:
>- Run the following commands
>  ```batch
>  D:
>  dir
>  ```
>- Check the output of `dir` for both the `Users` and `Windows` directories
- Restore Utility Manager\
    `copy utilman.exe.bak utilman.exe`