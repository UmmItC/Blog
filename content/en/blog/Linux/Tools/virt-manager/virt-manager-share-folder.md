---
author: "Arcsly"
title: "Enabling Folder Sharing Between Host and Virtual Machine in Virt-Manager"
description: "Learn how to effortlessly share files between your host and virtual machine using Virt-Manager, a comprehensive guide for seamless folder sharing in your virtualized environment."
tags: ["virt-manager", "QEMU/KVM", "Folder Sharing"]
date: 2023-09-28T20:31:10+0800
thumbnail: /blog/linux/linux-tools/virt-manager/virt-manager-folder-share/create-1.png
---

## Introduction

Sharing files between your host and guest virtual machines can be a common requirement. While there are various methods like using LAN-based solutions such as KDE Connect or Localsend, these often require installing additional software on both sides. However, virt-manager offers an in-built feature that allows you to sync files between the host and guest machines directly offline and set up a shared folder effortlessly. In this guide, we will walk you through the steps to achieve this.

### Prerequisites

Before proceeding, you should already have a virtual machine set up. This guide will not cover the process of creating a virtual machine.

## Step 1: Adding Filesystem Hardware

1. Open the settings for your target virtual machine.
2. Inside the settings, select "Add new Hardware."
3. Choose "Filesystem" as the hardware type; this is what we will use for file sharing.
4. Configure the following options:
    - `Driver`: Select "virtio-9p."
    - `Source path`: Choose the directory containing the files you want to share.
    - `Target path`: This is the mount point you can name as you prefer. you also need to enter this name in vm.
5. Once you've configured these settings, click "Finish" to add the new hardware.

![example](/blog/linux/linux-tools/virt-manager/virt-manager-folder-share/example.png)

## Step 2: Creating a Shared Directory in Your Virtual Machine

Before you can access shared files in your virtual machine, you need to create a directory to serve as the mount point. Here's how to do it:

1. Boot up your virtual machine.
2. Open a terminal in your virtual machine.
3. Create a directory called "shared" (you can choose a different name if you prefer):

```shell
mkdir shared
```

## Step 3: Mounting the Shared Folder

With the shared directory created in your virtual machine, you can now mount the shared folder using the following command:

```shell
sudo mount -t 9p -o trans=virtio /sharedata shared
```

This command mounts the specified mount point `/sharedata` to the share directory named `shared` within your virtual machine. The `-t 9p` option indicates that it's a virtio-9p filesystem.

## Optional: Auto-Mount on System Boot

If you anticipate needing to mount this folder regularly, automating the process can save you time. Here's how to set it up:

### Editing Your fstab

In Linux, mounting configurations are managed through the `fstab` file. Edit this file with your preferred text editor; in this example, we'll use Vim:

```shell
sudo vim /etc/fstab
```

Add the following line to auto-mount the shared folder:

```shell
/sharedata          /home/<username>/shared     9p      trans=virtio,version=9p2000.L,rw        0 0
```

and Now Save the file and exit Vim using `:wq`.

### Testing Auto-Mount

Now, reboot your system, and you should see the `/sharedata` folder automatically mounted on your system.

This revised version includes the step to create a shared directory in the virtual machine, ensuring a complete and detailed guide for file sharing.

## References

- [QEMU/KVM - Virt-Manager | Folder sharing and USB Redirection](https://onion.tube/watch?v=crDuKm6XNv4)
- [Virt-Manager Tips and Tricks from a VM Junkie](https://onion.tube/watch?v=9FBhcOnCxM8)