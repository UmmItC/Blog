---
author: "Arcsly"
title: "Scoop: Empowering Your Windows Terminal with Essential Tools and a Package Manager"
description: "Enhance Your Terminal Efficiency with Scoop – Discover How to Install and Utilize this Windows Package Manager!"
tags: ["Windows", "scoop", "Package Manager"]
date: 2021-12-11T03:55:19+0800
thumbnail: https://www.onmsft.com/wp-content/uploads/2019/07/IMG_20190723_153351.jpg
lastmod: 2023-08-30T22:42:00+0800
---

# Why Scoop?

Are you tired of the hassle of managing software installations on your Windows system? If you're looking for an efficient and command-line-based package manager, you're in for a treat! Enter Scoop, a versatile package manager that can simplify your software management tasks. In this guide, we'll walk you through the process of installing Scoop and How to using this package manager.

Before we dive into the details, if you're curious and eager to get started right away, you can find the official Scoop website at [here](https://scoop.sh/). This will be your go-to resource for Scoop.

## What is Scoop?

Scoop is a nifty package manager designed exclusively for Windows systems. It allows you to install, update, and uninstall software packages from the command line, all without the need for clicking through wizards or prompts. With Scoop, software management becomes a breeze, and you can focus on what matters most: getting things done.

### Getting Started: Installing Scoop

To get started with Scoop, follow these simple steps:

1. **Open a PowerShell terminal:** Launch your PowerShell terminal.

2. **Set Execution Policy (Optional):** If this is your first time running a remote script, you might need to set the execution policy to allow it. Use the following command:

   ```powershell
   Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```

3. **Install Scoop:** Now, it's time to install Scoop. Run the following command:

   ```powershell
   irm get.scoop.sh | iex
   ```

   This command retrieves the installation script from the internet and runs it using the `iex` (Invoke-Expression) command.

And that's it! You now have Scoop installed and ready to roll.

### Basic Usage: Install and Update Database

With Scoop installed, you can start exploring its capabilities:

- **Installing Packages:** Use the `scoop install` command followed by the name of the package to install software effortlessly. For example:

  ```powershell
  scoop install git
  ```

- **Updating Packages:** Keep your software up to date with the `scoop update` command:

  ```powershell
  scoop update
  ```

- **Updating All Packages:** While the `scoop update --all` command is a convenient way to update all packages installed via Scoop,

    >Notes: there might be instances where this command doesn't work as expected. In such cases, you may need to manually update specific packages using their individual update commands. This ensures that you're getting the most accurate and up-to-date updates for each package.

  ```powershell
  scoop update --all
  ```

  Keep in mind that, occasionally, the nature of certain packages or dependencies might require a manual update approach to ensure everything works smoothly.

- **Listing Installed Packages:** To see a list of all installed packages, you can use the `scoop list` command:

  ```powershell
  scoop list
  ```

  If you're unsure about the exact name of a package, you can use this command to quickly identify installed packages.

- **Updating Specific Packages:** If you want to ensure the update of a specific package, you can use the `scoop update` command followed by the package name. For instance, to update Git:

  ```powershell
  scoop update git
  ```

  If you're not sure about the package name, you can refer to the list of installed packages using `scoop list`.

Remember, staying up to date with package updates helps ensure your system is secure and that you're benefiting from the latest features and improvements.

## Installing and Managing Packages with Scoop: Global vs. User Installations

If you're familiar with Linux, you've probably encountered the convenience of `sudo` for executing commands with superuser permissions. In the Windows world, there's a similar concept where you can install packages either globally (accessible by all users on the system) or locally (for your user account) using Scoop, a powerful package manager. This distinction is determined using the `-g` flag in the `scoop install` command.

### Local Installation: Tailored for Your User Account

A local installation is a great choice if you prefer to manage packages separately for each user on your system. By omitting the `-g` flag during installation, you're essentially telling Scoop to install the package locally, making it specific to your user account. The advantage of this approach is that you can keep your set of tools and utilities separate from those of other users. The best part? You won't need superuser permissions for installation.

Here's the command for a local installation:

```shell
scoop install <package>
```

Replace `<package>` with the name of the package you want to install.

### Global Installation: Available System-Wide

On the other hand, if you want a package to be accessible to all users on the system, a global installation is the way to go. This involves using the `-g` flag during installation. By doing so, you're instructing Scoop to install the package globally, making it available from any user account. However, it's important to note that installing a package globally using the `-g` flag requires superuser permissions. This is because global installation involves making system-wide changes that affect all users.

>**Tip**: If you only need a package to be available for your user account, you can install it locally without using the `-g` flag. This ensures that you won't require superuser permissions for installation, and the package will remain exclusive to your user.

Here's the command for a global installation:

```shell
scoop install -g <package>
```

Replace `<package>` with the name of the package you intend to install.

By understanding the difference between local and global installations and the role of the `-g` flag, you can tailor your package management approach to suit your needs. With this knowledge, you can make the most of Scoop and efficiently organize your Windows terminal sessions.

## Simplify Superuser Tasks with Scoop and gsudo

Have you ever found yourself frustrated by the need to repeatedly right-click to open the Windows Terminal with superuser permissions? If so, there's a solution that can save you time and hassle: the `gsudo` package. This tool, which is available through Scoop, allows you to perform tasks that require administrative access without the need for right-clicking. Here's how to get started with `gsudo` using the global installation approach.

### Install gsudo Globally

To make the most of `gsudo`, I recommend a global installation. This way, the tool will be available system-wide, ensuring that you can use it from any user account. Let's go through the steps:

1. **Open the Terminal as Superuser**: Begin by opening the terminal with superuser privileges. This step is crucial as you'll need superuser access to install packages globally.

2. **Install gsudo**: Use the following command to install `gsudo` globally:

   ```shell
   scoop install -g gsudo
   ```

   By using the `-g` flag, you're installing `gsudo` in a way that's accessible to all users on the system.

3. **Restart Your Terminal**: After the installation is complete, restart your terminal to ensure that the changes take effect.

4. **Enjoy Effortless Superuser Access**: That's it! With `gsudo` installed, you can now use the `sudo` command in your terminal. When you do, a popup window will appear, requesting superuser permissions. This means you can perform administrative tasks without the need to right-click and open a new terminal window each time.

By opting for the global installation of `gsudo`, you're streamlining your workflow and eliminating the need for repetitive actions. Whether you're managing files, configuring settings, or performing other administrative tasks, `gsudo` simplifies the process and enhances your overall terminal experience.

#### Putting gsudo to the Test

Now that you have `gsudo` installed, it's time to put it to the test! If you're not familiar with Linux commands, don't worry—I'll guide you through the process. With `gsudo`, you can perform tasks that require superuser permissions without having to right-click and open the application as an administrator.

Here's a practical example of how to use `gsudo` to open Notepad with superuser privileges:

1. **Open the Terminal**: Launch the terminal to get started.

2. **Use `gsudo`**: With `gsudo`, you can use either the `sudo` or `gsudo` command. They both work the same way. To open Notepad with superuser permissions, simply type:

   ```shell
   sudo notepad
   ```

   This command tells the terminal to run Notepad with superuser privileges, allowing you to edit system files and perform administrative tasks.

3. **Enter Your Password**: After executing the command, a popup window will appear, asking for your permission to run Notepad with superuser privileges. Enter your password to proceed.

4. **Start Editing**: Voila! Notepad is now open with the necessary permissions. You can use it to edit files that require administrative access.

By using `gsudo`, you've eliminated the need for repetitive right-click actions to open applications with superuser privileges. This streamlined approach enhances your workflow and makes it easier to perform administrative tasks from the command line.

## Conclusion

Scoop is a fantastic tool that simplifies software management on Windows systems. By following the steps outlined in this guide, you've successfully installed Scoop and unlocked a world of efficient package management. From installing software to keeping it updated, Scoop has your back, saving you time and effort.

So why not embrace the power of Scoop and take control of your software ecosystem? With Scoop's command-line convenience, you'll be amazed at how smoothly software management can be. Get ready to streamline your system and focus on what truly matters!