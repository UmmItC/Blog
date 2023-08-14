---
author: "Arcsly"
title: "Dual GPU Passthrough Guided : Installing Different Operating Systems Requirements"
description: "Set up QEMU/KVM virtualization and install Windows 10, Windows 11,  macOS and Linux. Explore the distinct requirements for each OS."
tags: ["QEMU/KVM", "GPU-Passthrough", "virt-manager"]
date: 2023-08-14T11:14:02+0800
thumbnail: https://hddmag.com/wp-content/uploads/2017/07/Linux-vs-Windows-vs-Mac-1068x480.jpg
---

## Introduction
Provide an overview of the versatility of QEMU/KVM virtualization and its applications for running various operating systems on a single machine.

## Prerequisites
List the general prerequisites for setting up QEMU/KVM, such as hardware and software requirements.

### Windows 10 on QEMU/KVM
Provide a brief introduction and guide users to an external guide for detailed instructions on installing Windows 10 on QEMU/KVM.

Follow this guide: [Dual GPU Passthrough Guided Part 7: Installing Windows and Enabling Full Passthrough](/en/blog/linux/dual-gpu-passthrough-virt-manger/dual-gpu-passthrough-part7)

###  Windows 11 on QEMU/KVM
Introduce the process of installing Windows 11 on QEMU/KVM and direct users to a specific guide for step-by-step instructions.

Follow this guide: [Dual GPU Passthrough Guided Part 8: Installing Windows 11 via Virtual TPM](/en/blog/linux/dual-gpu-passthrough-virt-manger/dual-gpu-passthrough-part8/)

### Linux on QEMU/KVM (UEFI Only)

Explain the straightforward process of installing Linux on QEMU/KVM, focusing on the UEFI-based installation method.

>Note:  only Make sure to use a UEFI-compatible ISO for the installation.

### macOS on QEMU/KVM (Using OSX-KVM)
Provide a brief overview of using the OSX-KVM project to install macOS on QEMU/KVM.

Follow the official OSX-KVM documentation for detailed instructions: [OSX-KVM](https://github.com/kholia/OSX-KVM)

## Comparing the Installations
Summarize the key differences and specific requirements for each operating system's installation on QEMU/KVM. Highlight hardware compatibility, installation methods, and important settings.


## Conclusion
Summarize the unique aspects and considerations of installing different operating systems on QEMU/KVM. Emphasize the flexibility and benefits of using virtualization to run a variety of OSes.