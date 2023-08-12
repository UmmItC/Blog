---
author: "Arcsly"
title: "Dual GPU Passthrough Guided Part 3 - Empowering Virtualization on Your Linux System"
description: "Learn how to enable virtualization on your Linux system for a seamless dual GPU passthrough setup. Unlock the potential of virtualization and optimize your computing experience."
tags: ["QEMU/KVM", "GPU-Passthrough", "virt-manager"]
date: 2023-05-13T05:50:00+0800
thumbnail: https://images.unsplash.com/photo-1629654297299-c8506221ca97?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bGludXh8ZW58MHx8MHx8fDA%3D&w=1000&q=80
---

# 1. Edit Bootloader Configuration

Your journey into the world of dual GPU passthrough continues, and now we're delving into the realm of bootloader configuration. Fear not, for we're here to guide you through the process and shed light on the magic of virtualization.

To optimize your bootloader settings, let's customize them based on your CPU type:

|     AMD CPU      |    Intel CPU     |
|----------------- | -----------------|
|   `amd_iommu=on` |  `intel_iommu=on` |
| `video=efifb:off`|     `iommu=pt`    |
| `iommu=pt` |                                     |

Each of these parameters plays a pivotal role in enabling virtualization and enhancing your system's performance for virtual machines.

### Decoding the Commands

The added parameters hold the key to unlocking virtualization's potential. Let's decipher their magic:

- `amd_iommu=on` (AMD) / `intel_iommu=on` (Intel): These flags activate IOMMU support, which enables better hardware isolation and sharing for virtualization.

- `video=efifb:off`: This flag disables the EFI framebuffer driver, which can interfere with GPU passthrough.

- `iommu=pt`: This flag sets the IOMMU to use pass-through mode, ensuring efficient and direct access to hardware by VMs.

By including these parameters in your bootloader configuration, you enable virtualization features on your system, which can enhance your ability to run virtual machines and perform other virtualization-related tasks.

---

## 1.2 Unveiling GRUB's Secrets

For those who embrace the GRUB bootloader, here's your pathway to bootloader configuration mastery:

1. Open the GRUB configuration file located at `/etc/default/grub`.

2. Look for the line beginning with `GRUB_CMDLINE_LINUX_DEFAULT` and bring your customization skills to the fore.

3. After applying your modifications, regenerate the GRUB configuration by executing this command:

```shell
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

4. Welcome the excitement of rebooting your system, as it ushers in the new GRUB configuration.

Your careful steps ensure that your GRUB bootloader now houses the prescribed parameters, setting the stage for an optimized virtualization experience.

#### GRUB AMD User Example

For AMD CPU users, your modified GRUB configuration might look like:

```shell
GRUB_CMDLINE_LINUX_DEFAULT="quiet amd_iommu=on iommu=pt video=efifb:off"
```

#### GRUB Intel User Example

For Intel CPU users, your modified GRUB configuration might look like:

```shell
GRUB_CMDLINE_LINUX_DEFAULT="quiet intel_iommu=on iommu=pt"
```

---

## 1.3 Navigating bootctl's Path

For bootctl as bootloader:

1. Tailor your configuration file located at `/boot/loader/entries/your_config.conf`.

2. Identify the line commencing with `options` and give it a makeover. An original line might resemble:

   ```shell
   options root=<root> quiet rw
   ```

3. Elevate your configuration by adding the desired kernel parameters. For instance, if you're wielding an AMD CPU, your line might transform into:

   ```shell
   options root=<root> quiet rw amd_iommu=on iommu=pt video=efifb:off
   ```

4. Preserve your configuration changes.

5. Embrace the system reboot, which breathes life into your new configuration.

With these steps, your modified bootloader entry is primed for action:

```shell
title Arch Linux
linux /vmlinuz-linux
initrd /initramfs-linux.img

options root=<root> quiet rw amd_iommu=on iommu=pt video=efifb:off
```

#### bootctl Intel User Example

For Intel CPU users using `bootctl`, your modified configuration might resemble:

```shell
title Arch Linux
linux /vmlinuz-linux
initrd /initramfs-linux.img

options root=<root> quiet rw intel_iommu=on iommu=pt
```

Your bootloader configuration is now an instrument of virtualization magic. With carefully crafted parameters, it stands ready to unleash the full potential of your dual GPU passthrough setup.