---
author: "Arcsly"
title: "Manually Updating Windows with PowerShell: A Quick Guide"
description: "Discover the power of PowerShell in managing Windows updates. This quick guide provides step-by-step instructions on how to manually update your Windows system."
tags: ["Windows", "Powershell", "Update"]
date: 2023-10-15T21:53:00+0800
thumbnail: https://www.windowslatest.com/wp-content/uploads/2021/03/Windows-10-KB5000802-BSOD.jpg
---

## Introduction

Even if you've removed the built-in Windows Update GUI, there's still a way to keep your system up-to-date. PowerShell comes to the rescue, offering a robust module for manual Windows updates. This guide is tailored for scenarios where you've disabled the native Windows update mechanisms and need a controlled method to ensure your system stays current

### Prerequisites

Before you begin, make sure you have PowerShell installed on your system. Most modern versions of Windows come with PowerShell pre-installed. Additionally, ensure you have the PSWindowsUpdate module installed. If you don't have it yet, you can install it using the following command in PowerShell:

```powershell
Install-Module -Name PSWindowsUpdate -Force -SkipPublisherCheck
```

## Step 1: Checking Available Updates

You can start by checking for available updates on your system. Use the following command to view the available updates:

```powershell
Get-WindowsUpdate
```

This command will display a list of available updates, allowing you to see what needs to be installed.

## Step 2: Installing Updates

To install updates, you can use the `Install-WindowsUpdate` cmdlet. Here's a basic command to install all available updates:

```powershell
Install-WindowsUpdate -MicrosoftUpdate -AcceptAll
```

In this command, `-MicrosoftUpdate` ensures you're getting updates from Microsoft, and `-AcceptAll` installs all available updates without prompting for confirmation.

## Step 3: Controlling Reboots

Managing reboots after installing Windows updates is crucial to ensure a smooth and uninterrupted user experience. PowerShell provides options to control the reboot behavior according to your preferences.

### Automatic Reboot (Default Behavior)

By default, Windows updates usually trigger an automatic reboot to apply the changes. If you want to retain this default behavior, you can use the following command:

```powershell
Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReboot
```

Adding the `-AutoReboot` parameter ensures that your system will automatically restart after the updates are installed, eliminating the need for manual intervention.

### Manual Reboot

However, there might be scenarios where you prefer to reboot your system at a more convenient time, especially if you are in the middle of important tasks. To prevent an immediate reboot after updates, you can use the `-IgnoreReboot` parameter:

```powershell
Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -IgnoreReboot
```

Using `-IgnoreReboot` disables the automatic reboot, giving you the flexibility to manually restart your system when it's convenient for you. This option allows you to complete your work or save your progress before applying the updates.

## Conclusion

This quick guide should help some people who remove windows updates altogether or want to update windows using the command line. However, updating using powershell will be faster than updating using the built-in GUI.

## Reference

- [How to Install Windows Updates with PowerShell? [Tutorial]](https://www.partitionwizard.com/partitionmagic/powershell-windows-update.html)