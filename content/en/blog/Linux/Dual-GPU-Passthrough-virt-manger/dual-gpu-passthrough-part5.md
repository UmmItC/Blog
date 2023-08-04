---
author: "Arcsly"
title: "Dual GPU Passthrough Guided Part 5 - Setup virt-manager and config"
description: "virt-manager is a nice tool for gpu-passthorugh. that helping you control the pci device."
tags: ["QEMU/KVM", "GPU-Passthrough", "virt-manager"]
date: 2023-05-13T05:58:00+0800
thumbnail: https://icons.iconarchive.com/icons/papirus-team/papirus-apps/512/virt-manager-icon.png
---

Certainly! Here's the revised version of the section with explanations of what each package is used for:

# Set Up virt-manager

To utilize hardware passthrough, we'll configure a virtual machine using virt-manager, a powerful GUI tool for managing QEMU/KVM virtualization.

# 1. Install Required Packages

Start by installing the necessary packages, each with its respective role:

- `virt-manager`, `qemu` (QEMU/KVM): Virt-manager provides a user-friendly interface for managing virtual machines, while QEMU is a fast processor emulator that performs hardware virtualization.
- `vde2`: The Virtual Distributed Ethernet (VDE) toolkit is used for creating virtual networks.
- `ebtables`: This tool operates at the Ethernet frame level and enables administrators to set up rules to filter or manipulate network traffic.
- `iptables-nft`, `nftables`: These provide firewall management for IPv4 and IPv6 using the Netfilter framework.
- `dnsmasq`: A lightweight DNS and DHCP server, useful for small networks and virtual environments.
- `bridge-utils`: These utilities enable management of Ethernet bridges.
- `ovmf`: The Open Virtual Machine Firmware provides a modern UEFI firmware implementation for use in virtual machines.
- `dmidecode`: This tool retrieves system information including BIOS, motherboard, CPU, memory, and more.

Execute the following command to install these packages:
```shell
sudo pacman -S virt-manager qemu vde2 ebtables iptables-nft nftables dnsmasq bridge-utils ovmf dmidecode
```

# 2. Configure virt-manager

1. Open virt-manager with Root Permission:
   When you launch virt-manager, a root user prompt may appear. We will adjust configurations to run this program without requiring root permission.

2. Edit libvirtd.conf for Permission:
   Edit the configuration file located at `/etc/libvirt/libvirtd.conf`. This step manages the permission for opening virt-manager.
   ```shell
   unix_sock_group = "libvirt"
   unix_sock_rw_perms = "0770"
   ```

3. Log Files for Troubleshooting:
   If you encounter issues with virt-manager not functioning correctly, log files can aid in troubleshooting. In the same `/etc/libvirt/libvirtd.conf` file, add these lines to the end:
   ```shell
   log_filters="3:qemu 1:libvirt"
   log_outputs="2:file:/var/log/libvirt/libvirtd.log"
   ```

By completing these steps, you install the necessary packages, each serving a specific purpose in virtualization and networking. You also configure virt-manager for efficient usage and set up logging for potential troubleshooting scenarios. This paves the way for creating your virtual machine with hardware passthrough capabilities.

## 2.3 Adding libvirt Group to Your User

To enable your user to use `virt-manager` without encountering superuser warnings, run the following commands:

```shell
sudo usermod -a -G kvm,libvirt $(whoami)
```

## 2.4 Enable and Start libvirt Services

Now, enable the libvirt service to ensure it starts automatically upon boot:

```shell
sudo systemctl enable libvirtd
```

Next, start the libvirt service:

```shell
sudo systemctl start libvirtd
```

## 2.5 Verify Group Membership

To confirm that `libvirt` has been added to your group, including `kvm`, execute the following command:

```shell
sudo groups $(whoami)
```

By completing these steps, you add your user to the necessary groups, enable and start the libvirt service, and verify the updated group membership, ensuring a smooth experience while using `virt-manager` for virtualization tasks.

## 2.6 Edit qemu.conf

In the `qemu.conf` file, you will come across lines that look like this:

```plaintext
user = "your_username"

# The group for QEMU processes run by the system instance. It can be
# specified in a similar way to user.
group = "your_username"
```

Replace `"your_username"` with your actual username. Ensure it matches the same username you used earlier to verify your group membership.

To quickly find the lines for editing within the `nano` text editor, follow these steps:

1. Press `Ctrl + W` to initiate a search.
2. Enter `user =` and press `Enter`.

Now, within the same section, update the `user` and `group` settings to match your current username.

By following these instructions, you'll seamlessly replace `"your_username"` with your actual username, making the configuration clearer and more aligned with your system setup.

## 2.7 Restart libvirtd Service

Apply the changes by restarting the `libvirtd` service with the following command:
```shell
sudo systemctl restart libvirtd
```

## Optional: Enable virsh Network by Default

If you wish to have the virsh network automatically start, execute the following command:
> Note: If you don't require the virsh network, you can skip this step.
```shell
sudo virsh net-autostart default
```

By completing these steps, you verify group membership, configure `qemu.conf`, and restart the `libvirtd` service, ensuring your virtualization setup is correctly aligned with your user and system settings.