---
author: "VBoo"
title: "Dual GPU Passthrough Guided Part 4 - Passthrough the GPU"
description: "in this guied, we will passthrough the second GPU."
tags: ["QEMU/KVM", "GPU-Passthrough", "virt-manager"]
date: 2023-05-13T05:55:00+0800
thumbnail: https://i.pcmag.com/imagery/articles/04QbILXwVNxIcTB52JDHeir-5..v1569489465.jpg
---

# 1. list the IOMMU Groups

So, Now should able to see the iommu group. on your linux system (use bash), type the following command:

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

## 1.2 Find IOMMU GPU IDS

That should return somethings like that, you need to find your second GPU `IDS`.

```shell
IOMMU Group 20:
	07:00.0 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Upstream Port of PCI Express Switch [1002:1478] (rev c7)
IOMMU Group 21:
	08:00.0 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Downstream Port of PCI Express Switch [1002:1479]
IOMMU Group 22:
	09:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc. [AMD/ATI] Navi 23 [Radeon RX 6600/6600 XT/6600M] [1002:73ff] (rev c7)
IOMMU Group 23:
	09:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI] Navi 21/23 HDMI/DP Audio Controller [1002:ab28]
```

For example my IDS is:

- 1002:73ff (GPU)
- 1002:ab28 (GPU Audio)

Now notes that, for next step we need to paste those ids to your bootloader config.

## 1.3 Paste ids on your bootloader config

When configuring GPU passthrough, you will need to identify the unique identifier of the GPU you want to pass through to the virtual machine. This identifier is typically represented by a **PCI (Peripheral Component Interconnect) number (ids)**, which serves as a unique name or address for the GPU within the system.

By specifying the correct GPU using its PCI number, you can instruct the virtualization software to exclusively assign and pass through that particular GPU to the virtual machine. This ensures that the virtual machine has direct access and control over the GPU, allowing it to utilize the GPU's capabilities effectively for tasks such as gaming or other GPU-intensive applications.

Now edit your bootloader, this step similar the adding enable virtualization.

at the same line, in the line of ends, add:

```shell
vfio-pci.ids=1002:73ff,1002:ab28
```

result should like that:

```shell
title Arch linux
linux /vmlinuz-linux
initrd /initramfs-linux.img

options root=<root> quiet rw intel_iommu=on iommu=pt vfio-pci.ids=1002:73ff,1002:ab28

```

# 2. Added vfio.conf

now create a new file.

```shell
sudo nano /etc/modprobe.d/vfio.conf
```

type the following content:

```shell
options vfio-pci ids=1002:73ff,1002:ab28
```

# 3. edit mkinitcpio.conf

we need to enable `vfio`, `vfio_iommu_typ1` modules, by default this is disabled. on `/etc/mkinitcpio.conf`edit the Modules() became that:

```shell
MODULES=(vfio_pci vfio vfio_iommu_type1) 
```

# 3.2 Rebuilt new image

once you done, now build your new image, then reboot your system.

```shell
sudo mkinitcpio -p linux
```

# 4. Verify GPU-passthrough status

to verify your GPU is passed status, type the following command to check:

```shell
lspci -k
```

now check your PCI, the Kernel driver in use: should shown the result `vfio-pci`.
for example should like that:

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

once you saw the result is vfio-pci, Congratulations! your GPU and GPU-Audio was already successful passed!

if not, you something doing wrong. just do it again!