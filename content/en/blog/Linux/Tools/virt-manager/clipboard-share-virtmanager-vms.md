---
author: "Arcsly"
title: "Enabling Clipboard Sharing Between Host and Virtual Machine in Virt-Manager"
description: "Streamline VM workflow with clipboard sharing between host and guest using Virt-Manager's Spice agent. Boost productivity and efficiency. Learn how in this guide."
tags: ["virt-manager", "QEMU/KVM", "Clipboard"]
date: 2023-08-20T19:02:15+0800
thumbnail: /blog/linux/linux-tools/virt-manager/add.png
---

## Why enable clipboard sharing?

Efficiently sharing the clipboard between your host system and a virtual machine (VM) can significantly improve your productivity and streamline your tasks. This guide will walk you through the process of enabling clipboard sharing between your host and VM using the Spice agent within the Virt-Manager virtualization tool.

## Understanding Spice and Clipboard Sharing

The Spice (Simple Protocol for Independent Computing Environments) agent enhances the user experience in virtual machines by providing features such as high-quality multimedia playback, audio support, and, importantly, clipboard sharing. By enabling clipboard sharing, you can seamlessly copy and paste text or files between your host and VM.

### Enabling Clipboard Sharing

Follow these steps to enable clipboard sharing between your host and VM using Virt-Manager:

1. **Start Your Virt-Manager:** Launch the Virt-Manager application and start your desired virtual machine.

2. **Access VM Settings:** Right-click on the VM and select "Open." This will allow you to access the VM settings.

3. **Add Spice Channel Device:** In the VM settings window, navigate to the "Add Hardware" section and select "Channel Spice."

4. **Configure Spice Channel:** Provide the following details for the Spice channel device:

   - **Device Type:** com.redhat.spice.0
   - **Device:** Spice agent (spicevmc)

![copy](/blog/linux/linux-tools/virt-manager/add.png)

5. **Apply Changes:** Save your settings and apply the changes to the VM.

6. **Start the VM:** Begin the VM's operation to implement the changes. The Spice agent will now be active.

### Testing Clipboard Sharing

Now that the Spice agent is active, test the clipboard sharing feature:

1. **Copy from Host to VM:** Copy text or a file on your host system. Then, inside the VM, paste the copied content. You'll notice that the clipboard contents transfer seamlessly.

2. **Copy from VM to Host:** Copy text or a file within the VM. Switch back to your host system and paste the copied content. Once again, the clipboard contents should be shared smoothly.

## Advantages of Clipboard Sharing

Enabling clipboard sharing through the Spice agent provides several advantages:

- **Efficiency:** Clipboard sharing accelerates copying and pasting between your host and VM, enhancing productivity and reducing manual data transfer.

- **Smooth Workflow:** This feature promotes a seamless workflow, enabling you to effortlessly move data between your host and VM.

- **Enhanced Productivity:** Clipboard sharing empowers you to work more effectively by harnessing the capabilities of both your host and VM.

By following these steps within Virt-Manager, you'll successfully enable clipboard sharing between your host system and virtual machine, making your virtualization experience even more efficient and cohesive.