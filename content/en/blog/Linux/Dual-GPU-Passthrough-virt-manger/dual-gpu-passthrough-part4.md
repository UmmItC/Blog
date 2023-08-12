---
author: "Arcsly"
title: "Dual GPU Passthrough Guided Part 4 - Passthrough the Second GPU"
description: "Learn how to configure GPU passthrough for your virtual machine's second GPU in this step-by-step guide, unlocking advanced virtualization capabilities and boosting performance."
tags: ["QEMU/KVM", "GPU-Passthrough", "virt-manager"]
date: 2023-05-13T05:55:00+0800
thumbnail: https://i.pcmag.com/imagery/articles/04QbILXwVNxIcTB52JDHeir-5..v1569489465.jpg
---

# 1. Explore IOMMU Grouping

As you delve into the intricacies of GPU passthrough, understanding how your devices are grouped becomes crucial. IOMMU groups play a pivotal role in device isolation for virtualization. To get a clear view of these groups on your Linux system, execute the following command in your terminal:

```shell
#!/bin/bash
shopt -s nullglob
for g in $(find /sys/kernel/iommu_groups/* -maxdepth 0 -type d | sort -V); do
    echo "IOMMU Group ${g##*/}:"
    for d in $g/devices/*; do
        echo -e "\t$(lspci -nns ${d##*/})"
    done;
done;
```

This script meticulously presents the IOMMU groups along with their associated devices, revealing the intricate web of connections within your system. The information gleaned from this exploration will serve as a valuable compass as you navigate the terrain of device passthrough configuration for virtualization purposes.

## 1.2 Identify IOMMU GPU IDs

The output will unveil a list of GPUs residing within your system. Your second GPU, the one destined for passthrough, will make an appearance here. Take note of its unique PCI (Peripheral Component Interconnect) numbers, often referred to as **PCI IDs**. These IDs will play a crucial role in the next steps.

Here's an example of what you might see:

```shell
IOMMU Group 22:
	09:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc. [AMD/ATI] Navi 23 [Radeon RX 6600/6600 XT/6600M] [1002:73ff] (rev c7)
IOMMU Group 23:
	09:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI] Navi 21/23 HDMI/DP Audio Controller [1002:ab28]
```

### Example IDs

Let's assume your investigation yields the following GPU IDs:

- 1002:73ff (GPU)
- 1002:ab28 (GPU Audio)

Keep these IDs in your sights; they're your key to unlocking the next phase.

## 1.3 Embed IDs in Your Bootloader Config

Configuring GPU passthrough involves telling your system exactly which GPU to hand over to the virtual machine. This is done by specifying the unique PCI IDs of the GPU in question. These IDs act as addresses that pinpoint the GPU within the system.

By providing the correct PCI IDs, you instruct the virtualization software to exclusively allocate and pass through the designated GPU to the virtual machine. This enables the VM to directly leverage the GPU's capabilities for tasks like gaming or graphics-intensive applications.

Let's integrate these IDs into your bootloader configuration, a step similar to enabling virtualization.

Within the same line where you enabled virtualization, add the following at the end:

```shell
vfio-pci.ids=1002:73ff,1002:ab28
```

The result should resemble this:

```shell
title Arch Linux
linux /vmlinuz-linux
initrd /initramfs-linux.img

options root=<root> quiet rw intel_iommu=on iommu=pt vfio-pci.ids=1002:73ff,1002:ab28
```

## 2. Craft a vfio.conf

Now, let's forge a new file:

```shell
sudo nano /etc/modprobe.d/vfio.conf
```

Input the following content:

```shell
options vfio-pci ids=1002:73ff,1002:ab28
```

## 3. Enhance mkinitcpio.conf

Let's illuminate the path for the `vfio`, `vfio_iommu_typ1` modules. By default, these modules are dimmed. Edit `/etc/mkinitcpio.conf` and adjust the `MODULES()` line as follows:

```shell
MODULES=(vfio_pci vfio vfio_iommu_type1) 
```

## 3.2 Forge a New Image

With your adjustments complete, it's time to fashion a new image. Build it, then orchestrate a system reboot:

```shell
sudo mkinitcpio -p linux
```

## 4. Validate GPU Passthrough Status

To verify your GPU's passthrough status, execute the following command:

```shell
lspci -k
```

Examine your PCI setup. The "Kernel driver in use" entry should bear the mark `vfio-pci`. For example:

```shell
09:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Navi 23 [Radeon RX 6600/6600 XT/6600M] (rev c7)
	Subsystem: Tul Corporation / PowerColor Navi 23 [Radeon RX 6600/6600 XT/6600M]
	Kernel driver in use: vfio-pci
	Kernel modules: amdgpu
09:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Navi 21/23 HDMI/DP Audio Controller
	Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] Navi 21/23 HDMI/DP Audio Controller
	Kernel driver in use: vfio-pci
	Kernel modules: snd_hda_intel
```

When you encounter the `vfio-pci` signal, you've reached the summit! Your GPU and GPU Audio have triumphantly made the passage. If not, fear not; simply retrace your steps and try again. Success is within reach!