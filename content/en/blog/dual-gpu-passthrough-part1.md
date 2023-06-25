---
author: "VBoo"
title: "Dual GPU Passthrough Guided Part 1 - Preparations hardware"
description: "In this tutorial you will be taught how to prepare your gpu passthrough hardware and requirements"
tags: ["QEMU/KVM", "GPU-Passthrough", "virt-manager"]
date: 2023-05-13T05:38:00+0800
thumbnail: https://cdn.mos.cms.futurecdn.net/hxHC9kET4QctevKmEPgzL.jpg
---

# 0. Introduction

What is GPU Passthrough? In simple terms, imagine you are using a virtual machine (VM). Normally, you wouldn't be able to play games on a VM because it cannot directly access the GPU. GPU passthrough solves this problem by allowing you to pass the GPU through to your VM. This means that you can use your VM as if it were a real machine, enabling you to play games and utilize the full power of the GPU within the virtual environment.

**IMPORTANT: This article specifically applies to operating systems that use Linux as their host system. The reason is that Kernel-based Virtual Machine (KVM) is a virtualization technology that is available exclusively on Linux. Therefore, the instructions and concepts discussed in this article are relevant and applicable primarily to Linux-based host systems.**

# 1. Preparations

Now, let's talk what need to careful what need to buy!

**IMPORTANT: for your GPU-Passthrough, you need below hardware to start your GPU-Passthrough environment. If not, you cannot passthrough your GPU.** 

## 1.1 GPU Preparations

To set up GPU passthrough, you will need two GPUs:

- one for the host machine
- one for the guest machine (your VM).

The choice of GPU depends on your preference and requirements.

In my case, I recommend using an AMD GPU. AMD GPUs have excellent support for Linux, making them more user-friendly compared to NVIDIA GPUs. AMD's drivers and software are well-integrated with Linux distributions, ensuring smoother compatibility and performance for virtualization purposes. However, the final decision on which GPU to use ultimately depends on your specific needs and considerations.

## 1.2 CPU Support?

To ensure that your CPU supports virtualization, you can follow these steps:

1. Check the official website of your CPU manufacturer.
2. Look for the specifications or features section related to virtualization.
3. You should see information confirming whether your CPU supports virtualization or not.

By referring to the official website of your CPU manufacturer, you can find detailed and accurate information about your CPU's virtualization support.

| AMD CPU  | Intel CPU |
|----------|-----------|
|   IOMMU  |    Vt-D   |
|  NX mode |    VT-X   |
| SVM Mode |           |

Here is an example with supported CPU:

- [Intel® Core™ i9-13900K Processor](https://www.intel.com/content/www/us/en/products/sku/230496/intel-core-i913900k-processor-36m-cache-up-to-5-80-ghz/specifications.html?wapkw=i9%2013900k)

<img src="/blog/en/dual-gpu-passthrough/part1/Example-with-cpu-supported.png">

## 1.3 MotherBoard

When it comes to the motherboard, the process of checking IOMMU support is similar to checking the CPU. However, it may be more challenging to find detailed information specifically about IOMMU support for a motherboard.

To determine if your motherboard supports IOMMU, you should try to locate the motherboard's manual or documentation. **Look for the model number of the motherboard and search for its PDF or online documentation.**

In the manual or documentation, you can refer to the specifications or features section to find information about IOMMU support. The details provided in the manual should indicate whether the motherboard supports IOMMU or has any specific virtualization features.

It is important to note that not all motherboards explicitly mention IOMMU support in their documentation. In such cases, you may need to rely on community forums, online discussions, or user experiences with the same motherboard model to determine its IOMMU compatibility.

Remember to verify the information from reliable sources and ensure that the motherboard supports the required features before proceeding with GPU passthrough setup.

Here is a example a motherboard supported.

- [Intel Z790/H770/B760 Series Motherboard](https://download.asrock.com/Manual/Software/Intel%20B760/Software_BIOS%20Setup%20Guide_English.pdf)

<img src="/blog/en/dual-gpu-passthrough/part1/Example-with-motherboard-supported.png"/>

## 1.3 Keyboard and Mouse (Optional)

After enabling GPU passthrough, it's important to note that you won't be able to use the keyboard on your host machine because the device has been passed directly through to the VM. In this case, it is recommended to have separate keyboards and mice for both the host and the VM to ensure proper functionality and control. This way, you can use one set of keyboard and mouse for the host machine and another set for the virtual machine. Having dedicated input devices for each system will help you effectively manage and interact with both the host and the VM.

By two Keyboard and mouse, you can using Host and Guest on same time.

## 1.4 Monitor (Optional)

To achieve the highest and optimal settings, it is indeed recommended to use two monitors. This setup allows you to have simultaneous access to both the host system and the VM, simulating a dual-system experience.

In this configuration, you will require two keyboards and a mouse to efficiently operate both systems. You can connect the primary monitor to the host system using an HDMI cable, while the secondary monitor can be connected to the other GPU (guest GPU) assigned to the VM.

If you have only one monitor, it needs to have dual HDMI ports to accommodate both the host and the VM. This allows you to switch between the two systems seamlessly and make the most out of your dual-system setup.

![two monitor](http://www.rdaxpress.com/uploads/3/1/6/7/31672951/s586650569732673968_p93_i1_w2560.jpeg)

Image source: http://www.rdaxpress.com/uploads/3/1/6/7/31672951/s586650569732673968_p93_i1_w2560.jpeg