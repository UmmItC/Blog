---
author: "Arcsly"
title: "Installing Flatpak on Your Linux System: One Universal Platform for Apps and a Secure, Cross-Distro Sandbox"
description: "Flatpak, a universal platform for Linux applications, and benefit from a secure, cross-distribution sandboxed environment. Simplify software management and ensure compatibility of popular applications on your Linux system."
tags: ["Flatpak", "Linux"]
date: 2023-09-16T11:39:50+0800
thumbnail: /blog/linux/linux-tools/flatpak/flatpak-software.png
---

## Introduction

Linux users appreciate having access to a wide variety of applications. However, the process of managing and installing software across different Linux distributions can sometimes be a challenge. Enter Flatpak, a universal package manager designed to simplify software distribution on Linux. In this blog post, we'll guide you through the installation process for Flatpak, catering to various Linux distributions.

### What is Flatpak?

Flatpak is a software which maintain by gnome and are utility for Linux that allows developers to package applications and their dependencies into a single package, known as a "Flatpak." This package can then be distributed and run on different Linux distributions without the need for modification, making it a versatile solution for software distribution.

in addition, Flatpak packages are sandboxed. The primary goal of Flatpak is to provide a secure and isolated environment for applications. Each Flatpak application runs in its own sandboxed environment, which restricts its access to system resources and ensures that it cannot interfere with other applications or the system itself.

## Installing Flatpak on Different Linux Distributions

**1. **Arch Linux (GNOME Users)**

For Arch Linux GNOME users Flatpak is included by default in the GNOME Software application. Simply open the GNOME Software Center, search for the application you want to install, and click the "Install" button. GNOME Software will handle the installation of the Flatpak package for you.

**2. **Other Distributions**

For users of other Linux distributions, you may need to install Flatpak manually. Here's how to do it for some popular distributions:

- **Debian/Ubuntu**:

  ```bash
  sudo apt update
  sudo apt install flatpak
  ```

- **Fedora**:

  ```bash
  sudo dnf install flatpak
  ```

- **openSUSE**:

  ```bash
  sudo zypper install flatpak
  ```

- **Solus**:

  ```bash
  sudo eopkg install flatpak
  ```

- **Mageia**:

  ```bash
  sudo dnf install flatpak
  ```

- **CentOS**:

  ```bash
  sudo yum install flatpak
  ```

- **Void Linux**:

  ```bash
  sudo xbps-install -S flatpak
  ```

**3. **Additional Steps**

After installing Flatpak, you'll need to add the Flathub repository, which hosts a wide range of Flatpak applications:

```bash
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

Once you've added the Flathub repository, you can search for and install Flatpak applications using the `flatpak install` command, followed by the application name.

## Which Software?

Many popular software, including Discord and Steam, are available as Flatpak packages, making them easily accessible to a wide range of users. I highly recommend using Flatpak for installation over the original package manager because it resolves several issues.

These applications sometimes don't prioritize Linux compatibility, leading to potential problems when using the original package manager. Users may encounter issues like the software not opening or experiencing a black screen.

Flatpak, being inherently cross-distro, significantly reduces these problems, ensuring a smoother experience for Linux users.

### Sandbox Based

Additionally, it's important to note that Flatpak incorporates sandboxing by default, ensuring a higher level of security when running programs. This built-in sandboxing feature enhances the safety and reliability of the software you install through Flatpak.

### Conclusion

Flatpak simplifies the process of installing and managing software on Linux by providing a universal platform for application distribution. Whether you're an Arch Linux GNOME user who can enjoy its integration with GNOME Software or using any other Linux distribution, you can easily install and use Flatpak to access a wide range of applications.

With Flatpak and the Flathub repository, you'll have access to a growing ecosystem of Linux applications, ensuring that you can enjoy the software you need on your Linux system, regardless of your distribution.