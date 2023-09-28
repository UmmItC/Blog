---
author: "Arcsly"
title: "Virt-Manager QEMU/KVM: Redirect Your USB Devices Without USB Passthrough"
description: "Discover how to seamlessly redirect USB devices to your virtual machines in Virt-Manager with QEMU/KVM, without the need for USB passthrough. Enhance your virtual machine experience today!"
tags: ["virt-manager", "QEMU/KVM", "Redirect USB Device"]
date: 2023-09-28T21:32:50+0800
thumbnail: /blog/linux/linux-tools/virt-manager/virt-manger-usb-redirect/profile.png
---

## Introduction

If you've ever used Virt-Manager with QEMU/KVM to manage your virtual machines, you might have wondered how to seamlessly redirect your USB devices without the need for USB passthrough. This feature can be incredibly convenient, especially if you frequently need to connect and disconnect USB devices from your virtual machines.

### Moronic approach

In the early days of using Virt-Manager, I used to keep my USB devices connected to the host machine for an extended period, thinking that they had to remain plugged in for the virtual machine to access them. However, this approach had its drawbacks. When I no longer needed the USB device on the host and decided to unplug it, I encountered an issue. If I started the virtual machine without the USB device connected, it would throw an error, as the VM expected the USB device to be available.

This situation was far from ideal. I wanted the flexibility to use USB devices with my virtual machines just as I would with a physical machine, plugging them in when needed and disconnecting them when done. Luckily, Virt-Manager offers a built-in solution for this exact scenario. Here's how you can easily redirect your USB devices without USB passthrough:

## Step 1: Open Your Virtual Machine

First, launch your virtual machine in Virt-Manager as you normally would.

![open-virt-manager](/blog/linux/linux-tools/virt-manager/virt-manger-usb-redirect/open-virt-manager.png)

## Step 2: Access VM Settings

In the top menu bar, click on "Virtual Machine." A dropdown menu will appear. Then select “Redirect USB Device.” This action will prompt a new window to appear, listing all the USB devices connected to your host machine.

![USB](/blog/linux/linux-tools/virt-manager/virt-manger-usb-redirect/open-menu-2.png)

## Step 4: Select USB Devices

Now, you'll see a list of available USB devices. Each device will have a checkbox next to it. Simply click on the checkbox next to the USB device you want to redirect into your virtual machine.

![USB](/blog/linux/linux-tools/virt-manager/virt-manger-usb-redirect/select.png)

## Step 5: Apply and Use

Once you've selected the desired USB device(s), click the "Apply" or "OK" button in the window. Virt-Manager will now redirect the chosen USB device(s) to your virtual machine.

### Is USB Working?

This function is effective immediately, you can enter `lsblk` command to check whether it has been effective or not.

![lsusb](/blog/linux/linux-tools/virt-manager/virt-manger-usb-redirect/lsusb.png)

## Conclusion

That's it! You've successfully redirected your USB device(s) to your virtual machine without the need for USB passthrough. This method allows you to use your USB devices dynamically, just as if you were working on a physical machine. No more leaving USB devices connected when they're not needed – simply plug them in when you require them for your virtual environment. This straightforward process enhances your virtual machine experience, making it more flexible and user-friendly.

## Reference

- [Virt-Manager Tips and Tricks from a VM Junkie](https://onion.tube/watch?v=9FBhcOnCxM8)