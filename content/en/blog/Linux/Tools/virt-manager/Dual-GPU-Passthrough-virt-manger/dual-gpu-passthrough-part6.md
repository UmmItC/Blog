---
author: "Arcsly"
title: "Dual GPU Passthrough Guided Part 6 - Download Needed ISO"
description: "Elevate your GPU passthrough experience with the sixth installment of our guided series, as we delve into the realm of ISO file acquisition. This critical phase involves obtaining the essential ISO files necessary for your setup's success."
tags: ["QEMU/KVM", "GPU-Passthrough", "virt-manager"]
date: 2023-05-13T06:00:00+0800
thumbnail: https://i.extremetech.com/imagery/content-types/02jXYQBhtVr3NI0nyK3sETz/hero-image.fill.size_1200x675.jpg
lastmod: 2023-09-09T10:28:50+0800
---

## Verification

Before proceeding further, it's important to verify the successful completion of the previous steps. If you have followed the instructions accurately, you should no longer encounter prompts requiring superuser permissions. However, if any pop-ups persist, it's an indication that something might be missing or incorrect. In such cases, carefully revisit the relevant steps and ensure precise execution.

## 1. Downloading ISO Files

In this phase, we will obtain two crucial ISO files for our setup:

1. **Virtio ISO**: This ISO file guarantees an optimized user experience. You can download it from the following link: [https://github.com/virtio-win/virtio-win-pkg-scripts/blob/master/README.md](https://github.com/virtio-win/virtio-win-pkg-scripts/blob/master/README.md)
2. **Windows 10 ISO**: This ISO is essential for the Windows 10 installation. You can acquire it from the official Microsoft website: [https://www.microsoft.com/en-au/software-download/windows10ISO](https://www.microsoft.com/en-au/software-download/windows10ISO)

### 1.2 Speeding Up Downloads with aria2

To expedite the download process, I recommend utilizing `aria2`, a powerful tool that supports multi-threaded downloads. Here's how you can set it up and enhance your download speed:

#### 1.2.1 Installing aria2

Begin by installing `aria2` using the following command:
```shell
sudo pacman -S aria2c
```

#### 1.2.2 Downloading ISO Files

Now, let's initiate the download of the ISO files using the efficiency of `aria2`. Execute the following commands, which will leverage 16 threads to significantly accelerate the download process

>Please note that you should replace `"windows_iso_link.iso"` and `"virtio-win_link.iso"` with the actual download links for the Windows and Virtio ISO files, respectively.

For the Windows ISO:
```shell
aria2c -x 16 "windows_iso_link.iso"
```

For the Virtio ISO:
```shell
aria2c -x 16 "virtio-win_link.iso"
```

By meticulously following these steps, you'll ensure the swift availability of the necessary ISO files for the upcoming phases of our setup. This optimization substantially reduces download time.