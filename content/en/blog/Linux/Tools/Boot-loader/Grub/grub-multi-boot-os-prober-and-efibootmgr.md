---
author: "Arcsly"
title: "Grub and os-prober: Creating a Multi-OS Boot Menu"
description: "Learn how to set up a multi-OS boot menu using Grub and os-prober, ensuring hassle-free switching between different operating systems on your computer."
tags: ["grub", "Linux", "Multi-Boot", "efibootmgr", "os-prober"]
date: 2023-09-23T17:32:55+0800
thumbnail: https://averagelinuxuser.com/assets/images/posts/2017-08-02-dual-boot-arch-linux-with-another-linux/grub_multiboot.jpeg
---

## Introduction

For those of us who have ventured into the world of dual-boot systems, we know that it can be both a blessing and a headache. While I've personally transitioned to GPU passthrough for a smoother multi-system experience, dual-booting remains a practical option for many. In this article, I'll guide you through setting up a multi-OS boot menu using Grub and os-prober.

### Why? (Fuck Windows)

Windows updates have a knack for causing trouble, especially when it comes to your boot-loader. They can mess up your Grub configuration, leaving you without the familiar boot menu to choose your operating system. In such cases, you'd have to manually access the boot menu to select the system you want to run.

Windows tends to be the culprit here, often disrupting your boot loader, preventing Grub from automatically appearing.

A piece of advice for those planning to install both Windows and Linux: it's generally smoother to install Windows first and then allocate disk space for Linux. If you install Linux first and then add Windows later, you'll likely need to reconfigure your Linux boot-loader because, more often than not, Windows will disrupt it.

## Getting Prepared

Before we dive into configuring Grub and os-prober, you should already have both Linux and your other operating system (be it Debian, Arch, or Windows) installed. What you're missing is the boot loader for both systems.

### Step 1: Install GRUB

Let's start by installing Grub on your system with this command:

```shell
sudo pacman -S grub
```

### Step 2: Do You Need efibootmgr?

Whether you need to install efibootmgr depends on whether your system uses UEFI. Here's when you'd want to install it:

- Your system is UEFI-based.
- You're setting up a dual-boot configuration or managing UEFI boot entries for multiple operating systems.

If these conditions apply to your system, use this command to install efibootmgr:

```shell
sudo pacman -S efibootmgr
```

### Step 3: Install os-prober

To proceed, you need to detect if there are multiple systems on your device. Use the following command to install os-prober:

```shell
sudo pacman -S os-prober
```

### Step 4: Edit Grub Config File

Now that you've detected the presence of multiple systems, it's time to enable Grub to recognize them. By default, Grub doesn't do this, but you can change that. Use the following command to add a line to your Grub settings:

```shell
echo 'GRUB_DISABLE_OS_PROBER=false' >> /etc/default/grub
```

#### Explanation

What does this line do? Normally, Grub doesn't automatically detect if you have multiple systems. But by adding `GRUB_DISABLE_OS_PROBER=false`, you enable Grub to do just that.

>This step is crucial for adding dual-boot options to your menu.

### Final Step: Adding Boot Options to the Menu

Identify your boot path using the `lsblk` command. For example, if your boot path is `/boot/efi`, use the following command:

```shell
sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi
```

Next, regenerate the configuration with this command:

```shell
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

### Finished!

After completing these steps, reboot your system. You should now see a list of other distributions or operating systems on your Grub menu. Enjoy the convenience of a multi-OS boot menu!

## References

- [Adding Other Operating Systems to the GRUB Bootloader](https://www.baeldung.com/linux/grub-bootloader-add-new-os)