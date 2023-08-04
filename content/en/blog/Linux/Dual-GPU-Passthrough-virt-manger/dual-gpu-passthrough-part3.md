---
author: "Arcsly"
title: "Dual GPU Passthrough Guided Part 3 - Enable virtualization on your linux system"
description: "let enable virtualization on your linux system."
tags: ["QEMU/KVM", "GPU-Passthrough", "virt-manager"]
date: 2023-05-13T05:50:00+0800
thumbnail: https://images.unsplash.com/photo-1629654297299-c8506221ca97?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bGludXh8ZW58MHx8MHx8fDA%3D&w=1000&q=80
---

# 1. Edit Bootloader Configuration

To enable virtualization on your Linux system, you need to make certain configuration changes in your bootloader settings. The process is similar regardless of the bootloader you are using.

Here's a summary of the necessary changes based on your CPU type:

|     AMD CPU      |    Intel CPU     |
|----------------- | -----------------|
|   `amd_iommu=on` |  `intel_iommu=on` |
| `video=efifb:off`|     `iommu=pt`    |

By including these parameters in your bootloader configuration, you enable virtualization features on your system, which can enhance your ability to run virtual machines and perform other virtualization-related tasks.

---

## 1.2 For GRUB Users

If you are using GRUB as your bootloader, follow these steps:

1. Edit the GRUB configuration file located at `/etc/default/grub`.

2. Locate the line that starts with `GRUB_CMDLINE_LINUX_DEFAULT` and edit it according to your needs.

3. After making the edits to the GRUB configuration, rebuild the GRUB configuration using the following command:

```shell
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

4. Reboot your system to apply the new GRUB configuration changes.

By following these steps, you successfully modify your GRUB configuration to include the desired parameters, which can enhance your system's performance and functionality.

---

## 1.3 For bootctl Users

If you are using `bootctl` as your bootloader, follow these steps:

1. Edit your configuration file located at `/boot/loader/entries/your_config.conf`.

2. Locate the line that starts with `options` and edit it. For example, your original line might look like:

   ```shell
   options root=<root> quiet rw
   ```

3. Add the desired kernel parameters to the line. For instance, you might add `intel_iommu=on` and `iommu=pt`:

   ```shell
   options root=<root> quiet rw intel_iommu=on iommu=pt
   ```

4. Save the changes to the configuration file.

5. Reboot your system to apply the new configuration.

Your result should resemble the following:

```shell
title Arch Linux
linux /vmlinuz-linux
initrd /initramfs-linux.img

options root=<root> quiet rw intel_iommu=on iommu=pt
```

By following these steps, you effectively modify your bootloader configuration to include the specified kernel parameters, enhancing your system's functionality and performance.