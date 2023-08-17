---
author: "Arcsly"
title: "Dual GPU Passthrough Guided Part 1 - Hardware Preparations"
description: "in this tutorial, you'll gain comprehensive insights into preparing your hardware for GPU passthrough. Learn the crucial steps and requirements that pave the way for a successful setup."
tags: ["QEMU/KVM", "GPU-Passthrough", "virt-manager"]
date: 2023-05-13T05:38:00+0800
thumbnail: https://cdn.mos.cms.futurecdn.net/hxHC9kET4QctevKmEPgzL.jpg
---

## Introduction

Welcome to the realm of GPU passthrough, a gateway to unlocking the full potential of your graphics processing unit (GPU) within a virtual machine (VM). Have you ever yearned to play games or run GPU-intensive applications on a VM? The dream becomes a reality with dual GPU passthrough. In this guide, we're about to embark on a journey where you'll learn to harness the power of dual GPU passthrough. But first, let's understand what it's all about.

**Note: While single GPU passthrough is an option, our focus here is on the more advanced and versatile dual GPU passthrough.**

## 1. Preparations

Before we plunge into the world of dual GPU passthrough, let's lay the groundwork by ensuring you have the necessary hardware and components in place.

**Important: Dual GPU passthrough requires a minimum of two GPUs. Without these components, dual GPU passthrough is not achievable.**

### 1.1 GPU Requirements

Our adventure into dual GPU passthrough begins with not one, but two GPUs:

- **Host GPU:** This GPU is reserved for your host system's needs.
- **Guest GPU:** The guest GPU is exclusively assigned to your VM, ensuring optimal performance within the virtual realm.

The choice of GPUs is flexible, tailored to your preferences and performance expectations. However, having dependable and capable GPUs for both the host and guest systems is a key consideration.

### 1.2 CPU Virtualization Support

Before we proceed, it's vital to confirm that your CPU supports virtualization technology. This technology underpins efficient VM performance and enables successful passthrough capabilities.

To ascertain CPU virtualization support:

1. Visit your CPU manufacturer's official website.
2. Navigate to the specifications or features section related to virtualization support.
3. Verify whether your CPU supports virtualization technology (Intel VT-x or AMD-V).

| AMD CPU   | Intel CPU |
| ----------|-----------|
| IOMMU     | Vt-D      |
| NX mode   | VT-X      |
| SVM Mode  |           |


Ensuring proper CPU virtualization support is a crucial step toward a successful dual GPU passthrough setup.

**Example of supported CPU:**

- [Intel® Core™ i9-13900K Processor](https://www.intel.com/content/www/us/en/products/sku/230496/intel-core-i913900k-processor-36m-cache-up-to-5-80-ghz/specifications.html?wapkw=i9%2013900k)

![CPU](/blog/linux/dual-gpu-passthrough/part1/Example-with-cpu-supported.png)

### 1.3 Motherboard Compatibility

The motherboard's role in dual GPU passthrough is pivotal. It must embrace Input-Output Memory Management Unit (IOMMU) technology, which facilitates hardware isolation between the host and guest systems.

To determine motherboard compatibility:

1. Consult your motherboard's manual or official documentation.
2. Seek information concerning IOMMU support or hardware virtualization features.
3. Confirm whether your motherboard supports IOMMU technology for dual GPU passthrough.

Having a motherboard with robust IOMMU support is essential for a seamless dual GPU passthrough experience.

**Example of supported motherboard:**

- [Intel Z790/H770/B760 Series Motherboard](https://download.asrock.com/Manual/Software/Intel%20B760/Software_BIOS%20Setup%20Guide_English.pdf)

![MotherBoard](/blog/linux/dual-gpu-passthrough/part1/Example-with-motherboard-supported.png)

### 1.4 Additional Peripherals (Optional)

Enhance your dual GPU passthrough setup with the following peripherals:

- **Keyboard and Mouse:** Separate input devices for the host and guest systems ensure smooth control and interaction between both environments.
- **Monitors:** While optional, dual monitors significantly boost productivity, enabling simultaneous access to both the host and guest systems. For those with a single monitor, dual HDMI inputs are crucial for seamless switching between systems.

With these preparations complete, you're ready to embark on your dual GPU passthrough journey. Stay tuned for upcoming segments of our Dual GPU Passthrough Guided series, where we'll delve deeper into the setup process and configuration steps.

![Dual Monitors](http://www.rdaxpress.com/uploads/3/1/6/7/31672951/s586650569732673968_p93_i1_w2560.jpeg)