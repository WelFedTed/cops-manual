---
title: Sideload Apps
updated: 2025-09-03
tags:
  - procedures
  - android
  - sideload
  - apps
  - sideloading
  - install
  - apk
  - xapk
---
%% TODO: flesh this out %%
# Download

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

# Upload

- Connect the Android device to a computer
- Navigate to it's mounted file system _(i.e. in `This PC`)_
- Open `Downloads` folder
- Copy `.APK` file in to the `Downloads` folder

# Install

- Enable Sideloading\
  _Depending on the manufacturer of the device, you may need to enable Sideloading before you can install .APK files_\
  [Samsung](https://www.samsung.com/ae/support/mobile-devices/how-to-enable-permission-to-install-apps-from-unknown-source-on-my-samsung-phone/ "How to enable sideloading on Samsung devices")
- Open `Files` app
- Navigate to `Downloads` folder
- Tap on the `.APK` file
- Tap `Install`