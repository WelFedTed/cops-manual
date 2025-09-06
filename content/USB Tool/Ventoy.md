---
title: Ventoy
updated: 2025-09-07
tags:
  - usb
  - tools
  - ventoy
  - bootable
  - medicat
---
[Ventoy](https://www.ventoy.net/en/index.html) is an open source tool to create bootable USB drive for multiple ISO/WIM/IMG/VHD(x)/EFI files.

# Install
Though our USB Tool will rely on Ventoy, we don't install it directly, as the Medicat installer will install Ventoy for us.

# Update
After you've got Medicat installed on your USB Tool, you can now update Ventoy on your USB Tool directly.\
[How to update Ventoy](https://www.ventoy.net/en/doc_start.html)

# Secure Bot
When booting in to your USB Tool on a device with Secure Boot enabled, you may need to enroll your device (Key or Hash) before you're able to boot from it.\
[How to enroll Ventoy for Secure Boot](https://www.ventoy.net/en/doc_secure.html)

If you're unable to enroll your USB Tool's Ventoy Key or Hash, then simply disable Secure Boot in the BIOS, boot from your USB Tool, and then re-enable Secure Boot when you're done.

# Files
You copy your bootable images (ISO, IMG, WIM, etc..) to the main partition on the USB Tool and Ventoy will be able to find and load them.\
But avoid using `spaces` or 'white space' in the filenames of bootable images, as this may prevent them from showing up when booting in to Ventoy/Medicat.

i.e. use `windows_10_home.wim` or `minitool_partition-wizard.iso`\
instead of `Windows 10 Home.wim` or `MiniTool Parition Wizard.iso`

Also avoid `spaces` or 'white space' in folder names.

# MBR vs GPT

%% REFERENCE: ventoy.net/en/doc_mbr_vs_gpt.html %%

Ventoy supports both MBR and GPT partition tables and will work fine with either, but some BIOS's / UEFI's work better with MBR or GPT.\
In general GPT works better with UEFI systems and MBR works better with BIOS systems.\
As most systems are UEFI these days, we will typically want our USB Tools to be GPT for the best compatibility with modern systems.

| |MBR|GPT|
|---|---|---|
|Legacy BIOS Support|![](https://www.ventoy.net/static/img/star/5.png)|![](https://www.ventoy.net/static/img/star/3.png)|
|UEFI Support|![](https://www.ventoy.net/static/img/star/4.png)|![](https://www.ventoy.net/static/img/star/5.png)|
|Disk 2TB+ Support|![](https://www.ventoy.net/static/img/cross.png)|![](https://www.ventoy.net/static/img/right.png)|
|Nondestructive Upgrade|![](https://www.ventoy.net/static/img/right.png)|![](https://www.ventoy.net/static/img/right.png)|
|Reserved Space Support|![](https://www.ventoy.net/static/img/right.png)|![](https://www.ventoy.net/static/img/right.png)|
|Max Partition Number|4|128|
