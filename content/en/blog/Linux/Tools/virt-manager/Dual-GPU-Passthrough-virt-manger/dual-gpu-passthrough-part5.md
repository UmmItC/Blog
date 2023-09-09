---
author: "Arcsly"
title: "Dual GPU Passthrough Guide Part 5 - Configuring virt-manager and Device Setup"
description: "Unveil the potential of virt-manager, a crucial instrument for seamless GPU passthrough. Effortlessly seize command over your PCI devices and experience a realm of limitless possibilities."
tags: ["QEMU/KVM", "GPU-Passthrough", "virt-manager"]
date: 2023-05-13T05:58:00+0800
thumbnail: https://icons.iconarchive.com/icons/papirus-team/papirus-apps/512/virt-manager-icon.png
lastmod: 2023-09-09T10:20:50+0800
---

## Step 1: Install Required Packages

Begin your journey into GPU passthrough with virt-manager by installing essential packages. Each package serves a specific purpose in setting up and managing virtualization:

- **virt-manager** and **qemu (QEMU/KVM):** virt-manager provides a user-friendly interface for virtual machine management, while qemu is a powerful processor emulator that enables hardware virtualization.
- **vde2:** This toolkit, Virtual Distributed Ethernet (VDE), is used to create virtual networks, enabling seamless communication between virtual machines.
- **ebtables:** Operating at the Ethernet frame level, ebtables allows administrators to establish rules for filtering and manipulating network traffic, enhancing network control.
- **iptables-nft** and **nftables:** These tools provide firewall management for both IPv4 and IPv6, using the Netfilter framework to regulate network traffic and enhance security.
- **dnsmasq:** A lightweight DNS and DHCP server that proves invaluable for managing network addresses and facilitating communication within small networks and virtual environments.
- **bridge-utils:** These utilities empower you to manage Ethernet bridges, facilitating the integration of virtual machines into your network infrastructure.
- **ovmf:** The Open Virtual Machine Firmware offers a modern UEFI (Unified Extensible Firmware Interface) implementation, ensuring compatibility and stability in virtualized environments.
- **dmidecode:** This tool allows you to retrieve crucial system information such as BIOS, CPU details, memory configuration, and more, aiding in accurate virtualization setup.

Execute the following command in your terminal to install these packages:
```shell
sudo pacman -S virt-manager qemu vde2 ebtables iptables-nft nftables dnsmasq bridge-utils ovmf dmidecode
```

## Step 2: Configure libvirtd.conf for Permissions and Logging

### 2.1 Adjust Permissions for virt-manager

Fine-tune your system for optimal virt-manager usage without the need for constant root permissions:

1. Open the configuration file using the command:
```shell
sudo nano /etc/libvirt/libvirtd.conf
```
2. Within this file, locate the entries for `unix_sock_group` and `unix_sock_rw_perms`.

3. Update the `unix_sock_group` entry to specify the group "libvirt" for better control:
   ```plaintext
   unix_sock_group = "libvirt"
   ```

4. Set the `unix_sock_rw_perms` to "0770" to grant appropriate permissions for launching virt-manager:
   ```plaintext
   unix_sock_rw_perms = "0770"
   ```

5. Save your changes by pressing `Ctrl + O`, then press Enter. Exit the text editor with `Ctrl + X`.

By configuring these settings, you ensure that virt-manager can be launched and managed without encountering permission-related obstacles.

### 2.2 Set Up Logging for Troubleshooting

In case you encounter issues with virt-manager, having detailed logs can be immensely helpful for troubleshooting. To set up logging:

1. Open the `/etc/libvirt/libvirtd.conf` file again:
```shell
sudo nano /etc/libvirt/libvirtd.conf
```

2. Add the following lines at the end of the file to specify the log filters and outputs:
```shell
log_filters="3:qemu 1:libvirt"
log_outputs="2:file:/var/log/libvirt/libvirtd.log"
```

By completing this step, you've not only installed crucial packages but also optimized virt-manager's permissions and established a logging mechanism for effective troubleshooting.

## Step 3: Add Your User to libvirt Group

Empower your user to seamlessly use `virt-manager` without encountering superuser warnings:

1. Execute the following commands to add your user to the `kvm` and `libvirt` groups:
```shell
sudo usermod -a -G kvm,libvirt $(whoami)
```

## Step 4: Enable and Start libvirt Services

Ensure that libvirt services are set to start automatically upon boot and then initiate the libvirt service:

```shell
sudo systemctl enable libvirtd
sudo systemctl start libvirtd
```

### Verify Group Membership

To confirm that your user has been added to the necessary groups, including `libvirt` and `kvm`:

```shell
sudo groups $(whoami)
```

By completing these steps, you've successfully added your user to the required groups, enabled and started the libvirt service, and verified the updated group membership. This ensures a seamless experience while utilizing `virt-manager` for your virtualization tasks.

## Step 5: Customize QEMU Configuration

Ensuring that QEMU processes run securely within your user permissions is crucial for optimizing your virtualization environment. Here's how to achieve this:

1. Begin by opening the `qemu.conf` file for editing using the following command:

   ```shell
   sudo nano /etc/libvirt/qemu.conf
   ```

   > TIps: For a convenient way to navigate within the `nano` text editor, you can press `Ctrl + W`, type `user =`, and press `Enter`.

2. Inside the text editor, you'll come across lines resembling the following:

   ```shell
   user = "libvirt"

   # The group for QEMU processes run by the system instance. It can be

   # specified in a similar way to user.

   group = "libvirt"
   ```

3. Replace `"libvirt"` with your actual username on both lines. This simple adjustment ensures that all QEMU processes will execute with your user's privileges.

By following these steps, you guarantee that QEMU processes operate securely within the realm of your user permissions, leading to an optimized and efficient virtualization environment.

## Step 6: Restart libvirtd Service

Apply the changes you've made by restarting the `libvirtd` service using the command:
```shell
sudo systemctl restart libvirtd
```

## Optional: Start virsh Network Automatically

If you wish to have the virsh network start automatically, you can execute the following command:
> Note: If the virsh network isn't needed, you can skip this step.
```shell
sudo virsh net-autostart default
```

By completing these comprehensive steps, you've not only verified your group membership and fine-tuned `qemu.conf`, but you've also restarted the `libvirtd` service, ensuring that your virtualization setup is seamlessly aligned with your user and system settings. This detailed guide equips you with the expertise to confidently harness GPU passthrough capabilities for exceptional virtualization performance.