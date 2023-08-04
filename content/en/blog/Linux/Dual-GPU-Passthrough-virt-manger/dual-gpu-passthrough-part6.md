---
author: "Arcsly"
title: "Dual GPU Passthrough Guided Part 6 - Download needed iso"
description: "download iso file with using aria2c that more fastest."
tags: ["QEMU/KVM", "GPU-Passthrough", "virt-manager"]
date: 2023-05-13T06:00:00+0800
thumbnail: https://i.extremetech.com/imagery/content-types/02jXYQBhtVr3NI0nyK3sETz/hero-image.fill.size_1200x675.jpg
---

# 0. Verification

If you have successfully completed the previous steps, you should no longer encounter prompts requiring superuser permissions. If any pop-ups persist, it indicates that something might be missing or incorrect. In such cases, revisit the relevant steps and ensure accurate execution.

# 1. Downloading ISO Files

In this step, we will download two essential ISO files for our setup:

1. The Virtio ISO, available at: [https://github.com/virtio-win/virtio-win-pkg-scripts/blob/master/README.md](https://github.com/virtio-win/virtio-win-pkg-scripts/blob/master/README.md)
2. The Windows 10 ISO from: [https://www.microsoft.com/en-au/software-download/windows10ISO](https://www.microsoft.com/en-au/software-download/windows10ISO)

The Virtio ISO ensures an optimal user experience, while the Windows 10 ISO is required for the Windows 10 installation.

## 1.2 Faster Downloads with aria2

To expedite your download process, I recommend using `aria2`, a tool that supports multi-threaded downloads. To install `aria2`, enter the following command:
```shell
sudo pacman -S aria2c
```

To download your target files using 16 threads, use these commands:
```shell
aria2c -x 16 "windows_iso_link.iso"
aria2c -x 16 "virtio-win_link.iso"
```

By following these steps, you ensure the availability of the necessary ISO files for the subsequent stages of the setup.