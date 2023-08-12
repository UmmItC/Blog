---
author: "Arcsly"
title: "Dual GPU Passthrough Guided Part 2 - Enabling Virtualization in BIOS"
description: "Unlock the full potential of your virtual machine setup by learning how to enable virtualization in your BIOS settings. This essential step will pave the way for seamless dual GPU passthrough and enhanced performance."
tags: ["QEMU/KVM", "GPU-Passthrough", "virt-manager"]
date: 2023-05-13T05:45:00+0800
thumbnail: https://images.unsplash.com/photo-1540829917886-91ab031b1764?ixlib=rb-4.0.3
---

# Introduction

In the realm of virtualization, the power to transform your hardware into versatile virtual machines awaits. However, before you can fully harness this power, a crucial step beckons: enabling virtualization in your BIOS settings.

Here's your roadmap to unlocking virtualization's potential:

## Step 1: Enter the BIOS Realm

As your computer awakens, seize the moment to enter its BIOS realm. This involves pressing a specific key during the boot process. The exact key varies based on your computer's manufacturer—F2, Del, Esc, or F12 are common contenders.

## Step 2: Unearth the Virtualization Goldmine

Within the BIOS settings, your quest leads to the virtualization-related configurations. These settings, though named diversely due to BIOS version and manufacturer disparities, share a common purpose: enabling the magic of virtualization.

## Step 3: The Empowering Toggle

As you unearth the virtualization settings, you'll find the empowering toggle that needs your attention. Activate settings with names like "Virtualization Technology (VT-x)," "Intel Virtualization Technology," or "AMD IOMMU" to embrace virtualization's might.

## Step 4: Sealing the Pact

With the virtualization settings configured, seal the pact by saving your changes and gracefully exiting the BIOS realm.

## Step 5: Rebirth

As your system reawakens, it does so with the enhanced capability to exploit virtualization technologies. This, my friend, is the foundation for GPU passthrough and other virtualization wonders.

Your journey into the virtual world is now empowered by the AMD CPU's IOMMU, the Intel CPU's VT-X, and the potential encapsulated within SVM Mode.

Remember, enabling virtualization in BIOS is a pivotal stride that beckons the exceptional—seamless virtualization, boundless possibilities.

Welcome to a new realm of performance, where virtualization is the key that unlocks extraordinary feats.

| AMD CPU  | Intel CPU |
|----------|-----------|
|   IOMMU  |    Vt-D   |
|  NX mode |    VT-X   |
| SVM Mode |           |