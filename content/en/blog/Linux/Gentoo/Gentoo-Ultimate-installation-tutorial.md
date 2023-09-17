---
author: "Arcsly"
title: "A Comprehensive Guide to Installing Gentoo Linux (XORG, XFCE and Open-RC)"
description: "Gentoo Linux with our comprehensive guide. Learn how to install Gentoo with XFCE and OpenRC, covering every step from initial setup to post-installation configuration. This hands-on tutorial empowers you to create a highly customizable and powerful Gentoo Linux environment."
tags: ["xfce", "Gentoo", "Linux"]
date: 2023-09-16T17:30:34+0800
thumbnail: https://upload.wikimedia.org/wikipedia/commons/e/ee/Deus_Gentoo_linux.png
lastmod: 2023-09-17T17:10:30+0800
---

## Introduction

Gentoo Linux is a distribution known for its flexibility, performance, and robustness. In this comprehensive guide, we will walk you through the process of installing Gentoo Linux step by step. By the end of this tutorial, you will have a fully functional Gentoo Linux system ready for your customization.

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

### Test Internet Connectivity
```bash
ping gentoo.org
```
Begin your Gentoo installation by checking your internet connectivity. This simple command tests whether you have a functioning internet connection. If you receive a response, it indicates that your network is up and running.

### List Block Devices
```bash
lsblk
```
To proceed with the installation, you'll need to identify the target device where you intend to install Gentoo. The `lsblk` command provides a clear list of available block devices on your system. Take note of the device you plan to use for the installation.

### Initialize GPT Partition Table

```bash
gdisk /dev/vda
```

Inside `gdisk`, follow these steps:

1. Type "o" to create a GPT partition table. Be aware that this operation will format all existing files on the selected device.

2. Type "n" to create a new partition. Specify "ef00" as the partition type and allocate +1G in size. This partition is intended for EFI.

3. Type "n" again to create another partition. Search for "swap" by type, and allocate +10G in size for the swap partition.

4. Once more, type "n" to create a partition, but this time, allocate the remaining space to it. This partition will be used for the root file system.

5. To confirm the partition table, type "p" to view it. Ensure that it has been created correctly.

6. If everything looks correct, type "w" to write the changes to all partitions.

Using the `+` notation allows you to add space to the existing size when defining partition sizes during the GPT partition table initialization.

## Step 2: Partitioning

With the initial setup complete, it's time to create the necessary partitions for Gentoo. These partitions will serve specific purposes, such as EFI, root, and swap.

### Format EFI Partition
```bash
mkfs.fat -F32 /dev/vda1
```
Format the EFI partition with the FAT32 file system using this command. This partition will be used for EFI booting.

### Format Root Partition
```bash
mkfs.btrfs /dev/vda3
```
Format the root partition with the Btrfs file system. This partition will house the core filesystem for your Gentoo installation.

### Create Swap Partition
```bash
mkswap /dev/vda2
```
Prepare the swap partition for use by initializing it with this command.

### Enable Swap
```bash
swapon /dev/vda2
```
Activate the swap partition, making it available for use in your system.

### Create a Mount Point
```bash
mkdir --parents /mnt/gentoo
```
Generate the necessary directory structure for mounting your Gentoo installation. This structure will be used to organize your Gentoo filesystem.

## Step 3: Setting the System Clock

```bash
date <MMDD><HHMM><YYYY>
```
Set the system clock to the current date and time by replacing `<MMDD><HHMM><YYYY>` with the appropriate values.

## Step 4: Downloading the Stage3 Tarball

### Navigate to the Installation Directory
```bash
cd /mnt/gentoo
```
Change your working directory to `/mnt/gentoo`, where you will install Gentoo.

### Download the Stage3 Tarball
```bash
links
```
Use the `links` text-based web browser to access the official Gentoo website and download the Stage3 tarball for your architecture. Follow these steps:

1. Run the command `links`.

2. Type `g`, and then enter the link to [gentoo.org](https://www.gentoo.org/).

3. In command line mode, select the Stage3 OpenRC file suitable for your architecture (e.g., amd64).

4. Download the file and save it to your system.

5. Once the download is complete, exit the `links` program using `ctrl+c`.

With these steps, you're ready to proceed with the Gentoo Linux installation process.

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

In this step, we are focusing on initializing and updating your Gentoo Linux system. Here's a breakdown of each part:

## Step 11: Initial Configuration

### Synchronize Portage Tree

```bash
emerge-webrsync
```

- `emerge-webrsync`: This command initiates the synchronization of the Portage tree. The Portage tree is a collection of files and metadata that Gentoo uses to manage packages. Synchronizing it ensures that you have access to the latest package information and updates. Keep in mind that this process may take some time, so you might want to use this time for a break or a meal.

### Read Gentoo News

```bash
eselect news read
```

- `eselect news read`: After completing the Portage tree synchronization, you can use this command to read important Gentoo news. It provides updates and information about changes in the Gentoo system. Staying informed about Gentoo news is crucial for understanding system updates and potential issues.

### Update the System Profile

```bash
eselect profile list
```

- `eselect profile list`: This command lists the available system profiles that you can choose from. System profiles define various settings and configurations for your Gentoo system.

```bash
eselect profile set 5
```

- `eselect profile set 5`: Use this command to select a specific system profile based on your preferences. The number (in this case, "5") represents the profile you want to set. The available profiles may vary, so choose the one that best suits your requirements.

```bash
eselect profile list
```

- `eselect profile list`: After setting the profile, use this command to confirm that the correct profile has been selected. Ensuring the right profile is set helps configure your Gentoo system as intended.

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

## Step 13: Customizing USE Flags

### Edit make.conf Again

```bash
nano /etc/portage/make.conf
```

- `nano /etc/portage/make.conf`: Open the `make.conf` file for further customization. This file allows you to configure USE flags, which determine the features and functionality enabled or disabled for packages during installation.

### Adjust USE Flags

```bash
USE="-gnome -kde alsa"
```

- `USE="-gnome -kde alsa"`: Modify the USE flags to tailor your system to your specific needs. In this example, the `-gnome` flag disables GNOME-related features, the `-kde` flag disables KDE-related features, and the `-alsa` flag disables ALSA sound support. Customize these flags based on your desktop environment and hardware requirements.

## Step 14: CPU Flags

### Install CPUID2CPUFLAGS

```bash
emerge --ask app-portage/cpuid2cpuflags
```

- `emerge --ask app-portage/cpuid2cpuflags`: Install the `cpuid2cpuflags` utility, which helps identify CPU-specific flags. These flags are essential for optimizing software performance for your specific CPU architecture.

### Set CPU Flags

```bash
cpuid2cpuflags
```

- `cpuid2cpuflags`: Run the `cpuid2cpuflags` command to determine the CPU flags specific to your system. This utility detects your CPU's capabilities and outputs the appropriate flags.

```bash
echo "*/* $(cpuid2cpuflags)" > /etc/portage/package.use/00cpu-flags
```

- `echo "*/* $(cpuid2cpuflags)" > /etc/portage/package.use/00cpu-flags`: Create a file (`00cpu-flags`) that specifies CPU flags for all packages. This ensures that software compiled on your system takes full advantage of your CPU's capabilities.

```bash
cat /etc/portage/package.use/00cpu-flags
```

- `cat /etc/portage/package.use/00cpu-flags`: Confirm the content of the CPU flags file to ensure that the flags are correctly configured for your system. This step verifies that the correct flags will be used during package compilation.

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
/dev/sda1   /efi        vfat    defaults    0 2
# Swap Partition
/dev/sda2   none        swap    sw          0 0
# Root Partition
/dev/sda3   /           btrfs   defaults,noatime  0 1
```

Add entries for different partitions to the `/etc/fstab` file:
  - `/dev/sda1` is mounted at `/efi` with a VFAT filesystem.
  - `/dev/sda2` is used as a swap partition.
  - `/dev/sda3` is mounted as the root directory with a Btrfs filesystem and specified mount options.

  Adjust these entries according to your disk partitioning and filesystem choices.

## Step 22: Network Configuration (Continued)

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

These steps help you set up firmware, kernel, and filesystem configurations, as well as manage network interfaces, to create a stable and functional Gentoo Linux environment.

## Step 24: Root Password

### Set Root Password

```bash
passwd
```

- `passwd`: Set a secure root password for your Gentoo system. The root password is essential for administrative tasks and system management.

## Step 25: System Logging

### Install sysklogd

```bash
emerge --ask app-admin/sysklogd
```

- `emerge --ask app-admin/sysklogd`: Install `sysklogd`, which is responsible for system logging. This tool captures log messages and provides a record of system events and activities.

```bash
rc-update add sysklogd default
```

- `rc-update add sysklogd default`: Add `sysklogd` to the list of services that start automatically at boot. This ensures that system logs are managed from the beginning of the system's boot process.

## Step 26: Time Synchronization

### Install Chrony

```bash
emerge --ask net-misc/chrony
```

- `emerge --ask net-misc/chrony`: Install `chrony`, a tool used for time synchronization. Accurate timekeeping is crucial for various system functions and services.

```bash
rc-update add chronyd default
```

- `rc-update add chronyd default`: Add `chronyd` to the startup services to ensure that your system's time stays accurate. `chronyd` will synchronize your system's time with time servers on the internet.

## Step 27: Additional Tools

### Install Additional Tools

```bash
emerge -av sys-fs/btrfs-progs sys-fs/dosfstools wireless-tools
```

- `emerge -av sys-fs/btrfs-progs sys-fs/dosfstools wireless-tools`: Install additional tools that are useful for managing filesystems (Btrfs and DOSFAT) and handling wireless networking. These tools expand the functionality of your Gentoo system.

## Step 28: GRUB Bootloader

### Edit make.conf (GRUB)

```bash
echo 'GRUB_PLATFORMS="efi-64"' >> /etc/portage/make.conf
```

- `echo 'GRUB_PLATFORMS="efi-64"' >> /etc/portage/make.conf`: Edit your `make.conf` file to specify the GRUB platform as "efi-64." This setting is essential for systems that use EFI for booting.

### Install GRUB

```bash
emerge --ask --verbose sys-boot/grub
```

- `emerge --ask --verbose sys-boot/grub`: Install the GRUB bootloader using this command. GRUB is responsible for managing the boot process and allows you to choose which operating system to start.

```bash
grub-install --target=x86_64-efi --efi-directory=/efi
```

- `grub-install --target=x86_64-efi --efi-directory=/efi`: Install GRUB to the EFI partition of your system. This ensures that the system can boot using the UEFI firmware.

```bash
grub-mkconfig -o /boot/grub/grub.cfg
```

- `grub-mkconfig -o /boot/grub/grub.cfg`: Generate the GRUB configuration file (`grub.cfg`). This file contains the menu entries and settings required for booting into your Gentoo installation.

With these configurations and tools in place, your Gentoo Linux system is well-prepared for use. You're almost ready to finalize the installation and set up your user account.

## Step 30: Unmounting Partitions

### Unmount Partitions

```bash
umount -l /mnt/gentoo/dev{/shm,/pts,}
```

- `umount -l /mnt/gentoo/dev{/shm,/pts,}`: Unmount various directories within the Gentoo installation. This step ensures that these directories are no longer linked to the installation environment.

```bash
umount -R /mnt/gentoo
```

- `umount -R /mnt/gentoo`: Unmount the entire Gentoo installation from the `/mnt/gentoo` directory. This is a crucial step before rebooting to ensure that all filesystems are properly unmounted.

## Step 31: Reboot

### Reboot Your System

```bash
reboot
```

- `reboot`: Reboot your system to initiate the use of the newly installed Gentoo Linux. After the reboot, you'll see the GRUB menu. Use the arrow keys to select "Gentoo" and boot into your freshly installed Gentoo Linux system.

![Grub has been installed!](/blog/linux/Gentoo/grub-done.png)

## Step 32: Post-Installation

### Create a User Account

To enhance system security, it's recommended to create a regular user account and use it for day-to-day tasks rather than relying on the root account. Replace `<username>` with your desired username.

```bash
# Create a new user with necessary group memberships and set the shell to /bin/bash
useradd -m -G users,wheel,audio -s /bin/bash <username>
```

### Set sudo Configuration

Edit the sudoers file to configure sudo access for your user. You can use the `visudo` command to safely edit the sudoers file.

```bash
visudo
```

Within the sudoers file, locate the line `%wheel ALL=(ALL) ALL` and uncomment it by removing the `#` symbol at the beginning of the line. This action allows users in the "wheel" group to execute commands with sudo privileges.

```bash
# Uncomment the line below to allow users in the wheel group to execute commands with sudo privileges
%wheel ALL=(ALL) ALL
```

You can also set `Defaults timestamp_timeout=0` in the sudoers file to require a password every time sudo is used:

```bash
Defaults timestamp_timeout=0
```

### Switch to the New User

```bash
# Switch to the newly created user
su - <username>
```

By creating a new user account, uncommenting the `%wheel ALL=(ALL) ALL` line, and setting `Defaults timestamp_timeout=0`, you enhance the security of your Gentoo Linux system. Users in the "wheel" group will have the ability to execute commands with sudo privileges, and a password will be required every time `sudo` is used, providing an extra layer of security for your system.

## Step 33: Xorg and Desktop Environment

### 1. Edit make.conf (Xorg and Desktop)

Open the `make.conf` file to configure Xorg and desktop environment options:

```bash
nano /etc/portage/make.conf
```

Within `make.conf`, locate the relevant sections and add or modify the lines as specified below. Be careful not to overwrite any existing content in `make.conf`. Here's what you should add or modify:

```bash
# Add or modify these lines for mouse, keyboard, Synaptics touchpad support, and Elogind
INPUT_DEVICES="libinput"
VIDEO_CARDS="qxl"
USE="elogind dbus"
```

Additionally, add Elogind to startup services:

```bash
rc-update add elogind boot
```

### 2. Install Xorg Drivers

To install Xorg drivers, use the following command:

```bash
emerge --pretend --verbose x11-base/xorg-drivers
```

This command will prepare to install Xorg drivers without actually executing the installation.

## Step 34: Cleanup and Final Configuration

In some cases, the installation might encounter issues. If that happens, it's important to perform a deep clean and update your system to ensure everything is set up correctly.

### Cleanup and Final Configuration

1. Remove any unused dependencies and packages to free up disk space:

   ```bash
   emerge --ask --depclean --verbose
   ```

   This command will identify and remove packages that are no longer required, helping you reclaim disk space.

2. Synchronize your Gentoo system with the Gentoo repository:

   ```bash
   emerge --sync
   ```

   This step ensures that your package database is up-to-date with the latest information from the Gentoo repository.

3. Edit or create package.use files as needed. For example, you can configure packages like Poppler and libdbusmenu:

   ```bash
   echo "app-text/poppler -qt5" > /etc/portage/package.use/poppler
   echo ">=dev-libs/libdbusmenu-16.04.0-r2 gtk3" >> /etc/portage/package.use/libdbusmenu
   ```

   These commands allow you to specify package use flags for specific packages.

4. Install the XFCE desktop environment and related packages:

   ```bash
   emerge -av xfce-base/xfce-meta
   ```

   This will install the XFCE desktop environment along with its default set of applications.

5. Install the XFCE terminal:

   ```bash
   emerge --ask x11-terms/xfce4-terminal
   ```

   This command installs the XFCE terminal emulator.

With these instructions, you will correctly configure your system for Xorg and a desktop environment, clean up any unnecessary packages, and ensure your system is up-to-date with the latest package information from the Gentoo repository.

## Step 35: Configure XFCE to Start

After successfully installing the XFCE desktop environment, follow these steps to configure it to start when you boot into Gentoo:

### Configure XFCE to Start

1. Create or edit the `~/.xinitrc` file for your user:

   ```bash
   echo "exec startxfce4" > ~/.xinitrc
   ```

   This command creates or overwrites the `~/.xinitrc` file with a line that instructs the system to start XFCE when you run `startx`.

2. Start XFCE:

   ```bash
   startx
   ```

   Running `startx` will initiate the XFCE desktop environment, allowing you to start using it after logging in.

   ![xfce-start](/blog/linux/Gentoo/xfce-start.png)

These steps ensure that your Gentoo system is properly configured with the XFCE desktop environment, and you can start using it as your graphical user interface.

## Step 36: Install Additional Software

By default, Gentoo doesn't come with `sudo` pre-installed. To use `sudo` for administrative tasks and to install `neofetch` for displaying system information, follow these instructions:

### Install `sudo`

1. Install `sudo` using the `emerge` command:

   ```bash
   emerge -av sudo
   ```

   This command will install `sudo` on your system, which allows you to execute administrative commands with elevated privileges.

### Install `neofetch`

1. Install `neofetch` to display system information:

   ```bash
   emerge -av neofetch
   ```

   This command installs `neofetch`, a handy utility that provides detailed information about your Gentoo system in a visually appealing way.
   
   ![neofetch](/blog/linux/Gentoo/neofetch.png)

With these packages installed, you'll have `sudo` available for performing administrative tasks, and you can use `neofetch` to quickly view system information on your Gentoo system.

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