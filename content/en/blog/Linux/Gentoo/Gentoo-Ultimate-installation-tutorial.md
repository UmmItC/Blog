---
author: "Arcsly"
title: "A Comprehensive Guide to Installing Gentoo Linux on Open-RC: Including XORG, XFCE and some Additional Software"
description: "Gentoo Linux with our comprehensive guide. Learn how to install Gentoo with XFCE and OpenRC, covering every step from initial setup to post-installation configuration. This hands-on tutorial empowers you to create a highly customizable and powerful Gentoo Linux environment."
tags: ["xfce", "Gentoo", "Linux"]
date: 2023-09-16T17:30:34+0800
thumbnail: https://upload.wikimedia.org/wikipedia/commons/3/35/Faenza-distributor-logo-gentoo.svg
lastmod: 2023-09-19T16:55:20+0800
---

## Introduction

Gentoo Linux is a distribution known for its flexibility, performance, and robustness. In this comprehensive guide, we will walk you through the process of installing Gentoo Linux step by step. By the end of this tutorial, you will have a fully functional Gentoo Linux system ready for your customization.

>Notes: This article has only the most basic settings.

## Prerequisites

Before embarking on the exciting journey of installing Gentoo Linux, it's essential to ensure you have everything you need:

- **Linux Proficiency:** You should be comfortable with Linux, know How linux working. and have experience with tasks like installing Arch Linux. While Gentoo is known for its flexibility, don't know how the command working, otherwise the installation will be very painful. I think it will take at least one week to several weeks to install..

- **Stable Internet Connection:** Gentoo requires downloading various packages and the Stage3 tarball during installation. Ensure you have a reliable and reasonably fast internet connection to expedite this process.

- **Hardware or Virtual Machine:** Prepare a physical machine or set up a virtual machine (VM) where you intend to install Gentoo. Whether it's real hardware or a virtual environment, Gentoo can adapt to your choice.

- **CPU cores:** There are many CPU cores. You need to know that everything in Gentoo is built using source code and not pre-built, so the cpu is very important as it depends on the compilation speed of your computer.

Now, let's get started with the installation process:

1. **Visit the Official Gentoo Website:** Open your web browser and navigate to [gentoo.org](https://www.gentoo.org/).

![Download ISO](/blog/linux/Gentoo/Download-iso.png)

2. **Download the Minimal Installation CD:** On the Gentoo download page, locate the "Minimal Installation CD (amd64)" option and click to initiate the download of the Gentoo ISO image.

With these prerequisites addressed,  Lets Boot your ISO on your machine!

## Step 1: Initial Setup

Before delving into the installation process, there are a few critical preliminary steps to ensure a smooth Gentoo Linux installation:

### Choose Keyboard Layout

As you boot up the Gentoo Linux ISO, your first decision is to select the appropriate keyboard layout. The default setting is a US keyboard layout. To confirm this choice, simply press Enter.

### Verify Internet Connectivity
```bash
ping gentoo.org
```
To begin the Gentoo installation, it's crucial to confirm that you have a working internet connection. You can quickly check this by running the following command. A successful response indicates that your network connection is functional and ready for the installation process.

### List Available Block Devices
```bash
lsblk
```
To proceed with the installation, you need to identify the specific storage device where you'll install Gentoo. The `lsblk` command provides a comprehensive list of available block devices on your system. Take note of the device you intend to use for the Gentoo installation.

### Initialize GPT Partition Table

Now, let's initialize the GUID Partition Table (GPT) on your chosen device:

```bash
gdisk /dev/vda
```

Once inside the `gdisk` utility, follow these steps:

1. Type "o" to create a new GPT partition table. Please note that this action will erase all existing data on the selected device.

2. Press "n" to create a new partition. Specify the partition type as "ef00" (EFI system partition) and allocate a size of at least +1G. This partition is essential for EFI booting.

3. Use "n" once more to create another partition. Search for "swap" by specifying the code "8200" and allocate at least +10G in size for the swap partition.

4. Again, press "n" to create a partition. This time, allocate the remaining space for it. This partition will serve as the root filesystem.

5. Confirm the partition table by typing "p" to review its contents. Ensure that all partitions have been created correctly.

6. If everything appears as expected, save your changes by typing "w." This action will write the new partition table to all partitions.

When defining partition sizes during GPT initialization, the `+` notation allows you to add space to the existing size.

Upon completion, your partition layout should resemble the following example (based on my configuration):

| Number   | Size                 | Code | Name                 |
|----------|----------------------|------|----------------------|
| 1 (vda1) | +1G (1024.0MiB)      | ef00 | EFI system partition |
| 2 (vda2) | +10G (9.0 GiB)      | 8200 | Linux swap           |
| 3 (vda3) | All Remaining Space (90.0 GiB) | 8300 | Linux filesystem     |

This sets the stage for the partitioning of your device to host the Gentoo Linux installation.

## Step 2: Partitioning

In this step, you will create and format the necessary partitions for your Gentoo installation. These partitions will serve distinct roles, including EFI booting, housing the core filesystem, and providing swap space.

### Format EFI Partition

To ensure your system supports EFI booting, the EFI partition needs to be correctly formatted with the FAT32 file system. Use the following command:

```bash
mkfs.fat -F32 /dev/vda1
```

This command prepares the EFI partition (/dev/vda1) with the FAT32 file system, a requirement for EFI-based booting.

### Format Root Partition

The root partition is where the core Gentoo filesystem will reside. Format it with the Btrfs file system using this command:

```bash
mkfs.btrfs /dev/vda3
```

By running this command, you're configuring the root partition (/dev/vda3) with the Btrfs file system, a modern and flexible choice for managing your Gentoo installation.

### Create Swap Partition

Swap space is essential for memory management in your system. Begin by initializing the swap partition with this command:

```bash
mkswap /dev/vda2
```

This command prepares the swap partition (/dev/vda2) for use in your Gentoo system.

### Enable Swap

Activate the swap partition to make it available for use in your system:

```bash
swapon /dev/vda2
```

This step ensures that your Gentoo installation can effectively manage system memory.

### Create a Mount Point

Before proceeding, create the required directory structure for your Gentoo filesystem:

```bash
mkdir --parents /mnt/gentoo
```

This command establishes the necessary directory structure within the `/mnt` directory, specifically the `/mnt/gentoo` directory, which will serve as the mount point for your Gentoo installation.

### Mount the Root Partition

Now, it's time to associate the root partition with the mount point:

```shell
mount /dev/vda3 /mnt/gentoo
```

By executing this command, you're linking your Gentoo root partition (/dev/vda3) with the `/mnt/gentoo` directory. This association allows you to access and configure the contents of your Gentoo installation within this directory. It's a pivotal step in setting up your Gentoo Linux system.

## Step 3: Setting the System Clock

```bash
date <MMDD><HHMM><YYYY>
```
Set the system clock to the current date and time by replacing `<MMDD><HHMM><YYYY>` with the appropriate values.

## Step 4: Downloading the Stage3 Tarball

### Navigate to the Installation Directory

Begin by changing your working directory to `/mnt/gentoo`, which is where you'll install Gentoo. This location serves as the foundation for your Gentoo Linux system.

```bash
cd /mnt/gentoo
```

### Download the Stage3 Tarball

The Stage3 tarball is a crucial component of your Gentoo installation, containing the base system files. To obtain it, we'll use the text-based web browser called `links`. Follow these steps to access the official Gentoo website and download the Stage3 tarball tailored to your architecture:

1. Launch `links` by typing `links` into the terminal and pressing Enter.

2. In `links`, enter `g` to access the URL prompt, and then type the URL for [gentoo.org](https://www.gentoo.org/).

3. Once you've entered the Gentoo website, navigate to the Stage3 tarball download section. Look for the appropriate Stage3 OpenRC file corresponding to your architecture (e.g., amd64).

4. Select the desired tarball file, initiate the download process, and save it to your system.

5. After the download completes successfully, exit the `links` program by pressing `ctrl+c`.

With these actions, you've obtained the necessary Stage3 tarball, a foundational component for your Gentoo Linux installation. This tarball provides the core system files required to build and customize your Gentoo environment.

## Step 5: Configuring make.conf

### Extract the Tarball
```bash
tar xpvf stage3-*.tar.xz --xattrs-include='*.*' --numeric-owner
```
Unpack the contents of the Stage3 tarball using this command. This action prepares the foundation for your Gentoo system.

### Edit make.conf
```bash
nano /mnt/gentoo/etc/portage/make.conf
```
Open the `make.conf` file for customization. This file holds essential configuration options for the Portage package manager, allowing you to tailor your system to your needs.

### Configure Compiler Flags
```bash
COMMON_FLAGS="-march=native -O2 -pipe"
FEATURES="candy parallel-fetch parallel-install"
MAKEOPTS="-j20"
```
Within `make.conf`, you can set compiler flags to optimize system performance. Adjust these flags to match your CPU architecture and preferences.

#### Explain how this work

In Gentoo Linux, the `make.conf` file is a crucial configuration file that allows you to optimize the compilation and performance of software packages. It contains several settings that you can customize to match your specific hardware and preferences.

#### `COMMON_FLAGS="-march=native -O2 -pipe"`

- `-march=native`: This flag instructs the compiler to generate code tailored to your system's CPU architecture. It automatically detects your CPU type during compilation, optimizing performance. However, it may result in code that's less portable.
- `-O2`: This flag sets the optimization level for the compiler. `-O2` is a balanced level that enhances code execution speed without excessively increasing compilation time. Higher levels like `-O3` offer more aggressive optimization but can lead to longer compile times.
- `-pipe`: Enabling this flag makes the compilation process more efficient by using pipes instead of temporary files for communication between different compilation stages. This can reduce disk I/O and speed up compilation.

#### `FEATURES="candy parallel-fetch parallel-install"`

- `candy`: This appears to be a custom or project-specific feature and might not be standard in all Gentoo installations. It may relate to additional optimizations or features specific to your Gentoo setup.
- `parallel-fetch`: When enabled, this feature allows Portage (Gentoo's package manager) to download source code and files for packages in parallel. It significantly speeds up the package installation process, especially for packages with multiple source files.
- `parallel-install`: Enabling this feature lets Portage install multiple packages concurrently. This is particularly beneficial on systems with multiple CPU cores, as it can reduce the time needed to install software.

#### `MAKEOPTS="-j20"`

- `-j20`: This flag specifies the number of parallel compilation jobs that Portage can run simultaneously. In this case, it allows up to 20 parallel jobs. The value you set for `-j` should align with the number of CPU cores in your system. Using too many jobs can lead to resource contention, while using too few may not fully utilize your hardware. Adjust this value based on your specific system's capabilities.

These settings in `make.conf` empower you to fine-tune the compilation process on your Gentoo system, resulting in optimized software performance and efficient resource utilization. While the provided values are suitable for many setups, you can adjust them to better match your hardware and preferences.

## Step 6: Repository Configuration

### Create the repos.conf Directory

```bash
mkdir --parents /mnt/gentoo/etc/portage/repos.conf
```

In this step, we create the `repos.conf` directory within the `/mnt/gentoo/etc/portage/` path. This directory is essential for managing repository configurations for Portage, Gentoo's package manager. It allows you to define additional package repositories beyond the default ones.

### Copy Default Repository Configuration

```bash
cp /mnt/gentoo/usr/share/portage/config/repos.conf /mnt/gentoo/etc/portage/repos.conf/gentoo.conf
```

Here, we copy the default Gentoo repository configuration file, which is typically located in `/usr/share/portage/config/repos.conf`, to the specific location `/mnt/gentoo/etc/portage/repos.conf/gentoo.conf`. This action duplicates the initial repository settings to ensure that Gentoo's package manager knows where to find software packages.

## Step 7: Network Configuration

### Copy the Host System's resolv.conf

```bash
cp --dereference /etc/resolv.conf /mnt/gentoo/etc/
```

The `/etc/resolv.conf` file on the host system contains DNS resolver configuration, which is vital for domain name resolution. By copying it to `/mnt/gentoo/etc/`, we make sure that the Gentoo environment can also resolve domain names correctly. This step helps maintain consistent and reliable internet connectivity within the Gentoo installation.

## Step 8: Mounting System Directories

In this section, we mount essential system directories within the Gentoo environment. These directories play critical roles in the functioning of the Linux system.

### Mount /proc

```bash
mount --types proc /proc /mnt/gentoo/proc
```

The `/proc` directory provides a virtual filesystem that exposes information about running processes and the kernel's internal state. Mounting it within the Gentoo environment is essential for various system utilities and commands to retrieve process-related information.

### Mount /sys

```bash
mount --rbind /sys /mnt/gentoo/sys
mount --make-rslave /mnt/gentoo/sys
```

The `/sys` directory offers a view into the kernel's internal data structures and provides a way to interact with device drivers and kernel parameters. By mounting `/sys` with the `--rbind` option and making it a slave of `/mnt/gentoo/sys`, we ensure that the Gentoo environment can access kernel and hardware information, facilitating system configuration and management.

### Mount /dev

```bash
mount --rbind /dev /mnt/gentoo/dev
mount --make-rslave /mnt/gentoo/dev
```

The `/dev` directory is crucial for device interaction. It contains special files representing hardware devices and facilitates device-related operations. Mounting `/dev` with the `--rbind` option and making it a slave of `/mnt/gentoo/dev` ensures that the Gentoo environment can access and manage devices effectively.

### Mount /run

```bash
mount --bind /run /mnt/gentoo/run
mount --make-slave /mnt/gentoo/run
```

The `/run` directory is essential for the proper functioning of various system services and daemons. It stores runtime information, including sockets and process IDs. Mounting `/run` and making it a slave of `/mnt/gentoo/run` ensures that system services within the Gentoo environment can operate as expected, contributing to a smoothly running system.

## Step 9: Chrooting into the New Environment

### Enter the Chroot Environment

```bash
chroot /mnt/gentoo /bin/bash
source /etc/profile
```

In this step, we perform a process called "chrooting," which stands for "change root." It allows us to transition into the newly installed Gentoo environment as if it were our root directory. The commands are as follows:

- `chroot /mnt/gentoo /bin/bash`: This command specifies the Gentoo installation at `/mnt/gentoo` as the new root directory and starts a new interactive Bash shell within that environment. Now, any further commands we execute will affect the Gentoo environment, not the host system.

- `source /etc/profile`: After entering the chroot environment, we load the system-wide profile settings from `/etc/profile`. This step ensures that all necessary environment variables and system configurations are in place, allowing us to work effectively within the Gentoo system.

## Step 10: EFI Partition (UEFI Users)

### Create the EFI Directory

```bash
mkdir /efi
```

For users installing Gentoo on a UEFI (Unified Extensible Firmware Interface) system, creating the EFI directory is a crucial preparatory step. Here's what each component means:

- `mkdir /efi`: This command creates a directory named "efi" at the root of the file system. This directory will serve as the mounting point for the EFI system partition (ESP).

UEFI-based systems use the EFI system partition to store bootloader files and related information required for the boot process. By creating this "efi" directory, we establish the location where we will later mount the EFI partition.

### Mount the EFI Partition

```bash
mount /dev/vda1 /efi
```

After creating the "efi" directory, we proceed to mount the EFI partition onto this directory. Here's what's happening:

- `mount /dev/vda1 /efi`: This command instructs the system to mount the EFI partition, which is typically identified as `/dev/vda1`, onto the `/efi` directory. Mounting the EFI partition in this way ensures that the UEFI firmware can locate and access the necessary bootloader files and configuration data during the system's boot process.

In summary, this step is crucial for UEFI-based systems, as it sets up the directory structure and mounting point needed for successful UEFI booting, allowing Gentoo Linux to start correctly in such environments.

## Step 11: Initial Configuration

In this step, you'll perform the initial configuration tasks to prepare your Gentoo Linux system for optimal operation. Let's break down each action:

### Synchronize Portage Tree

```bash
emerge-webrsync
```

- The `emerge-webrsync` command is essential for keeping your Gentoo system up to date. It initiates the synchronization of the Portage tree, a critical component that manages packages and their metadata. By synchronizing the Portage tree, you ensure that your system has access to the latest package information and updates. Keep in mind that this process may take some time, so consider using this period for a break or a meal.

### Read Gentoo News

```bash
eselect news read
```

- Once the Portage tree synchronization is complete, you can use the `eselect news read` command to stay informed about important Gentoo news. This command provides access to updates and information regarding changes in the Gentoo system. Staying up-to-date with Gentoo news is crucial for understanding system updates and potential issues.

### Update the System Profile

```bash
eselect profile list
```

- The `eselect profile list` command displays a list of available system profiles. System profiles define various settings and configurations for your Gentoo system. You can choose from different profiles based on your requirements.

```bash
eselect profile set 5
```

- Use the `eselect profile set` command to select a specific system profile that aligns with your preferences. The number associated with this command (in this case, "5") represents the profile you wish to set. Keep in mind that the available profiles may vary, so select the one that best suits your needs.

```bash
eselect profile list
```

- After setting the profile, it's essential to verify that the correct profile has been selected. Confirming the profile ensures that your Gentoo system is configured as intended and aligns with your chosen specifications.

## Step 12: Updating the System

Update the system, which means all packages. If a new version of the package is found, it will be compiled at this time, so this process may take some time. You may want to use this time to take a break or have a meal.

### Update the System

```bash
emerge --ask --verbose --update --deep --newuse @world
```

- `emerge --ask --verbose --update --deep --newuse @world`: This command performs a comprehensive system update. It includes updating all installed packages, resolving dependencies, and considering any new USE flags (`--newuse`). Updating the entire system helps keep it up to date with the latest software versions and security patches.

### Cleanup

```bash
emerge --depclean
```

- `emerge --depclean`: After the system update, this command removes any unnecessary dependencies and packages from your Gentoo system. Cleaning up unused packages helps free up disk space and optimize your system's performance.

In summary, these steps ensure that your Gentoo system is properly configured, up to date, and optimized for performance. They are essential for maintaining a healthy and well-functioning Gentoo Linux environment.

## Step 15: Licensing

### Edit make.conf Once More

```bash
nano /etc/portage/make.conf
```

- `nano /etc/portage/make.conf`: Reopen the `make.conf` file for additional configuration.

### Set ACCEPT_LICENSE

```bash
ACCEPT_LICENSE="*"
```

- `ACCEPT_LICENSE="*"`: Configure the `ACCEPT_LICENSE` variable to accept all licenses for packages. This setting allows you to install any software, regardless of its license. Be cautious about the licenses of the software you install, as some licenses may have specific requirements.

## Step 16: Time Zone Configuration

### List Available Time Zones

```bash
ls /usr/share/zoneinfo/
```

- `ls /usr/share/zoneinfo/`: List the available time zones to choose from. You'll select the one that corresponds to your region.

### Set Time Zone

```bash
echo "Asia/Taipei" > /etc/timezone
```

- `echo "Asia/Taipei" > /etc/timezone`: Specify your preferred time zone. In this example, "Asia/Taipei" is used. This setting ensures that your system displays the correct local time.

```bash
emerge --config sys-libs/timezone-data
```

- `emerge --config sys-libs/timezone-data`: Configure the time zone data to align with your chosen time zone. This step ensures that your system's time settings are accurate.

## Step 17: Locale Configuration

### Edit locale.gen

```bash
nano /etc/locale.gen
```

- `nano /etc/locale.gen`: Open the `locale.gen` file to enable the desired locales for your system. Locales define language and regional settings.

### Generate Locales

```bash
locale-gen
```

- `locale-gen`: Generate the locales specified in the `locale.gen` file. These locales support different languages and regional settings, allowing you to configure your system for multiple languages if needed.

```bash
eselect locale list
```

- `eselect locale list`: List the available locales to verify that the desired locales have been successfully generated. This step helps confirm that your system can support your chosen language and region.

### Set Default Locale

```bash
eselect locale set 6
```

- `en_US.utf8`: Set the default locale to "en_US.utf8" in this example. "en_US.utf8" are located on `6 ` ,Adjust this setting according to your language and regional preferences.

```bash
source /etc/profile
env-update
```

- `source /etc/profile`: Update the environment variables to apply the changes made to the system's locale settings. This ensures that your system uses the specified language and regional settings correctly.

These steps allow you to customize your Gentoo system's language, regional settings, and CPU-specific optimizations to create a tailored computing environment.

## Step 18: Firmware and Kernel

### Install Firmware

```bash
emerge --ask sys-kernel/linux-firmware
```

- `emerge --ask sys-kernel/linux-firmware`: Start by installing essential firmware packages required to ensure effective hardware support. These packages provide the necessary firmware files for various hardware components.

```bash
emerge --ask sys-firmware/intel-microcode
```

- `emerge --ask sys-firmware/intel-microcode`: If you have an Intel CPU, consider installing Intel microcode updates. These updates enhance CPU performance and security by addressing microcode vulnerabilities. Ensure that your CPU is supported before installing this package.

### Install Gentoo Kernel

```bash
emerge --ask sys-kernel/gentoo-kernel
```

- `emerge --ask sys-kernel/gentoo-kernel`: Install the Gentoo kernel, a critical component of your Gentoo Linux system. The kernel serves as the core of the operating system, providing essential hardware support and system functionality.

```bash
eselect kernel list
```

- `eselect kernel list`: List the available kernels to help you select the appropriate one for your system. This step is crucial to ensure that you choose the correct kernel configuration that matches your hardware and requirements.

## Step 19: Filesystem Configuration

### Edit /etc/fstab

```bash
nano /etc/fstab
```

- `nano /etc/fstab`: Open the `/etc/fstab` file for editing. This file contains information about how various partitions are mounted and used by your system.

```bash
# EFI Partition
/dev/vda1   /efi        vfat    defaults    0 2
# Swap Partition
/dev/vda2   none        swap    sw          0 0
# Root Partition
/dev/vda3   /           btrfs   defaults,noatime  0 1
```

Add entries for different partitions to the `/etc/fstab` file:
  - `/dev/vda1` is mounted at `/efi` with a VFAT filesystem.
  - `/dev/vda2` is used as a swap partition.
  - `/dev/vda3` is mounted as the root directory with a Btrfs filesystem and specified mount options.

  Adjust these entries according to your disk partitioning and filesystem choices.

## Step 21: Setting Network Information

In this step, you will configure network-related settings to ensure proper communication and connectivity on your Gentoo Linux system. Each command provided is independent of the others.

### Edit the Hosts File

```shell
nano /etc/hosts
```

- `nano /etc/hosts`: Use this command to open and edit the `/etc/hosts` file. This file is responsible for mapping hostnames to IP addresses and is crucial for network communication.

Add the following lines to the file:

```shell
127.0.0.1   gentoo   localhost
::1         localhost
```

These lines define the loopback address (`127.0.0.1`) and the IPv6 loopback address (`::1`) with corresponding hostnames. The "gentoo" hostname is associated with the loopback address.

### Set the Hostname

```shell
echo gentoo > /etc/hostname
```

- `echo gentoo > /etc/hostname`: Use this command to set the hostname of your Gentoo system. In this example, the hostname is set to "gentoo." Make sure to replace "gentoo" with your desired hostname if needed.

### Install and Configure DHCP

```shell
emerge --ask net-misc/dhcpcd
```

- `emerge --ask net-misc/dhcpcd`: This command installs `dhcpcd`, a DHCP (Dynamic Host Configuration Protocol) client, which is essential for automatically configuring network interfaces.

```shell
rc-update add dhcpcd default
```

- `rc-update add dhcpcd default`: Add `dhcpcd` to the list of services that start automatically at boot. This ensures that the DHCP client service runs during system startup, enabling automatic network configuration.

```shell
rc-service dhcpcd start 
```

- `rc-service dhcpcd start`: Use this command to start the `dhcpcd` service immediately. It will configure network interfaces and establish network connectivity.

By following these steps, you've configured network-related settings on your Gentoo Linux system, including hostname setup, host file editing, and the installation and configuration of a DHCP client for automatic network configuration. Your system should now be ready to communicate over the network.

## Step 22: Network Configuration

### Identify Network Interfaces

```bash
ifconfig -a
```

- `ifconfig -a`: Use this command to identify the names of available network interfaces on your system. It displays both active and inactive interfaces, helping you determine the correct interface name.

### Configure Network Interfaces

```bash
nano /etc/conf.d/net
```

- `nano /etc/conf.d/net`: Edit the network interface configurations in the `/etc/conf.d/net` file to suit your specific requirements. For example, you can set up DHCP for your Ethernet interface or configure static IP addresses if needed.

Here's an example configuration:

```shell
config_enp1s0="dhcp"
```

Replace "enp1s0" with the actual name of your network interface and configure it for DHCP or static IP as necessary.

### Create a Symbolic Link

```bash
cd /etc/init.d/
ln -s net.lo net.enp1s0
```

- `cd /etc/init.d/`: Change to the `/etc/init.d/` directory for managing system services.

- `ln -s net.lo net.enp1s0`: Create a symbolic link named `net.enp1s0`. Replace "enp1s0" with the name of the network interface you identified earlier. This link simplifies the management of your network interface.

```bash
rc-update add net.enp1s0 default
```

- `rc-update add net.enp1s0 default`: Ensure that the network interface starts automatically with the system by adding it to the default runlevel. Make sure to use the correct interface name for your system configuration.

These steps are crucial for configuring your network interface, making sure it starts correctly at boot, and establishing a stable and functional Gentoo Linux network environment.

## Step 24: Setting the Root Password

Securing your Gentoo system starts with setting a strong and secure root password. The root account is a powerful administrative account that should only be accessed by authorized users when necessary. Follow these steps to set the root password:

### Set Root Password

To set a secure root password, use the `passwd` command:

```bash
passwd
```

After entering this command, you'll be prompted to enter and confirm your new root password. Make sure to choose a password that is both strong and memorable. A strong password typically includes a combination of uppercase and lowercase letters, numbers, and special characters. It's important to keep this password confidential and not share it with unauthorized users.

Setting a strong root password is a critical security measure for your Gentoo system, as it helps protect your system from unauthorized access and ensures that only trusted users can perform administrative tasks.

## Step 27: File System Support

To effectively manage various filesystems on your Gentoo system, it's important to have the necessary tools and utilities installed. This step focuses on installing `sys-fs/btrfs-progs` and `sys-fs/dosfstools` to support Btrfs and DOSFAT filesystems, respectively. Follow these instructions to ensure you have the required filesystem support:

### Install Btrfs Tools

[Btrfs](https://btrfs.readthedocs.io/en/latest/) is a modern and feature-rich filesystem that offers benefits like snapshots and data integrity. To manage Btrfs filesystems on your Gentoo system, you'll need the `btrfs-progs` package. Use the following command to install it:

```bash
emerge -av sys-fs/btrfs-progs
```

This command will install the Btrfs tools, enabling you to create, manage, and maintain Btrfs filesystems on your Gentoo installation.

### Install DOSFAT Tools

DOSFAT (also known as FAT) is a filesystem format commonly used for removable storage devices such as USB drives and SD cards. To interact with DOSFAT filesystems on your Gentoo system, you'll need the `dosfstools` package. Use the following command to install it:

```bash
emerge -av sys-fs/dosfstools
```

Installing `dosfstools` provides utilities like `mkfs.fat` for formatting DOSFAT filesystems and `fsck.fat` for checking and repairing them.

With both `sys-fs/btrfs-progs` and `sys-fs/dosfstools` installed, your Gentoo system will have comprehensive filesystem support, allowing you to work with a variety of filesystem formats as needed. This flexibility is essential for managing data on different storage devices and maintaining the integrity of your files.

## Step 28: Configuring the GRUB Bootloader

Configuring the GRUB bootloader is a crucial step in setting up your Gentoo Linux system for booting. GRUB (GRand Unified Bootloader) is responsible for managing the boot process and allows you to choose which operating system to start. In this step, we'll configure and install GRUB for your Gentoo installation.

### Edit make.conf for GRUB

First, we need to specify the GRUB platform as "efi-64" in your `make.conf` file. This is essential for systems that use EFI for booting. To do this, execute the following command:

```bash
echo 'GRUB_PLATFORMS="efi-64"' >> /etc/portage/make.conf
```

This command appends the `GRUB_PLATFORMS` setting to your `make.conf` file, ensuring that GRUB is configured correctly for EFI booting.

### Install GRUB

Now that we've configured GRUB, we need to install it on your system. Use the following command to install the GRUB bootloader:

```bash
emerge --ask --verbose sys-boot/grub
```

This command tells Gentoo's package manager, Portage, to install the `sys-boot/grub` package, which includes the GRUB bootloader.

#### Install GRUB to the EFI Partition

To ensure that your system can boot using the UEFI firmware, we'll install GRUB to the EFI partition. Use the following command to accomplish this:

```bash
grub-install --target=x86_64-efi --efi-directory=/efi
```

This command installs GRUB for the x86_64 EFI target architecture and specifies the EFI directory as `/efi`. It ensures that the necessary GRUB files are placed in the EFI partition, making them accessible to the UEFI firmware during the boot process.

#### Generate the GRUB Configuration File

The final step in configuring GRUB is to generate the GRUB configuration file, `grub.cfg`. This file contains the menu entries and settings required for booting into your Gentoo installation. Use the following command to generate the configuration file:

```bash
grub-mkconfig -o /boot/grub/grub.cfg
```

This command creates the `grub.cfg` file in the `/boot/grub` directory. It detects the installed operating systems and generates a boot menu based on the available options.

With these configurations and tools in place, your Gentoo Linux system is well-prepared for use. The GRUB bootloader is set up to handle the boot process, allowing you to select Gentoo Linux or other operating systems when you start your computer. You're now ready to finalize the installation and configure your user account.

## Step 30: Unmounting Partitions

As you near the completion of your Gentoo Linux installation, it's essential to unmount the various partitions and directories associated with the installation process. This ensures that your system is prepared for a clean and successful reboot.

```shell
exit
cd ~
```

### Unmounting Specific Directories

To begin, unmount specific directories within the Gentoo installation by executing the following command:

```bash
umount -l /mnt/gentoo/dev{/shm,/pts,}
```

- `umount -l /mnt/gentoo/dev{/shm,/pts,}`: This command unmounts several directories within the Gentoo installation, including `/dev`, `/dev/shm`, and `/dev/pts`. Unmounting these directories is essential to detach them from the installation environment.

### Unmounting the Entire Gentoo Installation

Next, unmount the entire Gentoo installation from the `/mnt/gentoo` directory using the following command:

```bash
umount -R /mnt/gentoo
```

- `umount -R /mnt/gentoo`: This command recursively unmounts all filesystems and directories within the `/mnt/gentoo` directory. It ensures that every component of the Gentoo installation is properly detached from the system.

## Step 31: Reboot Your System

With all the necessary unmounting completed, it's time to reboot your system to initiate the use of the newly installed Gentoo Linux.

```bash
reboot
```

- `reboot`: Execute this command to reboot your system gracefully. After the reboot, you'll encounter the GRUB menu, which allows you to select your desired operating system. Use the arrow keys to highlight "Gentoo" and then press Enter to boot into your freshly installed Gentoo Linux system.

Rebooting is the final step in the installation process, and once your system restarts, you'll have access to your new Gentoo Linux environment. Congratulations on successfully installing Gentoo!

![Grub has been installed!](/blog/linux/Gentoo/grub-done.png)

## Step 32: Post-Installation

Congratulations! Your Gentoo Linux system is now successfully installed. During the installation process, you used the root account for all configuration tasks. However, it's important to create a dedicated user account for your day-to-day use to enhance the security and manageability of your system.

### Create a User Account

To create a new user account, and for added security and convenience, follow these steps. Replace `<username>` with your desired username:

```bash
# Create a new user with necessary group memberships and set the shell to /bin/bash
useradd -m -G users,wheel,audio -s /bin/bash <username>
```

- `useradd -m -G users,wheel,audio -s /bin/bash <username>`: This command creates a new user account with the specified username (`<username>`) and assigns it to the necessary groups, including "users," "wheel," and "audio." The `-m` flag ensures that a home directory is created for the user, and the `-s /bin/bash` flag sets the user's default shell to `/bin/bash`.

Next set the password of username

```shell
passwd <username> 
```

### Install `sudo` for Administrative Tasks

By default, Gentoo doesn't come with `sudo` pre-installed. However, `sudo` is a valuable tool for performing administrative tasks with elevated privileges. To install `sudo`, follow these instructions:

```bash
emerge -av sudo
```

This command will install `sudo` on your system, allowing you to execute administrative commands securely. With `sudo`, you can perform tasks like package management and system configuration without needing to log in as the root user.

### Set sudo Configuration

To configure sudo access for your newly created user, follow these steps:

```bash
visudo
```

- `visudo`: Use the `visudo` command to safely edit the sudoers file, which controls who has access to administrative privileges through `sudo`.

Within the sudoers file, locate the line `%wheel ALL=(ALL) ALL` and uncomment it by removing the `#` symbol at the beginning of the line. This action allows users in the "wheel" group to execute commands with sudo privileges:

```bash
# Uncomment the line below to allow users in the wheel group to execute commands with sudo privileges
%wheel ALL=(ALL) ALL
```

Next, this is recommend to do, apply a flag `Defaults timestamp_timeout=0` in the sudoers file to time after you wait for the time after entering sudo.

```bash
Defaults timestamp_timeout=0
```

After completing this step, you have a complete daily user. However, you do n’t have to wait when you need to enter the instructions after each sudo. The time is 0 seconds.

### Switch to the New User

To complete the user setup and start using your new user account, switch to the newly created user with the following command:

```bash
# Switch to the newly created user
su - <username>
```

By creating a new user account, uncommenting the `%wheel ALL=(ALL) ALL` line in the sudoers file, and setting `Defaults timestamp_timeout=0`, you've significantly enhanced the security of your Gentoo Linux system. Users in the "wheel" group will have the ability to execute commands with sudo privileges, and a password will be required every time `sudo` is used, providing an extra layer of security for your system.

## Final: Install Additional Software

As you finalize your Gentoo Linux installation, there are some important packages you may want to add to enhance your system's functionality and convenience. Here's a step-by-step guide to installing these packages:

### 2. Install `neofetch` for System Information

`neofetch` is a handy utility that provides detailed information about your Gentoo system in a visually appealing way. To install `neofetch`, use the following command:

```bash
emerge -av neofetch
```

Once installed, you can run `neofetch` to quickly view system information, including your distribution, kernel version, CPU, memory, and more. It's a useful tool for getting an overview of your system's configuration.

![neofetch](/blog/linux/Gentoo/neofetch.png)

### 3. Install CPUID2CPUFLAGS for CPU Optimization

Optimizing software performance for your specific CPU architecture is essential for getting the most out of your hardware. The `CPUID2CPUFLAGS` utility helps identify CPU-specific flags, which are crucial for compiling software tailored to your CPU. To install it, use this command:

```bash
emerge --ask app-portage/cpuid2cpuflags
```

After installation, run the following command to determine the CPU flags specific to your system:

```bash
cpuid2cpuflags
```

This utility detects your CPU's capabilities and outputs the appropriate flags. These flags will be used during package compilation to ensure optimized performance.

To configure Gentoo to use these CPU flags for all packages, create a file named `00cpu-flags` in the `/etc/portage/package.use/` directory:

```bash
echo "*/* $(cpuid2cpuflags)" > /etc/portage/package.use/00cpu-flags
```

This file specifies the CPU flags for all packages, ensuring that software is compiled to take full advantage of your CPU's capabilities.

### 4. Install `sysklogd` for System Logging

System logging is crucial for keeping track of system events and activities. `sysklogd` is a reliable tool for managing system logs. To install it, run the following command:

```bash
emerge --ask app-admin/sysklogd
```

After installation, add `sysklogd` to the list of services that start automatically at boot with the following command:

```bash
rc-update add sysklogd default
```

By doing this, `sysklogd` will begin capturing log messages from the early stages of system startup, providing you with a comprehensive record of system events.

### 5. Install `chrony` for Time Synchronization

Accurate timekeeping is crucial for various system functions and services. `chrony` is a reliable tool for time synchronization. To install it, use the following command:

```bash
emerge --ask net-misc/chrony
```

Once `chrony` is installed, add it to the startup services to ensure that your system's time stays accurate:

```bash
rc-update add chronyd default
```

`chronyd` will synchronize your system's time with time servers on the internet, helping to maintain accurate time for various system operations.

### 6. Install `wireless-tools` for Wi-Fi Management (Optional)

If you use Wi-Fi for your network connection, installing `wireless-tools` can be helpful for managing wireless networking. However, if you prefer using a wired LAN connection or don't need Wi-Fi support, you can skip this step.

To install `wireless-tools`, use the following command:

```bash
emerge -av wireless-tools
```

These additional software installations will enhance your Gentoo Linux system, providing you with greater flexibility, system information visibility, and optimization options. Customizing your system with these packages helps tailor it to your specific needs and preferences.

## Conclusion

Congratulations! You've successfully installed Gentoo Linux with the XFCE desktop environment using the OpenRC init system. This installation process, although detailed, provides you with a highly customizable and optimized Linux system tailored to your specific needs.

Throughout this comprehensive guide, you've learned how to:

1. Set up the initial environment and prerequisites.
2. Create and format partitions.
3. Set up the system clock and download the Stage3 tarball.
4. Configure important files like `make.conf` and `/etc/fstab`.
5. Set the hostname and configure network settings.
6. Install essential software and firmware.
7. Configure the bootloader (GRUB for UEFI systems).
8. Complete post-installation tasks such as creating a new user and configuring sudo.

Additionally, you've explored the steps required to install a desktop environment, specifically XFCE, along with essential tools like `neofetch`.

Gentoo Linux's source-based package management system, Portage, allows you to fine-tune your system to your liking and keep it up to date. While the installation process may be intricate, the result is a highly customizable and efficient Linux distribution that can be tailored to your specific use cases.

Now that you've completed the installation, take the time to explore Gentoo further, install your favorite applications, and continue to customize your Linux environment to suit your needs. Gentoo offers endless possibilities, making it a powerful choice for Linux enthusiasts and advanced users.

Happy computing with your newly installed Gentoo Linux system!

### What I want to say

Installing Gentoo for the first time was quite an experience. It wasn't particularly difficult to set up, but what did catch me off guard was the extensive compilation process that spanned over half a day. Personally, I have a preference for compiling over using pre-built packages, but it really comes down to your own preferences.

However, one thing that stands out about this distribution is its perfection, especially for those well-versed in Linux. For the average user, though, it might not be the first choice. I'd like to highlight that installing Gentoo is quite time-consuming. To put it in perspective, while you can have Arch Linux up and running in about 10 minutes, Gentoo will easily take you half a day to get everything set up. It's a labor of love for sure.


Finally I want to say:

```shell
btw i use Arch and Gentoo!
```

-- Arch & Gentoo user


### What's next? 

It's time to give Linux From Scratch (LFS) a shot! If Gentoo represents a high-level installation process and Arch falls into the intermediate category, LFS takes it to an entirely different level. This is a full-fledged installation of Linux from scratch, starting from ground zero.

Become a Linux master!

![LFS](https://heshambahram.com/wp-content/uploads/2018/06/Linux-From-Scratch-1024x652.jpg)

## References

- [Ultimate guide to installing Gentoo Linux for new users](https://onion.tube/watch?v=_50MJv4Dc40)
- [Gentoo AMD64 Handbook](https://wiki.gentoo.org/wiki/Handbook:AMD64)