---
title: Hardware
updated: 2025-09-07
tags:
  - usb
  - tools
  - bootable
  - write
  - blocker
  - ssd
---
Ventoy, Medicat, and the other tools we use can be loaded on to any USB drive, but it's strongly recommended you use a device with a [Write-Blocker](https://en.wikipedia.org/wiki/Forensic_disk_controller) to avoid systems altering the data on your drive.\
Essentially a Write-Blocker makes your drive READ-ONLY when connected to a device, this prevents infected machines from infecting your USB Tool and prevents healthy machine's security software from removing any files/software from your USB Tool.\
(Some of the utilities we use as technicians show up as false positives in antivirus/security software, such as Nirsoft's ProduKey)

# Recommended SSD Enclosure

[ICY BOX IB-1817MCT-C31](https://icybox.de/product/externe_speicherloesungen/IB-1817MCT-C31)\
This is a tool-less USB-C to M.2 SSD enclosure that supports both NVMe + SATA, with an inbuilt Write-Blocker switch.\
It supports fast transfer speeds and comes with a USB-C to USB-C cable with an attached USB-C to USB-A adapter.

It's usually available for purchase [Amazon](https://www.amazon.com.au/dp/B09KH2V88T?ref_=ppx_hzsearch_conn_dt_b_fed_asin_title_4)

> [!tip] Pro Tip
> If you use this (or a similar) enclosure, add a [SIM Card Ejector Tool](https://m.media-amazon.com/images/I/41q0iNOoQ8L.jpg) to its cable for quick and easy access to change the Write-Blocker switch position.\
> You can attach this with the velcro cable tie that the enclosure comes with or a small zip tie.

# Alternative

Use a fast SD Card with a READ-ONLY switch and a USB 3.0+ card reader.
![SD Card Lock / Unlock READ-ONLY switch](https://www.stellarinfo.com/blog/wp-content/uploads/2023/12/SD-Card-Read-Unread.jpg)\
You could also use a microSD Card with a microSD to SD Card adapter that has its own READ-ONLY switch.

[Guide to speed classes for SD and microSD Cards](https://www.kingston.com/en/blog/personal-storage/memory-card-speed-classes)