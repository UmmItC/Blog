---
author: "Arcsly"
title: "After installed Arch Linux 10 key actions"
description: "top 10 crucial tasks to perform after installing Arch Linux for an optimized and enriched experience."
tags: ["Arch Linux"]
date: 2023-08-05T01:08:00+0800
thumbnail: https://i.redd.it/jsh32mpidhuy.png
---

## Setting Up Arch Linux (Keep update)

Once you have Arch Linux installed, there are a few key tasks you should complete to optimize your experience. Let's walk through them:

### 1. Activate Multilib Repositories

Enhance your Arch Linux system's versatility by enabling the multilib repositories, which provide support for running both 32-bit and 64-bit applications. Follow these steps to activate multilib repositories:

1. Open your terminal application.

2. Type the following command and press Enter to open the `pacman.conf` file in the Nano text editor:

   ```shell
   sudo nano /etc/pacman.conf
   ```

3. In the text editor, navigate to the `[multilib]` section. It should look similar to this:

   ```plaintext
   [multilib]
   Include = /etc/pacman.d/mirrorlist
   ```

4. Remove the `#` character at the beginning of the `[multilib]` line to uncomment it.

5. Save the changes you made by pressing `Ctrl + O`, then press Enter. Exit the text editor by pressing `Ctrl + X`.

6. To update the package database and synchronize the multilib repositories for the first time, execute the following command:

```shell
sudo pacman -Sy
```

By completing these steps, you've successfully activated the multilib repositories on your Arch Linux system. This enables you to run a wider range of applications and ensures better compatibility.

### 2. Optimize Package Mirrors with Reflector

let's enhance your package management by optimizing your mirrorlist. 

1. Run the following command to install reflector:

```shell
sudo pacman -S reflector
```

2. getting the lastest 10 mirrors based on your country.

```shell
sudo reflector --verbose --country <your_country> -l 10 --sort rate --save /etc/pacman.d/mirrorlist --protocol https
```

- `--protocol https`: Specifies to use HTTPS protocol for fetching mirror information.
- `--country <your_country_code>`: Replace `<your_country_code>` with the code of your country (e.g., `us` for the United States, `ca` for Canada).
- `--verbose`: Enables verbose output to see the log of the process.
- `-l 10`: Retrieves the latest 10 mirrors based on specified criteria.
- `--sort rate`: Sorts the mirrors by download rate (speed).
- `--save /etc/pacman.d/mirrorlist`: Saves the optimized mirrorlist to the specified path.

```shell
sudo pacman -Sy
```

By running this command, you'll efficiently optimize your mirrorlist, ensuring faster and more reliable package downloads and update the package database and synchronize the mirrorlist for the first time.

### 3. Enhance Visual Experience

Elevate your Arch Linux environment with captivating visual enhancements. Follow these simple steps to breathe life into your interface:

#### 3.2 Enable "ILoveCandy" Animation

1. Type the following command and press Enter:

```shell
sudo nano /etc/pacman.conf
```

2. In the text editor that opens, navigate using the arrow keys to find the `[options]` section.

3. Add the following line at the end of the `[options]` section:

```shell
ILoveCandy
```

4. Save the file by pressing `Ctrl + S`, then exit the text editor by pressing `Ctrl + X`.

5. Now the process bar will shown the `c` animation!

#### 3.3 Infuse Vibrancy with "Color"

1. Open your terminal application.

2. Type the following command and press Enter:

   ```shell
   sudo nano /etc/pacman.conf
   ```

3. In the text editor, locate the `[options]` section.

4. Add the following line to enable colorful output:

```shell
Color
```

5. Save the file by pressing `Ctrl + S`, then exit the text editor by pressing `Ctrl + X`.

By following these steps, you'll inject a playful touch with "ILoveCandy" animation and add vibrant colors to your Arch Linux interface. Enjoy a more visually engaging experience!

### 4. Install Game Drivers (AMDGPU Users)

For those using AMDGPU, elevate your gaming potential. Execute:

```shell
sudo pacman -Sy
sudo pacman -S lib32-mesa mesa lib32-vulkan-radeon vulkan-radeon amdvlk xf86-video-amdgpu
```

### 5. Gnome Users: Enhance Browsing Experience

For Gnome users, elevate your browsing capabilities with the gnome-browser-connector. Install it using:

```shell
sudo pacman -S gnome-browser-connector
```

Once installed, you'll be able to effortlessly install extensions from [https://extensions.gnome.org/](https://extensions.gnome.org/).

By completing these tasks, you'll optimize your Arch Linux environment, enriching your experience and unleashing its full potential. Enjoy your enhanced system!

### 6. Customize Your GNOME Environment

Arch Linux offers a default GNOME environment that's visually appealing, but you still can customize it to reflect your unique style and preferences.

### 7: Install Yay AUR Helper and Yay-bin for Different Needs

Simplifying software management on Arch Linux is the `yay` package manager, designed to streamline the acquisition and organization of software from the Arch User Repository (AUR)—a vibrant hub of community-contributed packages. Depending on your preference for customization and speed, you have two choices: `yay` and `yay-bin`.

Here's a comprehensive guide to installing both `yay` and `yay-bin` using Git, alongside the essential development tools, ensuring a tailored experience:

1. **Install Git and Essential Development Tools:**

   Start by laying a solid foundation with essential development tools from the `base` and `base-devel` package groups. If these are not present, you can install them with the command:

   ```shell
   sudo pacman -S git base base-devel
   ```

2. **Installing `yay` for Customization:**

   If you're inclined towards customization and don't mind investing a bit more time, consider building `yay` from source. Begin by cloning the `yay` repository from the Arch User Repository (AUR) using:

   ```shell
   git clone https://aur.archlinux.org/yay.git
   ```

   Navigate to the cloned `yay` folder:

   ```shell
   cd yay
   ```

   Build and install `yay` with the following commands:

   ```shell
   makepkg -si
   ```

   Respond to prompts and grant necessary permissions during installation.

3. **Installing `yay-bin` for Swiftness:**

   On the other hand, if time efficiency is your priority, opt for the pre-compiled `yay-bin` version. This version eliminates the build phase for quicker installation. Begin by cloning the `yay-bin` repository from the Arch User Repository (AUR) using:

   ```shell
   git clone https://aur.archlinux.org/yay-bin.git
   ```

   Navigate to the cloned `yay-bin` folder:

   ```shell
   cd yay-bin
   ```

   Build and install `yay-bin` with the following commands:

   ```shell
   makepkg -si
   ```

   Respond to prompts and grant necessary permissions during installation.

4. **Start Using `yay`:**

   With your preferred version of `yay` set up, you're ready to delve into the world of AUR packages. Whether you've installed `yay` or `yay-bin`, the command for package installation remains the same:

   ```shell
   yay -S package-name
   ```

   Harness this unified command to explore and install packages, shaping your Arch Linux environment to match your distinct preferences.

By providing separate installation paths for `yay` and `yay-bin` while maintaining a consistent command for usage, you have the flexibility to personalize your Arch Linux experience with either the meticulousness of source-based installation or the swiftness of pre-compiled binaries.

### 8. Install Your Daily Software

With your Arch Linux system set up and customized, it's time to install some essential software that you use on a daily basis.
Install the Firefox web browser and VLC media player using the `yay` AUR helper.

#### Install Firefox

   To install Firefox, use the following command:

   ```shell
   sudo pacman -S firefox
   ```

#### Install VLC

   To install VLC media player, use the following command:

   ```shell
   sudo pacman -S vlc
   ```

With Firefox and VLC installed, you now have access to a web browser and media player, allowing you to browse the web and enjoy multimedia content on your Arch Linux system.

### 9. Install Firewall (UFW)

When it comes to securing your system, a firewall plays a crucial role in controlling incoming and outgoing network traffic. While Arch Linux doesn't come with a pre-installed firewall, you can easily set up the Uncomplicated Firewall (UFW) to manage network access.

   #### 1. Install UFW 
   
   open a terminal and enter the following command:

   ```shell
   sudo pacman -S ufw
   ```

   #### 2. Enable UFW
   
   After installing UFW, enable it with the following command:

   ```shell
   sudo ufw enable
   ```

Once UFW is enabled, you can start managing your firewall rules to enhance the security of your Arch Linux system. Don't forget to configure UFW rules to allow necessary network services while blocking unauthorized access.

By following these steps, you've covered some of the most essential tasks to set up and optimize your Arch Linux system for daily use. Whether you're browsing the web, enjoying multimedia, or ensuring network security, you're well-equipped to make the most out of your Arch Linux experience.