---
author: "Arcsly"
title: "Comprehensive Guide to Gentoo Linux: Installing XORG, XFCE and LightDM with OpenRC"
description: "Gentoo Linux of installing XORG, XFCE and LightDM with the OpenRC init system. Dive into the realm of open-source customization and create a powerful and tailored desktop environment on your Gentoo system."
tags: ["Open-RC", "Gentoo", "Linux", "XFCE", "XORG"]
date: 2023-09-20T16:40:21+0800
thumbnail: /blog/linux/Gentoo/Gentoo-xfce-xorg-lightdm/Gentoo-xfce-start.png
lastmod: 2023-09-23T21:30:50+0800
---

## Introduction

In our previous blog, we successfully installed Gentoo Linux and set up the system on our disk. However, at this point, our system lacks a graphical user interface (GUI), making it necessary to install a Desktop Environment (DE) to provide a more user-friendly experience. In this guide, we will walk you through the process of installing the XFCE DE on your Gentoo system using OpenRC as the init system.

### Why Choose XFCE?

XFCE is an excellent choice for those seeking a lightweight and efficient desktop environment. Unlike resource-intensive alternatives like GNOME or KDE, XFCE is incredibly light on system resources, requiring less than 200MB of RAM to run smoothly. Its minimalistic design and efficient performance make it ideal for older hardware or users who prefer a snappy and responsive desktop experience. Additionally, XFCE has shorter compilation times during the installation process, making it an attractive option for Gentoo users. Let's dive into the installation process and get XFCE up and running on your Gentoo Linux system.

## Step 0: Update Your System

Before diving into the XFCE installation, it's crucial to ensure that your Gentoo system is up to date with the latest package information. You can achieve this by running the following commands:

```bash
sudo emerge --sync
sudo emerge --ask --update --deep --newuse @world
```

### Step 1: Adjust Your `make.conf`

Gentoo's strength lies in its USE flags, which allow us to fine-tune package compilation to meet our specific requirements. To get XFCE up and running, we need to enable specific USE flags.

```shell
nano /etc/portage/make.conf
```

Add the following lines to your `make.conf`:

```shell
USE="X elogind dbus"
INPUT_DEVICES="libinput"
VIDEO_CARDS="qxl"
```

These flags enable X support, integrate elogind for session management, and set up D-Bus communication. They also configure input devices to use libinput and specify video cards to support QXL.

### Step 2: Configure elogind to Start on Boot

Elogind is essential for session management in XFCE. Ensure that it starts automatically during boot:

```shell
rc-update add elogind boot
```

### Step 3: Ensuring Graphics Driver Compatibility

Before we dive into the XFCE installation, it's vital to confirm that our system has the requisite graphics drivers in place. This step helps us avoid potential issues and ensures a smooth XFCE installation.

Run the following command to perform a dry run and simulate the installation of essential graphics drivers:

```shell
emerge --pretend --verbose --ask x11-base/xorg-drivers
```

>Tips: This command meticulously checks and confirms that we have the necessary graphics drivers ready to support XFCE. Ensuring the compatibility of these drivers is paramount to a successful XFCE setup.

Now, let's proceed confidently, knowing that our system is well-prepared for the XFCE installation journey.

### Step 4: Declutter for a Pristine System

A well-maintained system is a happy system. It's time to declutter your Gentoo environment and bid farewell to any unnecessary packages. This not only keeps your system running smoothly but also frees up precious space. 

Let's get started with the cleanup:

```shell
emerge --ask --depclean --verbose
```

> **Tips:** While this step might not always be mandatory, it's a good practice to keep your system tidy and avoid any potential errors down the road. Plus, who doesn't love a clean and efficient system? 😉🌟

### Step 5: Fine-Tune Poppler Settings

To ensure compatibility and prevent conflicts, we'll instruct the Poppler library not to use Qt5:

```shell
echo "app-text/poppler -qt5" > /etc/portage/package.use/poppler
```

### Step 6: Manual Configuration for libdbusmenu

In some cases, manual configuration is necessary, and libdbusmenu is no exception. Let's ensure libdbusmenu is properly set up:

Please note that over time, the required version may change. (At this time is `v16.09.0-r2`)If you encounter any issues, run the installation command once, and the terminal will provide prompts with the necessary commands to echo. Simply follow the prompts to resolve any version-related discrepancies.

Run the following command to set up libdbusmenu with the appropriate configuration:

```shell
echo ">=dev-libs/libdbusmenu-16.04.0-r2 gtk3" > /etc/portage/package.use/libdbusmenu
```

With these steps complete, your Gentoo system is now primed and ready to welcome the XFCE desktop environment.

## Gentoo: Installing XFCE

Now comes the exciting part—installing XFCE, XORG and LightDM on your Gentoo system.

### Step 7: Installing XFCE

Execute the following command to install XFCE:

```shell
emerge --ask --verbose xfce-base/xfce4-meta
```

This command installs the XFCE meta-package, which includes all the core components of the XFCE desktop environment. It ensures that you have a complete XFCE experience with all the necessary applications and utilities.

### Step 8: Don't Forget the Terminal

In the world of Linux, the terminal is your trusty companion, your guiding star through the vast universe of commands and tasks. Just like having hands and feet, you can't navigate Linux comfortably without it. So, let's make sure you have your terminal ready for action!

>Just skip this part, no need to be installed, xfce4-meta is already included.

```shell
emerge --ask --verbose x11-terms/xfce4-terminal
```

### Step 9: Configuring Your XFCE Session

Before we dive into your XFCE desktop, let's ensure that your system knows how to start it. We'll create a command to initiate XFCE.

```shell
echo "exec startxfce4" > ~/.xinitrc
```

Alternatively, if you prefer a quicker way, you can directly enter this command:

```shell
exec startxfce4
```

With this configuration in place, you're all set to experience the XFCE desktop environment. Simply execute the command, and you'll be greeted by the XFCE screen on your system. Enjoy the XFCE experience tailored to your liking!

#### Testing Launching XFCE

With everything set up and ready, it's time to test your Configuring XFCE on your Gentoo system. When you log in to your user account, simply type the following command to start your XFCE session:

```shell
startx
```

And there you have it—your Gentoo system has DE installed (As shown in the image below):

![Started XFCE](/blog/linux/Gentoo/Gentoo-xfce-xorg-lightdm/Gentoo-xfce-start.png)

## Step 10: Creating a Normal User

Before we proceed with the installation of LightDM for XFCE, it's essential to create a dedicated normal user. By default, LightDM does not permit root user login, so having a normal user is necessary. Additionally, it's not recommended to perform everyday tasks as the root user for security reasons. Here's a quick guide on creating a normal user:

```shell
# Create a new user with necessary group memberships and set the shell to /bin/bash
useradd -m -G users,wheel,audio -s /bin/bash <username>
```

- `useradd -m -G users,wheel,audio -s /bin/bash <username>`: This command creates a new user account with the specified `<username>` and assigns it to essential groups, including "users," "wheel," and "audio." The `-m` flag ensures a home directory is created for the user, and the `-s /bin/bash` flag sets the user's default shell to `/bin/bash`.

Next, set the user's password:

```shell
passwd <username>
```


## Step 11: Installing LightDM Display Manager

If you've noticed that some essential functions, such as power off or logout, are not working in your XFCE environment, it's likely due to the absence of a Display Manager. For XFCE, LightDM is a highly recommended Display Manager. Follow these steps to install it:

```shell
emerge --ask x11-misc/lightdm
```

### Step 12: Edit the `display-manager` File

Now, let's configure LightDM as the default Display Manager. Open the `display-manager` file and check its content. set the value to `lightdm`:

```shell
nano /etc/conf.d/display-manager
```

The file should look like this:

```shell
DISPLAYMANAGER="lightdm"
```

### Step 13: Start LightDM on Boot

To ensure LightDM starts automatically with your system, add both `dbus` and `display-manager` to the default runlevel. The `dbus` service is essential as LightDM depends on it for passing messages:

```shell
rc-update add dbus default
rc-update add display-manager default
```

### Step 14: Start LightDM

It's time to start LightDM:

```shell
rc-service dbus start
rc-service display-manager start
```

Once LightDM is successfully started, your system should look similar to the image below:

![lightdm](/blog/linux/Gentoo/Gentoo-xfce-xorg-lightdm/LightDM-start.png)

## Accessing Terminal in TTY Mode

In some cases, you might encounter issues logging into your desktop session or accessing the terminal from within the desktop environment. Here's a quick workaround to access the terminal using TTY (Teletype) mode:

1. Press the following key combination to access TTY mode:

   ```shell
   Ctrl + Alt + F1
   ```

   This key combination will take you to the first virtual terminal (TTY1).

2. In the TTY1 terminal, you can create your user account if needed or perform other tasks as necessary. To create a user account, you can follow the steps mentioned in a previous section.

3. Once you've completed your tasks in TTY1, you can return to your desktop environment by pressing the following key combination:

   ```shell
   logout
   ```

   or

   ```shell
   exit
   ```

   This will take you back to your graphical desktop session.

Using TTY mode provides an alternative way to access your system and perform tasks when you encounter issues within your desktop environment.


## What Comes After?

Congratulations! You've successfully set up your Gentoo system and are now equipped with a powerful foundation for your Linux journey. However, this isn't the end; it's just the beginning.

For a detailed guide on these post-installation steps, check out [this link](/en/blog/linux/gentoo/gentoo-post-installation/) to take your Gentoo experience to the next level.


## References

- [Gentoo: Xorg/Guide](https://wiki.gentoo.org/wiki/Xorg/Guide)
- [Gentoo: Xfce](https://wiki.gentoo.org/wiki/Xfce)
- [Gentoo: Firefox](https://wiki.gentoo.org/wiki/Firefox)