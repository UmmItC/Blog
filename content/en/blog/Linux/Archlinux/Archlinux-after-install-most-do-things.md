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

#### Enable "ILoveCandy" Animation

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

#### Infuse Vibrancy with "Color"

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
sudo pacman -S lib32-mesa mesa vulkan-radeon amdvlk lib32-vulkan-radeon xf86-video-amdgpu
```

### 5. Gnome Users: Enhance Browsing Experience

For Gnome users, elevate your browsing capabilities with the gnome-browser-connector. Install it using:

```shell
sudo pacman -S gnome-browser-connector
```

Once installed, you'll be able to effortlessly install extensions from [https://extensions.gnome.org/](https://extensions.gnome.org/).

By completing these tasks, you'll optimize your Arch Linux environment, enriching your experience and unleashing its full potential. Enjoy your enhanced system!

### 6. Customize Your Gnome

Arch Linux offers a default GNOME environment that's visually appealing, but you still can customize it to reflect your unique style and preferences.