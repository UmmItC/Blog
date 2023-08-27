---
author: "Arcsly"
title: "Building Your Own Custom Arch Linux ISO with Archiso"
description: "Explore the process of creating a personalized Arch Linux ISO using the official tool called Archiso to craft your own customized Arch Linux ISO."
tags: ["Arch Linux"]
date: 2023-08-27T18:54:30+0800
thumbnail: https://opengraph.githubassets.com/0cb167023d20d8a4151b99b82aee96c66944008f8328ecc071a7a1b39bfa2263/archlinux/archiso
---

## What is Archiso?

Archiso is the official tool used to build the Arch Linux live CD/USB ISO images. It's a versatile utility that allows you to construct bootable ISO images that can be used for various purposes, from system recovery to creating your own personalized Arch Linux distribution.

## Why Archiso?

Have you ever wanted to create your own custom Arch Linux ISO image, tailored to your specific needs and preferences? With Archiso, a powerful and highly customizable tool, you can do just that. Whether you're building a rescue system, a Linux installer, or a specialized distribution, Archiso provides the framework to create ISO images that perfectly suit your requirements.

## Install Archiso

To start using Archiso, you need to install the package first. Here's how you can do it:

1. **Install Archiso:**

   Begin by installing the Archiso package using the package manager of your choice. Open a terminal and enter the following command:

   ```shell
   sudo pacman -S archiso
   ```

   This command installs Archiso on your system, giving you access to the tools you need for creating your custom Arch Linux ISO.

### 1. Customize Your ISO

Creating a personalized Arch Linux ISO begins with Archiso installed on your system. This versatile tool allows you to construct bootable ISO images tailored to your preferences and requirements. Here are the initial steps to get you started on crafting your own custom Arch Linux ISO:

1. **Create a Working Directory:**

   Begin by opening your terminal and creating a dedicated directory where you'll carry out the customization process:

   ```shell
   mkdir archlive
   ```

2. **Copy Archiso Configuration Files:**

   Archiso provides a range of configuration profiles that serve as solid starting points for crafting your own ISO. Copy the default `releng` profile files into your working directory:

   ```shell
   cp -r /usr/share/archiso/configs/releng/ archlive
   ```

3. **Customize Packages:**

   Open the `packages.x86_64` file using a text editor such as `nano` to define the packages you want to include by default:

   ```shell
   nano archlive/packages.x86_64
   ```

   Edit the list of packages to align with your ISO's intended purpose. Whether you require specific tools, applications, or libraries, you can curate the package list to create an environment tailored to your needs.

### 2. Build Your Custom Arch Linux ISO

After refining your custom Arch Linux environment, it's time to transform it into a final product—an Arch Linux ISO that encapsulates your modifications and configurations. The following steps outline how to build your custom ISO using the `mkarchiso` tool:

1. **Create an Output Directory:**

   To accommodate the generated ISO image, establish a fresh directory named "output" using the command:

   ```shell
   mkdir output
   ```

2. **Create a Work Directory:**

    After a successful build, your current directory can become cluttered with various files and outputs. To maintain a clean workspace, it's recommended to create a dedicated work directory. This directory will house your project files and outputs:

    ```shell
    mkdir work
    ```

### 3. Initiate the ISO Build Process

With your customizations in place, it's time to bring your custom Arch Linux ISO to life. You'll utilize the `mkarchiso` command to create the ISO based on the `releng` profile. This command comes with a set of options that dictate the build process:

>**Tip:** You don't need to manually create the "output" or "work" directories. The `mkarchiso` command will handle that for you, so you can focus on the customization process without the need for additional directory setup.

```shell
sudo mkarchiso -v -w work -o output releng
```

Here's what each part of the command accomplishes:

- `-v`: Enables verbose output, providing you with detailed progress updates during the build process.
- `-w work`: Specifies the working directory. This is where the magic happens, and it ensures that your customizations are applied correctly to the ISO.
- `-o output`: Specifies the output directory for the resulting ISO image. This is where the final ISO will be stored once the build process is complete.
- `releng`: Refers to the profile used for ISO creation. This profile incorporates default configurations optimized for shaping a release ISO.

4. **Monitor the Build Progress:**

   During the ISO creation journey, you'll observe progress messages illuminating the various stages completed. These encompass tasks such as installing packages and copying files.

5. **Completion and Success:**

   As the build process wraps up, you'll be met with a message confirming the triumph of ISO creation. The message could resemble the following:

   ```shell
   Written to medium : 408230 sectors at LBA 0
   Writing to 'stdio:/home/username/your/path/here/archlive/output/archlinux-2023.08.27-x86_64.iso' completed successfully.
   [mkarchiso] INFO: Done!
   798M	/home/username/your/path/here/archlive/output/archlinux-2023.08.27-x86_64.iso
   ```

### 3. Test Your Custom ISO

Congratulations on successfully crafting your custom Arch Linux ISO! The next step is to test your creation to ensure that it functions as intended. This testing phase allows you to identify any issues or discrepancies that may arise when booting the ISO on various systems. To facilitate this testing, you'll need to use the QEMU program along with the `qemu-desktop` package and the `edk2-ovmf` package for UEFI support (Firmware for Virtual Machines). Here's how to set up and perform the testing:

#### Install Required Packages

Before you start testing, you need to install the necessary packages for QEMU and UEFI support:

1. Install the `qemu-desktop` package and the `edk2-ovmf` package by executing the following command:

   ```shell
   sudo pacman -S qemu-desktop edk2-ovmf
   ```

#### UEFI Mode Testing

For testing your ISO on a UEFI-based system, follow these steps:

1. Run the following command, replacing `archlinux-2023.08.27-x86_64.iso` with the actual filename of your custom ISO:

   ```shell
   run_archiso -u -i archlinux-2023.08.27-x86_64.iso
   ```

   This command launches the Archiso environment in UEFI mode using the specified ISO.

2. Observe the boot process and interact with the live environment to ensure that everything is working as expected. Test various functionalities, applications, and configurations.

Your terminal output should resemble the following:

![UEFI Mode](/blog/linux/Archlinux-build-your-own-kernel-archlinux_iso/UEFI_test.png)

#### BIOS (Non-UEFI) Mode Testing

For testing on systems that use BIOS (non-UEFI), follow these instructions:

1. Run the following command, replacing `archlinux-2023.08.27-x86_64.iso` with the actual filename of your custom ISO:

   ```shell
   run_archiso -i archlinux-2023.08.27-x86_64.iso
   ```

   This command initiates the Archiso environment in BIOS mode using the provided ISO.

3. Carefully observe the boot process and interact with the live environment to verify its functionality and behavior. Test different features, applications, and customizations.

Your terminal output should resemble the following:

![BIOS Mode](/blog/linux/Archlinux-build-your-own-kernel-archlinux_iso/BIOS_test.png)

#### Test and Validate

While testing, pay attention to the following aspects:

- Booting: Ensure that the ISO boots properly in both UEFI and BIOS modes.
- Graphical Environment: Check if the graphical environment loads correctly and displays properly.
- Applications: Test various pre-installed applications to confirm their functionality.
- Hardware Compatibility: Verify that hardware components such as networking, sound, and graphics work seamlessly.
- Customizations: Confirm that any customizations you made to the ISO are accurately reflected.

By thoroughly testing your custom Arch Linux ISO using QEMU, you can address any potential issues before distributing it to others or using it for your intended purposes.

### [Optional]: Rebuild Your ISO and Periodically Update Configuration

To rebuild the Arch Linux ISO and keep it aligned with the latest changes in the official Arch Linux installation media, follow these steps:

1. **Delete the "work" Directory:**

   Begin by removing the "work" directory, which contains temporary files used during the ISO creation process. This step ensures a clean slate for your next build:

   ```shell
   sudo rm -rfv work
   ```

2. **Update Your System:**

   Before updating the ISO, update your local system to have the latest package information:

   ```shell
   sudo pacman -Syuv
   ```

3. **Update Configuration Files:**

   Navigate to your "archlive" directory where you've copied the configuration files from `/usr/share/archiso/configs/releng/`. Use the following command to copy the latest configuration files from the official Arch Linux installation media:

   ```shell
   sudo cp -r /usr/share/archiso/configs/releng/ archlive
   ```

   This step ensures that your custom ISO's configurations are up-to-date.

4. **Initiate the ISO Build Process:**

   With a fresh configuration and updated system information, initiate the ISO build process as before. The `mkarchiso` command will handle directory creation for you:

   ```shell
   sudo mkarchiso -v -w work -o output releng
   ```

5. **Monitor the Build Progress:**

   During the ISO creation journey, you'll witness progress messages detailing the various stages being completed.

6. **Completion and Success:**

   Once the build process concludes, you'll receive a message indicating the success of the ISO creation. The message might resemble the following:

   ```shell
   Written to medium : 408230 sectors at LBA 0
   Writing to 'stdio:/home/username/your/path/here/archlive/output/archlinux-2023.08.27-x86_64.iso' completed successfully.
   [mkarchiso] INFO: Done!
   798M	/home/username/your/path/here/archlive/output/archlinux-2023.08.27-x86_64.iso
   ```

By periodically updating the configuration files in your "archlive" directory, you ensure that your custom Arch Linux ISO remains current and consistent with the latest changes made to the official Arch Linux system. This practice helps provide users with an up-to-date experience when using your custom ISO.

## Conclusion

In this guide, you've learned how to build your own custom Arch Linux ISO using the powerful `mkarchiso` tool. By following the steps outlined in this tutorial, you've gained the ability to create an ISO image that perfectly aligns with your needs and preferences. This process empowers you to customize the Arch Linux experience to a level that the official ISOs might not offer.

By creating a working directory, copying the Archiso configuration files, and customizing the list of packages, you've set the foundation for your custom Arch Linux environment. The `mkarchiso` command then allows you to bring your customizations to life, building an ISO image that encapsulates all your modifications and configurations.

One of the key advantages of creating a custom ISO is the flexibility to install additional packages, including desktop environments. While the official Arch Linux ISOs provide a minimal environment, your custom ISO can include a desktop environment of your choice, giving you a more user-friendly and feature-rich system.

With your own custom Arch Linux ISO in hand, you have the power to deploy a personalized distribution that reflects your workflow and preferences. Whether you're creating a rescue system, a Linux installer, or a specialized distribution, the possibilities are endless. So go ahead, happy customizing your Arch Linux ISO!

## Resources

- [Archiso](https://wiki.archlinux.org/title/archiso)
- [Arch Linux: Create Your Own Installer](https://www.youtube.com/watch?v=-yPhW5o1hNM)
- [Build Your Own Distro With Archiso](https://www.youtube.com/watch?v=tSGGBbJBgvk)