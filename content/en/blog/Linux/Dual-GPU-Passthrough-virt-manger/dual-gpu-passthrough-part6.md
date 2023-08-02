---
author: "Arcsly"
title: "Dual GPU Passthrough Guided Part 6 - Download needed iso"
description: "download iso file with using aria2c that more fastest."
tags: ["QEMU/KVM", "GPU-Passthrough", "virt-manager"]
date: 2023-05-13T06:00:00+0800
thumbnail: https://i.extremetech.com/imagery/content-types/02jXYQBhtVr3NI0nyK3sETz/hero-image.fill.size_1200x675.jpg
---

# 0. Ensure

if you all done with previous steps, that should not pop up needed superuser permission, if pop up. that mean you missing or wrong somethings, just do it again.

# 1. Download iso

on these step, we need to download two ISO.

- https://github.com/virtio-win/virtio-win-pkg-scripts/blob/master/README.md
- https://www.microsoft.com/en-au/software-download/windows10ISO

the virtio iso is for your best using experience, then the windows 10 iso is for installing the windows 10.

# 1.2 Fastest download files

for your fastest download the files, i recommnad using aria2 to download the iso file, that will using multithread download the file, for install `aria2`, type the following command:

```shell
sudo pacman -S aria2c
```

to download the target file for using 16 thread, type the following command:

```shell
aria2c -x 16 "windows_iso_link.iso"
aria2c -x 16 "virtio-win_link.iso"
```