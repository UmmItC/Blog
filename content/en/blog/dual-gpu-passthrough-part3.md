---
author: "VBoo"
title: "Dual GPU Passthrough Guided Part 3 - Enable virtualization on your linux system"
description: "let enable virtualization on your linux system."
tags: ["QEMU/KVM", "GPU-Passthrough", "virt-manager"]
date: 2023-05-13T05:50:00+0800
thumbnail: https://images.unsplash.com/photo-1629654297299-c8506221ca97?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bGludXh8ZW58MHx8MHx8fDA%3D&w=1000&q=80
---

# 1. Edit bootloader config

Now, we need on your linux system change some config to enable the virtualization on your linux system.

depends on what bootloader you using, but basically is the same things with edit.

|     AMD CPU     |    Intel CPU    |
|---------------- | ----------------|
|   amd_iommu=on  |  intel_iommu=on |
| video=efifb:off |                 |

## 1.2 For GRUB user

edit `/etc/default/grub`, edit the line that starts with:  **GRUB_CMDLINE_LINUX_DEFAULT**
after edit grub, type the following command to rebuild the grub config, then reboot your system to apply the new changes.

```shell
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

## 1.3 For bootctl user

edit `/boot/loader/entries/your_config.conf` , edit the line starts with: options, then reboot your system to apply the new changes.

your result should like that:

```shell
title Arch linux
linux /vmlinuz-linux
initrd /initramfs-linux.img

options root=<root> quiet rw intel_iommu=on iommu=pt
```