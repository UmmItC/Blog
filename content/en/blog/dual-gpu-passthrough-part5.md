---
author: "VBoo"
title: "Dual GPU Passthrough Guided Part 3 - Setup virt-manager"
description: "virt-manager is a nice tool for gpu-passthorugh. that helping you control the pci device."
tags: ["QEMU/KVM", "GPU-Passthrough", "virt-manager"]
date: 2023-05-13T05:58:00+0800
thumbnail: https://virt-manager.org/static/topbar_logo.png
---

# 0. virt-manager

now we need a virtual machine to using the passed thorught machine. we are gotta to use virt-manger to setup your own virtual machine (QEMU/KVM).


# 1. install needed package

to install the needed package type the following command, the following pacakge with Role:

- virt-manger, qemu (QEMU/KVM)
- dmidecode (retrieve system information)

```shell
sudo pacman -S virt-manager qemu vde2 ebtables iptables-nft nftables dnsmasq bridge-utils ovmf dmidecode
```

# 2. virt-manager Configuration

Now you open virt-manager should have a pop-up for needed root user. will also need to edited the config let you open up this program without the root permission.

now we edit the first config files, the file located on `/etc/libvirt/libvirtd.conf`, for this step is the permission for open up virt-manager.

```shell
unix_sock_group = "libvirt"

unix_sock_rw_perms = "0770"
```

## 2.2 Log files

sometimes you test the virt-manager but now working, the log file will useful for your debugging what error for detail and troubleshooting. same on file `/etc/libvirt/libvirtd.conf`, end of files add two lines:

```shell
log_filters="3:qemu 1:libvirt"
log_outputs="2:file:/var/log/libvirt/libvirtd.log"
```

## 2.3 adding libvirt group to your user

to allow your user using virt-manager for no warning pop up superuser, type the following commands:

```shell
sudo usermod -a -G kvm,libvirt $(whoami)
```

## 2.4 Enable/start libvirt services

Now enable the service

```shell
sudo systemctl enable libvirtd
```

Then start the service

```shell
sudo systemctl start libvirtd
```

## 2.5 Verify group

by verify libvirt has been added to your group, this should return kvm libvirt including the output.

```shell
sudo groups $(whoami)
```

## 2.6 edit qemu.conf

finally edit the file qemu.conf the files located on /etc/libvirt/qemu.conf, using superuser to edit the file:

```shell
sudo nano /etc/libvirt/qemu.conf
```

to easy way to find out what lines need edit, for nano shortcut press  ctrl + w search user = , on the same area edit the content with libvirt, change this to your current user name.

## 2.7 restart libvirtd service

by apply the lines of changes, type the following command to restart libvirtd servies.

```shell
sudo systemctl restart libvirtd
```

## Optional: enable virsh network by default

by type following command, this will make your virsh network automatically started.

***Note: if you dont need virsh network, you dont need to do.***