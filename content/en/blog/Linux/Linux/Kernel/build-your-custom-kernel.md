---
author: "Arcsly"
title: "Building the Linux Kernel on your Linux System (systemd-boot): Step-by-Step Guide"
description: "Learn how to build your own custom Linux kernel from scratch on your Linux system (systemd-boot). Follow this step-by-step guide to gain insight into kernel customization and enhance your system's performance and features."
tags: ["Linux", "Kernel"]
date: 2023-08-22T14:20:50+0800
thumbnail: /blog/linux/Kernel/Compile%20Kernel%20Modules.png
---

## Introduction

Building a custom Linux kernel on Arch Linux might appear intimidating at first, but armed with the right knowledge, it becomes an empowering skill. This tutorial is designed to guide you through the process, simplifying each step with clear and straightforward commands.

## August 24, 2023

Throughout this tutorial, we'll use Linux kernel version 6.4.12 as an example. Keep in mind that you can adapt the steps for different kernel versions as needed.

Let's dive in and demystify the process of crafting your very own custom Linux kernel on Arch Linux.

## Step 1: Prepare Your System

Before delving into building the custom Linux kernel, it's essential to ensure your system is equipped with the necessary tools and packages. Follow these steps to prepare your system:

### 1.  Install Required Dependencies

Start by installing the `base-devel` meta package. This package includes essential tools such as `make` and `gcc`. Open a terminal and enter the following command:

```shell
sudo pacman -S base-devel
```

### 2.  Install Additional Recommended Packages

For a smooth kernel compilation process, it's advisable to install the following packages as well. These packages are listed in the default Arch kernel PKGBUILD and contribute to a successful kernel build:

```shell
sudo pacman -S xmlto kmod inetutils bc libelf git cpio perl tar xz
```

With these dependencies installed, your system is now well-prepared to proceed with building your custom Linux kernel on Arch Linux.

## Step 2: Download the Kernel Source

Embark on your kernel customization journey by obtaining the kernel source code from the official source, kernel.org. The source code is sizeable, typically around 100 MBs or more. Here are a couple of methods to download the source code:

### 1. Visit Kernel.org:

   The official source for Linux kernel releases is [kernel.org](https://kernel.org/). You can access the website through your web browser and manually download the source code archive. Keep in mind that this method involves larger file sizes, so a stable internet connection is recommended.

   ![kernel.org](/blog/linux/Kernel/Download%20Kernel%20source.png)

### 2. Download using `aria2c`:

   To expedite the process, especially considering the large file size, you can use the `aria2c` command-line tool. This command supports multiple connections for faster downloads:
   ```shell
   aria2c -x 16 "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.4.12.tar.xz"
   ```

### 3. Download using `wget`:

   If you prefer not to use a web browser, you can use the `wget` command-line tool to directly download the source code:
   ```shell
   wget "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.4.12.tar.xz"
   ```

Remember, whether you choose the efficient `aria2c`, the direct `wget`, or the manual browser download, obtaining the kernel source code from kernel.org is your initial step toward crafting your customized Linux kernel.

## Step 3: Extract the Source Code

Unpack the downloaded source code archive using the `unxz` command:
```shell
unxz -v linux-6.4.12.tar.xz
```

## Step 4: Verify the Signature (Optional)

To ensure the authenticity of the source code, follow these steps to verify its GPG signature:

### 1. Download the Signature File
   
   Begin by downloading the GPG signature file associated with the source code:
   ```shell
   aria2c -x 16 "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.4.12.tar.sign"
   ```

### 2. Verify the Signature

   Next, use GPG to verify the signature of the downloaded source code:
   ```shell
   $ gpg --verify linux-6.4.12.tar.sign 
   gpg: assuming signed data in 'linux-6.4.12.tar'
   gpg: Signature made Wed 23 Aug 2023 11:33:44 PM HKT
   gpg:                using RSA key 647F28654894E3BD457199BE38DBBDC86092693E
   gpg: Can't check signature: No public key
   ```

### 3. Import the GPG Key

   If the signature verification is successful, import the associated GPG key for future use:
   ```shell
   $ gpg --recv-key 647F28654894E3BD457199BE38DBBDC86092693E                                        
   gpg: key 38DBBDC86092693E: 1 duplicate signature removed
   gpg: key 38DBBDC86092693E: public key "Greg Kroah-Hartman <gregkh@linuxfoundation.org>" imported
   gpg: Total number processed: 1
   gpg:               imported: 1
   ```

### 4. Continue with Signature Confirmation

   Confirm the validity of the imported key against the signature once again:
   ```shell
   $ gpg --verify linux-6.4.12.tar.sign  
   gpg: assuming signed data in 'linux-6.4.12.tar'
   gpg: Signature made Wed 23 Aug 2023 11:33:44 PM HKT
   gpg:                using RSA key 647F28654894E3BD457199BE38DBBDC86092693E
   gpg: Good signature from "Greg Kroah-Hartman <gregkh@linuxfoundation.org>" [unknown]
   gpg:                 aka "Greg Kroah-Hartman <gregkh@kernel.org>" [unknown]
   gpg:                 aka "Greg Kroah-Hartman (Linux kernel stable release signing key) <greg@kroah.com>" [unknown]
   gpg: WARNING: This key is not certified with a trusted signature!
   gpg:          There is no indication that the signature belongs to the owner.
   Primary key fingerprint: 647F 2865 4894 E3BD 4571  99BE 38DB BDC8 6092 693E
   ```

## Step 5: Extract the Source Code (Continued)

Continuing from where we left off, let's proceed with extracting the downloaded kernel source code using the following command:

```shell
tar xvf linux-6.4.12.tar
```

This command will unpack the compressed source code archive.

## Step 6: Navigate to the Kernel Source Directory

Navigate to the directory containing the kernel source code. You'll want to ensure that you have the necessary permissions to work with the source files without constantly relying on `sudo`. Here's how you can achieve that:

1. **Change Ownership of Kernel Source Directory:**

   To avoid using `sudo` for every operation, change the ownership of the kernel source directory to your user. Replace `$USER` with your actual username:
   
   ```shell
   chown $USER:$USER linux-6.4.12
   ```

This ensures that you have the necessary access rights to work with the kernel source code and perform various operations without the constant need for superuser privileges.

## Step 7: Compile and Install Kernel

### 1. Navigate to the Kernel Source Directory:
   
   Move into the directory containing the kernel source code:
   ```shell
   cd linux-6.4.12
   ```

### 2. Configure Using Current Kernel Configuration:

   To streamline the process, copy the configuration from your currently running kernel:
   ```shell
   cp /usr/src/linux/.config .
   ```

### 3. Compile the Kernel:

   With the configuration set, let's compile the kernel using the `make` command. Utilize the `-j` flag to take full advantage of your processor's cores:
   ```shell
   make ARCH=x86_64 -j $(nproc)
   ```

   ![compile the kernel](/blog/linux/Kernel/Compile%20Kernel%20Modules.png)

### 4.Install Kernel Modules:

   Install the kernel modules for your newly compiled kernel:
   ```shell
   sudo make ARCH=x86_64 modules_install 
   ```

   ![install the kernel](/blog/linux/Kernel/Install%20Kernel%20Modules.png)

## Step 8: Copy Your Own Kernel to /boot/

After successfully compiling your custom Linux kernel, it's essential to make it accessible by copying the necessary files to the `/boot` directory. This ensures that your system recognizes and can boot from the new kernel.

Use the following command to copy the compiled kernel image (`bzImage`) to the /boot directory:

- The `-v` flag is used to display detailed progress while copying.

```shell
sudo cp -v arch/x86_64/boot/bzImage /boot/vmlinuz-custom
```

## Step 9: Create and Configure Kernel Initramfs

The **initramfs** (initial RAM file system) is a temporary file system that's loaded into memory during the boot process before the root file system is available. It contains essential drivers, binaries, and scripts required for the system to identify and access the root file system. Customizing and generating your own initramfs can be crucial, especially if you're making changes to your kernel.

### 1. Duplicate and Modify the Preset File

To start customizing your initramfs, begin by duplicating the existing `linux.preset` file for your custom kernel. This file is used by `mkinitcpio` to generate the initramfs. Run the following command to make a copy:

```shell
sudo cp /etc/mkinitcpio.d/linux.preset /etc/mkinitcpio.d/linux-custom.preset
```

### 2. Open the Newly Created `linux-custom.preset`

Open the newly created `linux-custom.preset` file using a text editor of your choice. Within this file, you'll need to make specific modifications to adapt it for your custom kernel. Locate the relevant lines and adjust them as follows:

```shell
...
ALL_kver="/boot/vmlinuz-linux-custom"
...
default_image="/boot/initramfs-linux-custom.img"
...
fallback_image="/boot/initramfs-linux-custom-fallback.img"
```

For clarity, here's how the modified section might appear:

```shell
# mkinitcpio preset file for the 'linux-custom' package

#ALL_config="/etc/mkinitcpio.conf"
ALL_kver="/boot/vmlinuz-linux-custom"
ALL_microcode=(/boot/*-ucode.img)

PRESETS=('default' 'fallback')

#default_config="/etc/mkinitcpio.conf"
default_image="/boot/initramfs-linux-custom.img"
#default_uki="/efi/EFI/Linux/arch-linux.efi"
#default_options="--splash /usr/share/systemd/bootctl/splash-arch.bmp"

#fallback_config="/etc/mkinitcpio.conf"
fallback_image="/boot/initramfs-linux-custom-fallback.img"
#fallback_uki="/efi/EFI/Linux/arch-linux-fallback.efi"
fallback_options="-S autodetect"
```

Adjust these values according to your kernel version and naming conventions.

### 3. Generate the Custom Initramfs

Finally, generate the custom initramfs using the modified preset file:

```shell
sudo mkinitcpio -p linux-custom
```

This command will build the initramfs based on your custom configuration.

By creating and configuring your own initramfs, you ensure that essential components required for the boot process are tailored to your custom kernel. This step further enhances the compatibility and stability of your customized Linux kernel configuration.

## Step 10: Create a Boot Loader Configuration

You've done the hard work, and now it's time to ensure your custom kernel is properly loaded during boot. This involves creating a boot loader configuration file. If you're using systemd-boot, follow these steps:

### 1. Edit Boot Loader Configuration
   Use your favorite text editor to create or modify your boot loader's configuration file. In the case of systemd-boot, the configuration file is typically located at `/boot/loader/entries/arch-custom.conf`:
   ```shell
   sudo nano /boot/loader/entries/arch-custom.conf
   ```

### 2. Add Configuration
   Insert the following lines into the configuration file to define your custom kernel:
   ```shell
   title Arch Linux Custom
   linux /vmlinuz-linux-custom
   initrd /initramfs-linux-custom.img

   options root=/dev/sda2 quiet ro
   ```

### 3. Save and Exit
   Save the file and exit the text editor.

### 4. Update Boot Loader

Updating your boot loader configuration is a crucial step to ensure that your newly compiled custom kernel is recognized and can be booted. While this step is usually necessary, there's a tip that might save you some effort.

In many cases, boot loaders like systemd-boot automatically detect new kernel entries and update the boot menu accordingly. This means that after copying your custom kernel to the /boot directory, you might not need to manually update the boot loader configuration. The boot loader should automatically include the new entry during the next boot.

However, if you're using a boot loader that doesn't automatically update its configuration, you can follow these steps to manually update it:

1. Open a terminal and enter the following command to update your boot loader configuration:
   ```shell
   sudo bootctl update
   ```
   
This command ensures that your boot loader is aware of the new kernel entry and includes it in the boot menu options.

## Final Step: Reboot and Verify Your Custom Kernel

Congratulations! You've successfully compiled and Installed your own custom Linux kernel. The process might have taken some time and effort, but now you have a tailored kernel that fits your system's requirements. Let's take the final steps to reboot your computer and ensure that your new custom kernel is up and running.

### 1. Reboot Your System

To apply the changes and boot into your new custom kernel, issue the following command:

```shell
sudo reboot
```

Executing this command will initiate a system reboot, allowing you to select your custom kernel from the bootloader menu.

### 2. Verify the New Kernel

Once your system has rebooted and you've selected your custom kernel from the bootloader, it's time to verify that everything is in order. Open a terminal and enter the following command to check the version of your newly installed custom kernel:

```shell
uname -mrs
```

#### 2.2 New Kernel Output

You should see output similar to the following, indicating your new Linux kernel version:

```shell
Linux 6.4.12 x86_64
```

This confirms that your custom kernel is now successfully running on your Arch Linux system.

## Conclusion

Congratulations! You've successfully completed the entire process of building a custom Linux kernel on Arch Linux. From downloading the source code to configuring, compiling, and integrating it into your boot loader, you've gained a deep understanding of the inner workings of the kernel. This newfound knowledge empowers you to shape your system's performance and features according to your preferences.

With your custom Linux kernel in place, you have not only gained a deeper understanding of your system's core components but also unlocked the ability to fine-tune and optimize your system's performance according to your needs. Enjoy the benefits of your customized kernel configuration!

## Resources

- [How to compile and install Linux Kernel 5.16.9 from source code](https://www.cyberciti.biz/tips/compiling-linux-kernel-26.html)
- [How to build and install your own Linux kernel](https://wiki.linuxquestions.org/wiki/How_to_build_and_install_your_own_Linux_kernel)
- [Kernel/Traditional compilation](https://wiki.archlinux.org/title/Kernel/Traditional_compilation)