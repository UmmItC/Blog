---
author: "VBoo"
title: "Dual GPU Passthrough Guided Part 2 - Enable virtualization on your BIOS setting"
description: "let enable virtualization on your BIOS setting."
tags: ["QEMU/KVM", "GPU-Passthrough", "virt-manager"]
date: 2023-05-13T05:38:00+0800
thumbnail: https://images.unsplash.com/photo-1540829917886-91ab031b1764?ixlib=rb-4.0.3
---

# Enable virtualization

Now that you have purchased the right hardware, it's time to ensure that virtualization is enabled in your BIOS settings.

To enable virtualization, follow these steps:

1. Boot your computer then pressing the appropriate key during the boot process. The specific key varies depending on your computer's manufacturer (common keys include F2, Del, Esc, or F12).
2. Once in the BIOS settings, look for the virtualization-related settings. The names of these settings may vary depending on your BIOS version and manufacturer.
3. Enable the virtualization settings. Common names for these settings include "Virtualization Technology (VT-x)", "Intel Virtualization Technology", or "AMD IOMMU".
4. Save the changes and exit the BIOS settings.
5. Reboot your system.

By enabling virtualization in the BIOS settings, you are allowing your system to fully utilize virtualization technologies, which is essential for GPU passthrough and other virtualization tasks.

| AMD CPU  | Intel CPU |
|----------|-----------|
|   IOMMU  |    Vt-D   |
|  NX mode |    VT-X   |
| SVM Mode |           |