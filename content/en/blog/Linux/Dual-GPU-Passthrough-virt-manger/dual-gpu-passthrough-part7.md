---
author: "Arcsly"
title: "Dual GPU Passthrough Guided Part 7: Installing Windows 10 and Enabling Full Passthrough"
description: "In this section, we will guide you through the process of creating a new VM using Virt-Manager, installing the Windows OS and enabling complete passthrough of hardware components."
tags: ["QEMU/KVM", "GPU-Passthrough", "virt-manager"]
date: 2023-05-13T06:30:00+0800
thumbnail: /blog/linux/dual-gpu-passthrough/part7/Install_now.png
---

## Final Step: Setting Up Your Virtual Machine (VM)

Congratulations on making it this far! You're now just one step away from completing the entire process. In the upcoming stage, we'll walk you through the essential task of manually selecting your PCI devices and successfully installing your system.

It's important to note that the procedure for installing Windows on a VM differs slightly from the standard installation process. However, fear not—I'm here to guide you through each step.

Please ensure that you carefully select the correct PCI devices and diligently follow the provided installation instructions. This will ensure a smooth and successful setup of your virtual machine. Let's dive in and get your system up and running seamlessly!

## 1. virt-manger - Create new VM

Right now, Open-up your virt-manager and then Create a new VM.

![New VM](/blog/linux/dual-gpu-passthrough/part7/New%20VM.png)

### 1.2 virt-manger - Select Windows 10 iso

Selct your windows 10 iso.

![Select ISO](/blog/linux/dual-gpu-passthrough/part7/Select_ISO.png)


### 1.3 virt-manger - Select RAM

Choose your ram.

![Select Ram](/blog/linux/dual-gpu-passthrough/part7/Select_ram.png)

### 1.4 virt-manger - Disk image Size

Choose your VM Disk size. Tick the Enable storage for this virtual machine options.

![Select Disk Size](/blog/linux/dual-gpu-passthrough/part7/Select_Disk_Size.png)

### 1.5 virt-manger - Ready to install

Choose your virtual machine name. Tick the Customize configuaration before install.

![Ready to install](/blog/linux/dual-gpu-passthrough/part7/Ready_to_install.png)

### 1.6 Ready to install

>**!!! IMPORTANT: Firmware choose OVMF_CODE.fd**
>You cannot change this after `Begin installation`, so makesure is the right options.

![Firmware](/blog/linux/dual-gpu-passthrough/part7/Firmware.png)

### 1.7 Boot optinos

Enable the boot menu, then select SATA CDROM1 and make sure it's checked, as it contains your Windows 10 installation files. Set it as the first boot device, so that it automatically detects your ISO file upon startup.

![Boot options](/blog/linux/dual-gpu-passthrough/part7/Boot_optinos_1.png)

#### 1.8 Add VirtIO Disk

After installing Windows, we need to add a new VirtIO Disk so that the installation selection can detect your VirtIO drivers. This step is crucial for ensuring optimal performance and compatibility with the virtual machine.

![Add VirtIO Disk](/blog/linux/dual-gpu-passthrough/part7/Add_VirtIO.png)

#### 1.9 Add VirtIO ISO

Installing these drivers after completing your Windows installation will help your VM run more efficiently and faster. However, it's essential to note that we won't install them now; we'll do it after completing all other setup steps. These drivers are crucial for optimizing the performance and compatibility of your virtual machine with the underlying host system.

![Add VirtIO ISO](/blog/linux/dual-gpu-passthrough/part7/Add_VirtIO_ISO.png)

#### 1.9.1 Boot options - results

Your Boot options should look like this.

![BO LOOK LIKE THIS](/blog/linux/dual-gpu-passthrough/part7/BO_Look_like_this.png)

## 2. Begin installation

Let's install the VM. Click the Begin Installation Button.

>There have two Hardware is noneed: `NIC and Tablet`. Just remove is fine.

![Begin installation](/blog/linux/dual-gpu-passthrough/part7/Begin_Installation.png)

## 3. Booting your System

After booting your system. just on your keyboard pressa any key to boot your CD.

![Press any key to boot up system](/blog/linux/dual-gpu-passthrough/part7/Press_any_key_to_boot_up_system.png)

### 3.2 Exit the UEFI Shell

Okay, I understand that there is a possibility of missing the boot options and getting stuck on this page. However, there's no need to worry; you can easily exit by typing `exit` and pressing the Enter key. This will take you out of the current state and allow you to proceed with the installation smoothly.

![Exit bo](/blog/linux/dual-gpu-passthrough/part7/Exit_bo.png)

### 3.3 Select Boot manager

Now, use the arrow keys on your keyboard to navigate and select the options. Choose "Boot manager" from the list of available options.

![Boot manager](/blog/linux/dual-gpu-passthrough/part7/Boot_manager_1.png)

### 3.4 Select Boot manger (DVD)

Select the first option by pressing Enter. If you've followed my specifications, the desired option should be listed as the first one.

![Boot manager Select DVD](/blog/linux/dual-gpu-passthrough/part7/Boot_manager_select_DVD.png)

### 3.5 Press any key to boot up system

Press any key to boot up system.

![Press any key to boot up system](/blog/linux/dual-gpu-passthrough/part7/Press_any_key_to_boot_up_system.png)

## 4. Windows Setup - Languages and times

After selecting the first option, your Windows system should start loading up. The default settings should work fine, but if you prefer, you can customize them according to your preferences.

For now, the installation process is essentially the same as a regular Windows installation. Just keep clicking "Next" until you reach the "Install Windows" Selection, where you will install the necessary drivers to optimize your VM's performance.

![Windows Setup](/blog/linux/dual-gpu-passthrough/part7/Windows_Setup.png)

### 4.2 Windows Setup - install now

Click install now.

![Install now](/blog/linux/dual-gpu-passthrough/part7/Install_now.png)

### 4.3 Windows Setup - Product Key

Click i dont have a product key.

![Install now](/blog/linux/dual-gpu-passthrough/part7/i_dont_have_product_key.png)

### 4.4 Windows Setup - Version Select

choose Pro version. Seems only pro version have the offline account.

![windows Pro](/blog/linux/dual-gpu-passthrough/part7/windows_Pro.png)

### 4.5 Windows Setup - Accept lincense

tick i accept the license terms

![Accept license](/blog/linux/dual-gpu-passthrough/part7/Accept_license.png)

### 4.6 Windows Setup - Custom install

OK. This step is different from a normal Windows installation. Click Custom.

![Custom install](/blog/linux/dual-gpu-passthrough/part7/Custom_install.png)

### 4.7 Windows Setup - Load Drivers

Click load drivers.

![Custom install](/blog/linux/dual-gpu-passthrough/part7/Load_drivers.png)

### 4.8 Windows Setup - Browse Drivers

Click Browse.

![Browser](/blog/linux/dual-gpu-passthrough/part7/Browse_drivers.png)

### 4.9 Windows Setup - Select Virtio-win

You should have a CD Drive Called E:\
choose the path on: `E:\amd64\w10` Then click OK.

![AMD64](/blog/linux/dual-gpu-passthrough/part7/AMD64.png)

### 4.9.1 Windows Setup - Red Hat VirtIO SCSI

you should see the only one result called 'Red Hat VirtIO SCSI controller' just select that then click next.

![SCSI](/blog/linux/dual-gpu-passthrough/part7/SCSI.png)

That will take a while time. just wait.


![wait SCSI](/blog/linux/dual-gpu-passthrough/part7/wait_SCSI.png)

### 4.9.2 Windows Setup - VirtIO Disk

You should see a new Disk, which is your VirtIO Disk. Do not delete it as it is essential for installing new drivers later."

![VirtIO Disk](/blog/linux/dual-gpu-passthrough/part7/VirtIO_Disk.png)

### 4.9.3 Windows Setup - Disks select

Right now, you can install your Windows on your disks.
As for me, I will partition it into 150 and 350, and then proceed with the installation.

I forgot one step here.
You should format your D driver, which is demonstrated as the 150 GB Disk.
Format it to make it usable. I'm not sure why it's not formatted from the beginning. I realized this after the installation when I couldn't find the D drive.
If you don't do it at this step, you will need to go to Disk Manager after completing the installation and then format it.
Let me know if there is anything else I can assist you with.

![install windows 1](/blog/linux/dual-gpu-passthrough/part7/install_windows_1.png)

## 4.9.4 Windows Setup - installing windows.

Now, install your windows.

![iw](/blog/linux/dual-gpu-passthrough/part7/iw.png)

### 4.9.5 Windows Config - setup config

Those steps are the same as a regular Windows installation. In this guide, I didn't go into detail about them. You can simply click "Next" and proceed with the installation process.


![w](/blog/linux/dual-gpu-passthrough/part7/w1.png)
![w](/blog/linux/dual-gpu-passthrough/part7/w2.png)
![w](/blog/linux/dual-gpu-passthrough/part7/w3.png)
![w](/blog/linux/dual-gpu-passthrough/part7/w4.png)
![w](/blog/linux/dual-gpu-passthrough/part7/w5.png)
![w](/blog/linux/dual-gpu-passthrough/part7/w6.png)
![w](/blog/linux/dual-gpu-passthrough/part7/w7.png)
![w](/blog/linux/dual-gpu-passthrough/part7/w8.png)
![w](/blog/linux/dual-gpu-passthrough/part7/w9.png)

Right now we need to poweroff the computer.

![w](/blog/linux/dual-gpu-passthrough/part7/wf.png)


## 5. virt-manger - Remove ISO

The Windows ISO is no longer needed; you can remove it from the VM.

## 6. virt-manager - Add your PCI Device

Now, adding your pci device. including GPU, GPU-Audio, and Network.

After adding your network settings to the VM, your host may lose network connectivity. Power on the VM to establish the network connection on the virtual machine.

![p](/blog/linux/dual-gpu-passthrough/part7/P1.png)
![p](/blog/linux/dual-gpu-passthrough/part7/P2.png)
![p](/blog/linux/dual-gpu-passthrough/part7/P3.png)

Now, power on your VM.

![poweron 1](/blog/linux/dual-gpu-passthrough/part7/Poweron_1.png)

## 7. Fully upgrade your VM

To complete the Passthrough GPU. We need to fully upgrade your system. So that why we need network.

![Update windows](/blog/linux/dual-gpu-passthrough/part7/Update_windows.png)
![Update windows](/blog/linux/dual-gpu-passthrough/part7/Update_windows_2.png)

Makesure your system has been up to date.

![Update windows](/blog/linux/dual-gpu-passthrough/part7/Update_windows_3.png)


## 8. Update Drivers

Now we need to update your drivers. Search `device`.

![Device manager](/blog/linux/dual-gpu-passthrough/part7/Device_manager.png)

Select PCI Device, right Click update drivers.

![update drivers](/blog/linux/dual-gpu-passthrough/part7/drivers_update_1.png)

Select Browse my computer for drivers.

![update drivers](/blog/linux/dual-gpu-passthrough/part7/drivers_update_2.png)

Browse your `E:\` or select the path. then Next.

![update drivers](/blog/linux/dual-gpu-passthrough/part7/drivers_update_3.png)

You can see your GPU has been listing to your VM. then mean the GPU is working now.

![GPU OK](/blog/linux/dual-gpu-passthrough/part7/GPU-ok.png)

## 9. Install Virtio Drivers

Install Virtio is helping your VM running more fastest. Open up your Explorer, you should see a Driver called `E:\`

![E](/blog/linux/dual-gpu-passthrough/part7/E.png)

Click that then finding the `virtio-win-gt-x64.msi` then install the program.


![E](/blog/linux/dual-gpu-passthrough/part7/E1.png)

Click Next.

![E](/blog/linux/dual-gpu-passthrough/part7/E2.png)

Accept the license then Next.

![E](/blog/linux/dual-gpu-passthrough/part7/E3.png)

Just Next is fine.

![E](/blog/linux/dual-gpu-passthrough/part7/E4.png)

you will need superuser permission. just click Next.

![E](/blog/linux/dual-gpu-passthrough/part7/E5.png)

Wating that complete installed.

![E](/blog/linux/dual-gpu-passthrough/part7/E6.png)

## 10. Final step - using VGA Display

For Windows, you should use the "VGA" Video Model to switch your monitor.

To do this, power off your VM and then switch to the VGA Video Model. After that, switch back to "HDMI2," and you will see your Windows 10 is working on your GPU-Display and not on the Virtual monitor.

By using the VGA Video Model, you can ensure that your VM utilizes the GPU-Display for better graphics performance and display capabilities.

![VGA](/blog/linux/dual-gpu-passthrough/part7/VGA.png)

## 11. Passthrough USB and Mouse

You might notice that you can't use the mouse and keyboard because you haven't enabled passthrough for them yet. To resolve this, simply add their respective devices to the VM, and they will function correctly.

Enabling passthrough for the mouse and keyboard allows the virtual machine to directly access these devices, providing seamless input functionality and better user experience within the VM.

![Mouse passthrough](/blog/linux/dual-gpu-passthrough/part7/Mouse_passthrough.png)
![Keyboard passthrough](/blog/linux/dual-gpu-passthrough/part7/Keyboard_passthrough.png)

## 12. Optimize CPU Configuration

It's recommended to use physical CPU cores instead of virtual CPU (vCPU) for improved performance.

By default, virtual machines are configured with vCPUs. To enhance speed, change this setting to utilize the actual physical CPU cores. Access this configuration by following the steps illustrated in the image below:

![CPU using](/blog/linux/dual-gpu-passthrough/part7/Speed-up-cpu.png)

By making this adjustment, your virtual machine will leverage the full potential of your physical CPU cores, resulting in improved performance and responsiveness.

## 13. Automatic Suspend

Since you have already enabled passthrough for your mouse and keyboard, your computer may automatically go into idle mode after being inactive for up to 15 minutes. This could lead to a system crash, so it's crucial to disable the "When idle"  Automatic Suspend setting.

In the GNOME desktop environment, you can access this setting as demonstrated in the image below:

![Power setting idle](/blog/linux/dual-gpu-passthrough/part7/Power_setting_idle.png)

This setting is essential to ensure stable and continuous use of your VM. If you don't change it, your host machine may shut down automatically, causing the VM to stop functioning as well.

Please remember to disable this feature to prevent any interruptions during your VM usage.


## Conclusion: Ready to Go!

Congratulations, you've successfully set up your virtual machine with hardware passthrough. Now, you can seamlessly switch your monitor to HDMI2 and start enjoying your virtual machine.

In case you encounter any issues with graphics performance, remember to install the appropriate drivers for your system.

For AMD graphics cards, visit: [https://www.amd.com/en/support](https://www.amd.com/en/support)

For NVIDIA graphics cards, head to the NVIDIA download center: [https://www.nvidia.com/download/index.aspx](https://www.nvidia.com/download/index.aspx)

With a well-configured virtual machine and optimized graphics drivers, you're all set to explore, work, or play within your virtual environment. Have a great experience!