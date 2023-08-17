---
author: "Arcsly"
title: "Customizing Your GNOME Desktop: Installing Icon Themes"
description: "Personalize your GNOME desktop on Linux by installing icon themes. Easily transform your desktop's appearance using the GNOME Tweaks tool."
tags: ["GNOME", "Linux"]
date: 2023-08-14T08:47:50+0800
thumbnail: https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/preview.png
---

# Customizing Your GNOME Desktop: Installing Icon Themes

Customizing your GNOME desktop environment is a great way to add a personal touch and make your Linux experience truly your own. One of the easiest and most visually impactful ways to do this is by installing icon themes. In this guide, we'll walk you through the process of installing an icon theme on your GNOME desktop using the GNOME Tweaks tool.

## Why Install Icon Themes?

Icon themes provide a quick and effective way to transform the look and feel of your GNOME desktop. By changing the icons used for applications, folders, and system elements, you can give your desktop a fresh and unique appearance that reflects your style.

## Where is the Location Path?

When you install icon themes, they are stored in specific directories on your system. Here are the paths where these themes are located:

> **Note:** The global path applies changes system-wide for all users, while the local path affects only the current user.

### Global Path

The following is the directory where system-wide icon themes are stored:

```shell
/usr/share/icons/
```

### Local Path

For individual user-specific icon themes, the path is:

```shell
~/.local/share/icons/
```

These paths play a crucial role in determining the appearance of your icons across the system. Whether you choose a global or local installation, these directories ensure that your selected icon themes are accessible and enhance the visual experience of your desktop environment.

## Step 1: Install GNOME Tweaks

Before you start the installation process, make sure you have GNOME Tweaks installed. GNOME Tweaks is a powerful tool that allows you to customize various aspects of your GNOME desktop, including themes, icons, fonts, and more.

### Option 1: Using Package Manager (Ubuntu/Debian)

If you're using Ubuntu or a Debian-based distribution, you can install GNOME Tweaks using the package manager. Open your terminal and enter the following command:

```bash
sudo apt install gnome-tweaks
```

### Option 2: Using Package Manager (Fedora)

For Fedora users, you can install GNOME Tweaks using the package manager. Open your terminal and enter the following command:

```bash
sudo dnf install gnome-tweaks
```

### Option 3: Using Package Manager (Arch Linux)

Arch Linux users can install GNOME Tweaks with the following command:

```bash
sudo pacman -S gnome-tweaks
```

## Step 2: Choose an Icon Theme

Before you start the installation process, you need to choose an icon theme that resonates with you. There are numerous icon themes available, each with its own design and aesthetic. For this guide, we'll demonstrate the installation of the popular "Papirus" icon theme.

## Step 3: Installation

Once you have GNOME Tweaks installed, it's time to add a new icon theme to your system. Follow these steps to use the Linux Pacman package manager for a seamless installation process.

### Option 1: Using Pacman (Arch Linux)

If you're using Arch Linux or an Arch-based distribution, you can install the Papirus icon theme using the package manager. Open your terminal and enter the following command:

```bash
sudo pacman -S papirus-icon-theme
```

This command will fetch and install the Papirus icon theme from the official Arch Linux repositories. Please note that the `papirus-icon-theme` package is available in the community repository.

### Option 2: Using AUR (Arch User Repository)

Alternatively, you can install the `papirus-icon-theme-git` package from the Arch User Repository (AUR). First, ensure you have an AUR helper like `yay` installed. Then, use the following command:

```bash
yay -S papirus-icon-theme-git
```

The AUR version might provide the latest updates and features of the Papirus icon theme.

After installing the icon theme, you'll want to update the icon cache to ensure that your system recognizes the new icons. This is important because sometimes newly installed themes might not work immediately. To update the icon cache, run the following command:

```shell
sudo gtk-update-icon-cache -q -t -f /usr/share/icons/Papirus
```

By following either of these options and updating the icon cache, you can easily enhance your GNOME desktop with the stylish Papirus icon theme, giving your system a fresh and visually appealing look.


## Step 4: Applying the Icon Theme

Once you have successfully installed the icon theme, you can apply it to your GNOME desktop using GNOME Tweaks.

1. **Open GNOME Tweaks:** Press the `Super` key (Windows key) and search for "Tweaks." Click on the "Tweaks" application to open it.

2. **Select Icons:** In the left sidebar of GNOME Tweaks, click on "Appearance." Under the "Icons" section, you'll see a dropdown menu. Click on it and select the "Papirus" icon theme.

3. **Enjoy Your New Icons:** The selected icon theme will be applied immediately. You'll notice that the icons for applications, folders, and system elements have changed according to the theme you chose.

## Exploring Further

Installing an icon theme is just the beginning of customizing your GNOME desktop. You can further enhance your experience by tweaking other aspects of the desktop, such as the GTK theme, shell theme, and extensions. With each customization, you can create a desktop environment that truly reflects your style and preferences.

Remember that the world of Linux offers a plethora of icon themes to choose from. Feel free to explore different themes until you find the one that speaks to you the most.

## Conclusion

Customizing your GNOME desktop with icon themes using the GNOME Tweaks tool is a fantastic way to express your creativity and personalize your Linux experience. The process is straightforward, and you can easily switch between different themes to find the one that suits you best. Whether you prefer a sleek and modern look or a more playful and artistic vibe, icon themes allow you to transform your desktop into a visual masterpiece.

So go ahead, install GNOME Tweaks, choose an icon theme, Happy customizing!