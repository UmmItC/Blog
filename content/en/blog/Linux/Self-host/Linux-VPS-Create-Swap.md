---
author: "Arcsly"
title: "Step-by-Step Guide: Creating a Swap File on Your Linux VPS"
description: "Enhance your Linux VPS's performance and memory management by adding a swap file. Follow our detailed walkthrough to learn how to create a swap file on your Linux VPS."
tags: ["VPS", "SSH", "Linux", "Swap"]
date: 2023-08-14T09:15:24+08:00
thumbnail: https://images.unsplash.com/photo-1640552435845-d65c23b75934?ixlib=rb-4.0.3
---

## Introduction

Adding a swap file to your Linux Virtual Private Server (VPS) can significantly enhance system performance and optimize memory management. In this guide, we will provide a step-by-step walkthrough to help you create a swap file on your Linux VPS.

## Why Enable Swap?

Enabling swap on your Linux VPS system can significantly enhance its performance and ensure smoother operations. Linux is renowned for its ability to run efficiently on low-spec hardware, making it possible to operate servers even with limited resources such as 512MB RAM or 1GB RAM. However, there are instances when these resources may prove inadequate for certain workloads.

This is where a swap file comes into play. It acts as a supplementary form of memory that the system can utilize when physical RAM is exhausted. Here's why enabling swap is beneficial:

1. **Improved Multitasking:** Swap facilitates smoother multitasking by providing supplementary memory capacity for processes and applications to operate effectively. This enhanced memory management ensures your VPS can seamlessly handle multiple tasks simultaneously.

2. **Memory Safety Net:** In scenarios where memory-intensive processes surge unexpectedly, swap acts as a safety net, preventing your system from becoming unresponsive or crashing. This safety mechanism ensures the stability of your VPS during varying workloads.

3. **Smooth Operations:** With swap in place, your VPS can gracefully navigate through instances of high memory demand. This results in consistently smooth and reliable performance, even during periods of resource strain.

4. **Optimal Performance:** By harmonizing physical RAM with swap space, your VPS achieves an equilibrium that optimizes its performance. This equilibrium empowers your system to proficiently manage memory-intensive tasks without compromising its overall responsiveness.

5. **Enhanced Workload Capacity:** Enabling swap effectively broadens the spectrum of tasks your VPS can adeptly handle. By extending its capabilities through additional memory, your system becomes more adaptable to diverse workloads, ensuring a seamless user experience regardless of hardware limitations.

Enabling swap effectively extends the capabilities of your VPS, allowing it to handle a broader range of workloads and ensuring a seamless user experience, even when operating with modest hardware resources.

## Step 1: Checking Existing Swap Space (Optional)

Before proceeding with creating a new swap file, it's advisable to check if your VPS already has active swap space. Open a terminal and run the following command:

```shell
sudo swapon --show
```

If there is no output, your VPS likely doesn't have active swap space, making it an ideal candidate for creating a new swap file.

## Step 2: Creating the Swap File

To create a 2GB swap file, follow these steps:

1. Connect to your VPS via SSH.

2. Execute the following command to create a 2GB swap file (you can adjust the size as needed):

```shell
sudo fallocate -l 2G /swapfile
```

3. Set appropriate permissions for the swap file:

```shell
sudo chmod 600 /swapfile
```

4. Prepare the swap file:

```shell
sudo mkswap /swapfile
```

## Step 3: Enabling the Swap File

Once the swap file is created, enable it with the following command:

```shell
sudo swapon /swapfile
```

## Step 4: Making the Swap File Permanent

Ensuring the continuity of the swap file's functionality after a system reboot requires creating an entry in the `/etc/fstab` file. This file holds a pivotal role in delineating filesystems and devices, including the essential swap space. Let's illuminate the significance of the `defaults 0 0` parameters:

- **`defaults`:** This amalgamation of mount options consolidates prudent settings for a range of scenarios. It encompasses attributes like `rw` (read-write) and `auto` (automatic mounting during boot).
- **`0`:** This numeric value serves as a lodestar for filesystem checkers (fsck), orchestrating the sequence for assessing filesystems. Since swap space merits examination after other filesystems, the value is judiciously set at 0.
- **`0`:** This value exerts influence over whether the filesystem is subjected to backups through the `dump` command. Given swap space's unique nature—eschewing backups—this value stands resolutely at 0.

In simpler terms, `defaults 0 0` deftly choreographs an automatic, tailored mount of the swap file during boot, follows with scrutiny of other filesystems, and gracefully sidesteps backup procedures.

Now, let's give life to this insight:

1. Wield a text editor, such as nano, to unveil the `/etc/fstab` file's internal mechanisms:

```shell
sudo nano /etc/fstab
```

2. There, an unblemished canvas awaits your artistic touch. Paint a promising future with the following strokes:

```plaintext
/swapfile swap swap defaults 0 0
```

3. Alternatively, should efficiency beckon, employ this optional command to seamlessly weave the required entry into the `/etc/fstab` fabric:

```shell
sudo sh -c "echo '/swapfile swap swap defaults 0 0' >> /etc/fstab"
```

With this optional command, you artfully inscribe the necessary entry into the `/etc/fstab` tapestry.

- **`sudo`:** This command elevates subsequent commands with superuser privileges, often necessitated by administrator permissions.
- **`sh -c`:** This invocation of the shell (sh) with the `-c` flag births the execution of the ensuing command.
- **`"echo '/swapfile swap swap defaults 0 0' >> /etc/fstab"`:** This command, encased in double quotes, journeys into the shell's domain for execution. The `echo` command composes the specified line (`/swapfile swap swap defaults 0 0`) onto the canvas of the `/etc/fstab` file. The `>>` operator graciously appends the output of the `echo` command to the file.

In essence, the orchestrational prowess of `sh -c` enables you to wield a command as if you were speaking it directly into a shell—offering an elegant avenue for executing a singular command or succinct script within a tailored context.

## Step 5: Adjusting Swappiness (Optional)

Swappiness is a kernel parameter that controls the tendency of the Linux system to move processes out of physical memory (RAM) and onto the swap file. By adjusting the swappiness value, you can fine-tune how aggressively your system uses swap space.

Here's how you can do it:

1. Open the `/etc/sysctl.conf` file using a text editor like nano:

```shell
sudo nano /etc/sysctl.conf
```

2. Add the following line at the end of the file, adjusting the value to your preference (replace `10` with your desired value):

```plaintext
vm.swappiness=10
```

   The swappiness value ranges from 0 to 100. A lower value, like 10, means the system will use swap space less aggressively, favoring physical memory. A higher value, like 60, makes the system more willing to use swap space.

3. Save the file and exit the text editor.

Modifying the swappiness value can be particularly useful if you have sufficient RAM, and you want to minimize the use of swap space unless it's absolutely necessary. Conversely, if you find your system frequently using swap even when there's available RAM, you might consider raising the swappiness value to make more use of the swap space.

## Step 6: Rebooting Your VPS

To bring the changes into effect, initiate a reboot of your VPS:

```shell
sudo reboot
```

## Step 7: Verifying Swap Activation

Ensuring the successful activation of your swap file is imperative. You can employ tools like `htop`, `btop`, or the command `swapon --show` to validate the presence and utilization of your swap space.

- **htop:** Launch the `htop` utility to visualize system processes and memory usage. Look for the swap entry in the memory information section.

- **btop:** Similarly, you can use `btop` to monitor system resources. Check for swap information in the displayed data.

- **`swapon --show`:** Alternatively, execute the command `swapon --show` in the terminal. This will provide a concise overview of active swap devices and their respective sizes.

Confirming the presence and engagement of swap space ensures that your VPS is equipped to gracefully manage memory and handle resource-intensive tasks.

## Bonus: Deleting a Swap File (If Needed)

If you find yourself needing to remove the swap file from your Linux VPS, you can follow these steps:

1. **Disable Swap**: To begin, deactivate the swap file using the following command. This command includes the `--verbose` option to provide detailed feedback on the operation:

   ```shell
   sudo swapoff --verbose /swapfile
   ```

   The `--verbose` flag ensures that you receive clear feedback about the deactivation process. This step is crucial before proceeding with the removal of the swap file.

Remember, each step should be performed carefully to ensure the proper functioning of your system.

2. **Remove the Entry from /etc/fstab**: Open the `/etc/fstab` file in a text editor:

   ```shell
   sudo nano /etc/fstab
   ```

    **[Optional] One-line Solution:** To remove the line associated with the swap file from `/etc/fstab`, which typically resembles `/swapfile swap swap defaults 0 0`, you have two options. First, manually locate and delete the line. Alternatively, you can use a single command to achieve this by employing `sed`:

    ```shell
    sudo sed -i '/\/swapfile/d' /etc/fstab
    ```

After executing the command, save the file and exit the text editor to complete the process. Please exercise caution when using the `sed` command, as it directly modifies files. Always ensure you have proper backups or are confident in the changes you are making.

3. **Delete the Swap File**: Finally, delete the swap file using:

   ```shell
   sudo rm /swapfile
   ```

   Confirm the deletion if prompted.

Please exercise caution when using the `sed` command, as it directly modifies files. Ensure that you have a backup or are confident in the changes you are making.

Remember, removing a swap file can impact your system's performance, so make sure to consider your system's requirements before proceeding with the deletion.

## Conclusion

By understanding the process of creating, adjusting, and if necessary, deleting a swap file, you have gained valuable insights into managing memory on your Linux VPS. These techniques empower you to fine-tune your system's performance and ensure optimal resource utilization, even during resource-intensive tasks.

## Reference

- https://phoenixnap.com/kb/linux-swap-file