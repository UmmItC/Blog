---
author: "Arcsly"
title: "Dual GPU Passthrough Guided Part 8: Installing Windows 11 via Virtual TPM"
description: "Set up a Windows 11 virtual machine using QEMU/KVM and enable a virtual Trusted Platform Module (TPM) for successful installation, even on systems without native TPM support."
tags: ["QEMU/KVM", "GPU-Passthrough", "virt-manager", "win10"]
date: 2023-08-14T10:34:50+0800
thumbnail: https://www.howtogeek.com/wp-content/uploads/2021/06/windows_11_generic_hero_1.jpg?height=200p&trim=2,2,2,2
---

## Introduction

Windows 11 brings a fresh and modern interface to the Windows operating system, along with various new features and enhancements. However, installing Windows 11 on a virtual machine can be challenging, especially when dealing with the TPM 2.0 requirement. In this guide, we'll walk you through the process of installing Windows 11 on QEMU/KVM virtualization, complete with a virtual TPM solution, allowing you to enjoy Windows 11 on systems that lack TPM support.

## Before You Begin

Before you embark on the journey of installing Windows 11 on QEMU/KVM with a virtual TPM, it is crucial to ensure you have completed the essential steps outlined in our comprehensive guide: 

- **"Dual GPU Passthrough Guide - Part 1 to Part 6"**

This guide provides essential details on configuring your Linux system for virtualization, which will significantly enhance your Windows 11 installation experience.

### Links to each part of the guide:

- Here See Part 1 to Part 6:  [Tags gpu-passthrough](/en/tags/gpu-passthrough/)

By ensuring you've completed the necessary preparations outlined in our guide, you'll be well-equipped to successfully install Windows 11 on your QEMU/KVM setup with a virtual TPM.

## Step 1: Installing Required Packages

To begin, we need to install the necessary packages for setting up the virtual TPM. Open your terminal and execute the following command:

```bash
sudo pacman -S swtpm swtpm-tools
```

These packages will provide the components required to create a virtual TPM for Windows 11 installation.

## Step ...

i'm lazy...

![TLS tpm](/blog/linux/dual-gpu-passthrough/part8/tls-tpm.png)

## Conclusion

Congratulations! You've successfully installed Windows 11 on a QEMU/KVM virtual machine, complete with a virtual TPM, allowing you to bypass the native TPM requirement. This guide provides you with the essential steps to enjoy Windows 11's features within a virtualized environment, even on systems without TPM support. Explore Windows 11 and take advantage of its new capabilities, all within your Linux host system.

## Reference

- https://www.smoothnet.org/qemu-tpm/
- https://ivonblog.com/posts/qemu-kvm-secure-boot-tpm-20/