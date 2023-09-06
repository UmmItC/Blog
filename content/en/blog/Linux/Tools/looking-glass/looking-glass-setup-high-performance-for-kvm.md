---
author: "Arcsly"
title: "KVM: High-Performance Graphics for Virtual Machines with Looking Glass"
description: "Looking Glass, a groundbreaking technology that brings the power of physical GPUs to your virtual machines. Learn how to install, configure, and make the most of this open-source gem for unmatched graphics performance in your VMs."
tags: ["looking-glass", "virt-manager"]
date: 2023-09-04T23:29:40+0800
thumbnail: https://repository-images.githubusercontent.com/113412457/50fece80-7d76-11e9-948c-52d9d6ea9bda
---

## Introduction

In the world of virtualization, picture a scenario where you typically had to juggle between physical monitors to fully utilize the performance of your virtual machines (VMs). You needed to switch back and forth, often compromising seamless operation. However, with the introduction of Looking Glass, that narrative transforms completely. Looking Glass provides a revolutionary solution that eliminates the need for constant monitor switching. It effectively creates a virtual "fake-monitor" with high-performance video capabilities, offering an experience virtually indistinguishable from a real host system. With Looking Glass, you can finally enjoy the best of both worlds without the hassle of monitor management.

## What Is Looking Glass?

**Looking Glass** is a revolutionary software solution designed to bridge the gap between virtual machines (VMs) and physical GPUs. Traditionally, VMs struggled to deliver top-tier graphics performance because they couldn't access the raw power of a physical Graphics Processing Unit (GPU). Looking Glass changes this paradigm by enabling VMs to utilize the host machine's GPU for rendering, resulting in near-native graphics performance within the VM.

###  Benefits and Use Cases

Looking Glass offers several key benefits and use cases:

1. **Near-Native Graphics Performance**: VMs equipped with Looking Glass can achieve graphics performance that's almost indistinguishable from running on bare-metal hardware.

## Installation Steps

### Step 1: Install the Looking Glass Client

You can install the Looking Glass client on your Linux system from the Arch User Repository (AUR) using one of the following packages:

- `looking-glass`: This package provides the stable version of Looking Glass.
- `looking-glass-git`: This package offers the latest development version. (with git repo)

To install the stable version, use the following command:

```bash
yay -S looking-glass
```

Or for the latest development version:

```bash
yay -S looking-glass-git
```

## Step 2: Configuring and Using Looking Glass

After installed the Looking Glass client, you'll need to configure it to connect to your VM. This involves specifying the host's address and port where the Looking Glass server is running.

### To be Continue …

...

## Conclusion

With Looking Glass, the virtualization landscape is evolving to provide a superior graphics experience for VMs. Whether you're a gamer, content creator, or developer, this open-source gem opens up a world of possibilities for harnessing the full potential of your GPU within virtual environments. Unlock high-performance graphics for your virtual machines and redefine what's possible in the world of virtualization.