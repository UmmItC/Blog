---
author: "Arcsly"
title: "Comprehensive Guide to Gentoo Linux: Installing XORG and XFCE with OpenRC"
description: "Gentoo Linux of installing XORG and XFCE with the OpenRC init system. Dive into the realm of open-source customization and create a powerful and tailored desktop environment on your Gentoo system."
tags: ["Open-RC", "Gentoo", "Linux", "XFCE", "XORG"]
date: 2023-09-20T16:40:21+0800
thumbnail: /blog/linux/Gentoo/Gentoo-xfce-xorg/neofetch.png
lastmod: 2023-09-20T13:27:10+0800
---

## Introduction

In our previous blog, we successfully installed Gentoo Linux and set up the system on our disk. However, at this point, our system lacks a graphical user interface (GUI), making it necessary to install a Desktop Environment (DE) to provide a more user-friendly experience. In this guide, we will walk you through the process of installing the XFCE DE on your Gentoo system using OpenRC as the init system.

### Why Choose XFCE?

XFCE is an excellent choice for those seeking a lightweight and efficient desktop environment. Unlike resource-intensive alternatives like GNOME or KDE, XFCE is incredibly light on system resources, requiring less than 200MB of RAM to run smoothly. Its minimalistic design and efficient performance make it ideal for older hardware or users who prefer a snappy and responsive desktop experience. Additionally, XFCE has shorter compilation times during the installation process, making it an attractive option for Gentoo users. Let's dive into the installation process and get XFCE up and running on your Gentoo Linux system.

## Step 1: Update Your System

Before diving into the XFCE installation, it's crucial to ensure that your Gentoo system is up to date with the latest package information. You can achieve this by running the following commands:

```bash
sudo emerge --sync
sudo emerge --ask --update --deep --newuse @world
```

These commands serve the purpose of synchronizing your Portage tree, updating all installed packages, and resolving any new dependencies that may have emerged since your last update.

## Step 2: Configure USE Flags

USE flags are an integral part of Gentoo's package management system, allowing you to specify the features and functionalities you want for your packages. To configure USE flags for XFCE, you'll need to edit the `make.conf` file:

```shell
nano /etc/portage/make.conf
```

Now, let's configure the USE flags:

### Enabling X Support

For XFCE to work with X, you need to enable X support in your USE flags. Add the following line to your `make.conf`:

```shell
USE="X"
```

This ensures that X support is enabled when you install XFCE.

### Configuring Input Devices

Next, specify the input devices you want to use. In this example, we'll use the "libinput" driver for keyboards and mice:

```shell
INPUT_DEVICES="libinput"
```

### Selecting Graphics Drivers

For graphics card support, set the "VIDEO_CARDS" variable to the appropriate driver. In this case, we're using the "qxl" driver:

```shell
VIDEO_CARDS="qxl"
```

These settings ensure that your Gentoo system is configured to work seamlessly with XFCE's graphical components and input devices.

## Step 3: Install X.Org Server

X.Org Server is the foundation of your graphical environment. To install it, execute the following command:

```bash
sudo emerge -av x11-base/xorg-server
```

This command installs the X.Org server along with any necessary graphics drivers, setting the stage for the XFCE installation.

By following these steps, you've configured your Gentoo system to support XFCE and have installed the essential X.Org Server components to enable the graphical interface. Now, let's proceed with the XFCE installation.

## Step 3: ...

Not finished yet

...

## Step 5: Configure XFCE

Create the `~/.xinitrc` file for your user:

```bash
echo "exec startxfce4" >> ~/.xinitrc
```

This file specifies the command to start XFCE when you launch X.

## Step 6: Start X

To start the XFCE desktop environment, use the `startx` command:

```bash
startx
```

You should now be greeted by the XFCE desktop!

![xfce](/blog/linux/Gentoo/Gentoo-xfce-xorg/xfce-start.png)