---
author: "Arcsly"
title: "Building the Linux Kernel on your Linux System: Step-by-Step Guide"
description: "Learn how to build your own custom Linux kernel from scratch on your Linux system. Follow this step-by-step guide to gain insight into kernel customization and enhance your system's performance and features."
tags: ["Linux", "Kernel"]
date: 2023-08-22T14:20:50+0800
thumbnail: /blog/linux/Kernel/Compile%20Kernel%20Modules.png
---

## Introduction

Building a custom Linux kernel on Arch Linux can seem like a daunting task, but with the right guidance, it becomes a valuable skill. This tutorial will walk you through the process, breaking down each step into easy-to-follow commands.

## Step 1: Download the Kernel Source

Embark on your kernel customization journey by obtaining the kernel source code from the official source, kernel.org. The source code is sizeable, typically around 100 MBs or more. Here are a couple of methods to download the source code:

1. **Visit Kernel.org:**

   The official source for Linux kernel releases is [kernel.org](https://www.kernel.org/). You can access the website through your web browser and manually download the source code archive. Keep in mind that this method involves larger file sizes, so a stable internet connection is recommended.

2. **Download using `aria2c`:**

   To expedite the process, especially considering the large file size, you can use the `aria2c` command-line tool. This command supports multiple connections for faster downloads:
   ```shell
   aria2c -x 16 "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.4.12.tar.xz"
   ```

3. **Download using `wget`:**

   If you prefer not to use a web browser, you can use the `wget` command-line tool to directly download the source code:
   ```shell
   wget "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.4.12.tar.xz"
   ```

Remember, whether you choose the efficient `aria2c`, the direct `wget`, or the manual browser download, obtaining the kernel source code from kernel.org is your initial step toward crafting your customized Linux kernel.

### Step 2: Extract the Source Code

Unpack the downloaded source code archive using the `unxz` command:
```shell
unxz -v linux-6.4.12.tar.xz
```

### Step 3: Verify the Signature (Optional)

To ensure the authenticity of the source code, follow these steps to verify its GPG signature:

1. **Download the Signature File:**
   
   Begin by downloading the GPG signature file associated with the source code:
   ```shell
   aria2c -x 16 "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.4.12.tar.sign"
   ```

2. **Verify the Signature:**

   Next, use GPG to verify the signature of the downloaded source code:
   ```shell
   $ gpg --verify linux-6.4.12.tar.sign 
   gpg: assuming signed data in 'linux-6.4.12.tar'
   gpg: Signature made Wed 23 Aug 2023 11:33:44 PM HKT
   gpg: using RSA key 647F28654894E3BD457199BE38DBBDC86092693E
   gpg: Good signature from "Greg Kroah-Hartman <gregkh@linuxfoundation.org>" [unknown]
   gpg: aka "Greg Kroah-Hartman <gregkh@kernel.org>" [unknown]
   gpg: aka "Greg Kroah-Hartman (Linux kernel stable release signing key) <greg@kroah.com>" [unknown]
   gpg: WARNING: This key is not certified with a trusted signature!
   gpg: There is no indication that the signature belongs to the owner.
   Primary key fingerprint: 647F 2865 4894 E3BD 4571  99BE 38DB BDC8 6092 693E
   ```

3. **Import the GPG Key:**

   If the signature verification is successful, import the associated GPG key for future use:
   ```shell
   $ gpg --recv-key 647F28654894E3BD457199BE38DBBDC86092693E
   gpg: key 38DBBDC86092693E: 1 duplicate signature removed
   gpg: key 38DBBDC86092693E: "Greg Kroah-Hartman <gregkh@linuxfoundation.org>" not changed
   gpg: Total number processed: 1
   gpg: unchanged: 1
   ```

4. **Continue with Signature Confirmation:**

   Confirm the validity of the imported key against the signature once again:
   ```shell
   $ gpg --verify linux-6.4.12.tar.sign                     
   gpg: assuming signed data in 'linux-6.4.12.tar'
   gpg: Signature made Wed 23 Aug 2023 11:33:44 PM HKT
   gpg: using RSA key 647F28654894E3BD457199BE38DBBDC86092693E
   gpg: Good signature from "Greg Kroah-Hartman <gregkh@linuxfoundation.org>" [unknown]
   gpg: aka "Greg Kroah-Hartman <gregkh@kernel.org>" [unknown]
   gpg: aka "Greg Kroah-Hartman (Linux kernel stable release signing key) <greg@kroah.com>" [unknown]
   gpg: WARNING: This key is not certified with a trusted signature!
   gpg: There is no indication that the signature belongs to the owner.
   Primary key fingerprint: 647F 2865 4894 E3BD 4571  99BE 38DB BDC8 6092 693E
   ```

### Step 5: Extract the Source Code (Continued)

Continuing from where we left off, let's proceed with extracting the downloaded kernel source code using the following command:

```shell
tar xvf linux-6.4.12.tar
```

This command will unpack the compressed source code archive.

### Step 6: Compile and Install Kernel

1. **Navigate to the Kernel Source Directory:**
   
   Move into the directory containing the kernel source code:
   ```shell
   cd linux-6.4.12
   ```

2. **Configure Using Current Kernel Configuration:**

   To streamline the process, copy the configuration from your currently running kernel:
   ```shell
   cp /usr/src/linux/.config .
   ```

3. **Compile the Kernel:**

   With the configuration set, let's compile the kernel using the `make` command. Utilize the `-j` flag to take full advantage of your processor's cores:
   ```shell
   make ARCH=x86_64 -j $(nproc)
   ```

   ![compile the kernel](/blog/linux/Kernel/Compile%20Kernel%20Modules.png)

4. **Install Kernel Modules:**

   Install the kernel modules for your newly compiled kernel:
   ```shell
   sudo make ARCH=x86_64 modules_install 
   ```

   ![install the kernel](/blog/linux/Kernel/Install%20Kernel%20Modules.png)

5. **Install the Kernel:**

   It's time to officially install your custom kernel:
   ```shell
   sudo make ARCH=x86_64 install 
   ```

6. **Copy Your Own Kernel to /boot/:**

   Ensure your custom-built kernel is accessible by copying it to the `/boot` directory:
   ```shell
   sudo cp -v arch/x86_64/boot/bzImage /boot/vmlinuz-custom
   ```

By following these numbered steps, you're systematically progressing through the critical phases of compiling and installing your custom Linux kernel on Arch Linux.

### Final Step: Create a Boot Loader Configuration

You've done the hard work, and now it's time to ensure your custom kernel is properly loaded during boot. This involves creating a boot loader configuration file. If you're using systemd-boot, follow these steps:

1. **Edit Boot Loader Configuration:**
   Use your favorite text editor to create or modify your boot loader's configuration file. In the case of systemd-boot, the configuration file is typically located at `/boot/loader/entries/arch-custom.conf`:
   ```shell
   sudo nano /boot/loader/entries/arch-custom.conf
   ```

2. **Add Configuration:**
   Insert the following lines into the configuration file to define your custom kernel:
   ```shell
   title Arch Linux Custom
   linux /vmlinuz-custom
   initrd /initramfs-linux.img

   options root=/dev/sda2 quiet ro
   ```

3. **Save and Exit:**
   Save the file and exit the text editor.

4. **Update Boot Loader:**
   Update your boot loader configuration to include the new entry:
   ```shell
   sudo bootctl update
   ```

5. **Reboot:**
   Reboot your system to see your custom kernel option in the boot loader menu.

With these steps, you've crafted a custom entry in your boot loader configuration, pointing to your custom kernel. This ensures that your system will boot into your new kernel with the desired options.

## Conclusion

Congratulations! You've successfully completed the entire process of building a custom Linux kernel on Arch Linux. From downloading the source code to configuring, compiling, and integrating it into your boot loader, you've gained a deep understanding of the inner workings of the kernel. This newfound knowledge empowers you to shape your system's performance and features according to your preferences. As you continue to explore the vast realm of Linux, remember that the journey you've undertaken today is just the beginning of your technical prowess. Enjoy your personalized Arch Linux experience!

# Resources

- https://www.cyberciti.biz/tips/compiling-linux-kernel-26.html
- https://wiki.linuxquestions.org/wiki/How_to_build_and_install_your_own_Linux_kernel