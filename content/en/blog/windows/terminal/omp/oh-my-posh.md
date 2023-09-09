---
author: "Arcsly"
title: "Windows Terminal: A Guide to Installing Oh My Posh and Customize"
description: "Transform your Windows terminal experience with Oh My Posh! Follow this guide to learn how to install and customize this sleek and powerful prompt framework."
tags: ["Windows", "oh my posh"]
date: 2022-06-23T02:19:58+0800
thumbnail: https://raw.githubusercontent.com/jandedobbeleer/oh-my-posh/main/website/static/img/logo.png
lastmod: 2023-09-09T10:00:20+0800
---

## Why Oh My Posh?

Are you tired of the same old, bland terminal prompts on your Windows system? Do you yearn for a more stylish and functional command-line experience? Look no further than Oh My Posh! This dynamic and customizable prompt framework can take your terminal game to the next level. In this guide, we'll walk you through the process of installing and setting up Oh My Posh on your Windows machine.

## What is Oh My Posh?

Oh My Posh is a versatile and extensible prompt framework designed to enhance the appearance and functionality of your terminal. With Oh My Posh, you can create visually appealing and informative prompts that display relevant information about your environment, such as the current directory, Git branch, and more. It's a fantastic tool for developers, system administrators, and anyone who spends a significant amount of time in the terminal.

## Install Windows Terminal

Before we begin installing Oh My Posh, ensure that you have Windows Terminal installed on your system. You can easily find it on the Microsoft Store using the following link: [Windows Terminal on Microsoft Store](ms-windows-store://pdp/?productid=XP8K0HKJFRXGCK). Simply click the link to navigate to the store and install Windows Terminal.

## Install Oh My Posh

Installing Oh My Posh on your Windows system is a breeze, and you have multiple options to choose from. Whether you prefer package managers or manual installation. Here are three methods to install Oh My Posh:

### Method 1: Using `winget`

For using `winget` (Windows Package Manager) install Oh My Posh, using the following command:

```powershell
winget install JanDeDobbeleer.OhMyPosh -s winget
```

### Method 2: Using `scoop`

For those who rely on `scoop` (the Windows command-line installer), installing Oh My Posh is as simple as running this command:

```powershell
scoop install https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json
```

### Method 3: `Manual` Installation

If you prefer manual installation, follow these steps:

1. Open your PowerShell terminal as an administrator.

2. Run the following command to set the execution policy and bypass any restrictions:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force;
```

3. Next, execute the following command to download and install Oh My Posh:

```powershell
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://ohmyposh.dev/install.ps1'))
```

And that's it! Oh My Posh is now successfully installed on your Windows system.

## Understanding Nerd Fonts

Nerd Fonts are specialized fonts that have been patched to include a wide range of icons and symbols. These fonts are essential for Oh My Posh to display icons associated with themes and prompts correctly.

> Notes: While various Nerd Fonts are compatible with Oh My Posh,In the official website, the developer recommends that you use the [Meslo LGM NF](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Meslo.zip) for the best experience.

### Installing Fonts for Oh My Posh

When it comes to personalizing your terminal experience with Oh My Posh, fonts play a crucial role in adding style and functionality. Nerd Fonts, a collection of fonts patched with icons, are the go-to choice for Oh My Posh users. In this guide, we'll walk you through the process of installing Nerd Fonts to enhance your Oh My Posh experience.

#### Way1: Using Oh My Posh's CLI for Font Installation

Oh My Posh simplifies the process of installing Nerd Fonts with its built-in CLI (Command Line Interface). Follow these steps to install a Nerd Font using the CLI:

1. Open your terminal as an administrator for system-wide font installation. Alternatively, if you lack admin rights, you can use the `--user` flag, keeping in mind that this may have certain side effects with specific applications.

2. Execute the following command to start the font installation process:

```powershell
oh-my-posh font install
```

#### Way2: Manual Installation of Nerd Fonts

Alternatively, you can manually install Nerd Fonts by following these steps:

1. Visit the Nerd Fonts website at [www.nerdfonts.com](https://www.nerdfonts.com/font-downloads).

2. Download the zip archive containing your preferred Nerd Font.

3. Extract the contents of the zip archive.

4. Right-click on each font file and select "Install" to install the fonts on your system.

#### Adjusting Terminal Font Settings

To fully benefit from the installed Nerd Fonts, you might need to configure your terminal to use them. Here's how you can do it:

1. Open your terminal.

2. Access the terminal's settings or preferences menu. This can typically be found in the menu bar.

3. Navigate to the "Presets," "Profiles," or "Appearance" section.

4. Look for the font settings and select the Nerd Font you installed. Adjust the font size if needed.

##### Visual Guide

For a visual walkthrough of the font installation process, refer to the following animated guide:

![Install Nerd Fonts](/blog/win/windows-install-oh-my-posh/set-fonts.gif)

## Browsing and Selecting Themes

To discover the available themes, you can visit the official Oh My Posh themes documentation [here](https://ohmyposh.dev/docs/themes). Here, you'll find a collection of themes, each designed to provide a unique and captivating terminal prompt.

### Listing Available Themes

1. **Discover Themes**: To explore the wide array of available themes, navigate to the official Oh My Posh themes documentation by clicking here. Here, you'll find an enticing collection of themes, each meticulously designed to offer a distinctive and engaging terminal prompt.

2. **Command-Line Discovery**: Alternatively, you can use the command line to list all the available themes. Open your terminal and execute the following command:

```powershell
Get-PoshThemes
```

![listing-themes](/blog/win/windows-install-oh-my-posh/list.gif)

### Previewing Themes

Before applying a theme, it's a good idea to preview how it will look on your terminal. You can use the following command to see how a specific theme would appear:

```powershell
oh-my-posh init pwsh --config $env:POSH_THEMES_PATH\<theme_name>.omp.json | Invoke-Expression
```

Replace <theme_name> with the actual name of the theme you're interested in.

This command allows you to get a real-time preview of how the selected theme will affect your terminal prompt. It's a convenient way to try out different themes and see which one resonates with your style.

### Applying the Themes

After you've found a theme that catches your eye, it's time to make it your own. To get started, follow these steps:

1. **Open Your Terminal**: Launch your terminal application to begin the customization process.

2. **Create a Profile Script**: If you don't have a profile script already, you'll need to create one. The profile script controls the configuration settings for your terminal. Use the following command to create a new profile script:

   ```powershell
   New-Item -Path $PROFILE -Type File -Force
   ```

   This command will create a new profile script in the specified path.

3. **Access Theme Configuration**: To edit the `$PROFILE` script, you can use the Notepad text editor. Open Notepad and then open the `$PROFILE` script using the command:

   ```powershell
   notepad $PROFILE
   ```

   The path to the `$PROFILE` script is typically:

   ```plain
   C:\Users\<Your_Username>\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
   ```

4. **Selecting a Theme**:

   a. **Option 1 - Set-PoshPrompt**:
   Locate the line that sets the theme using the `Set-PoshPrompt` command. Modify this line to reflect the name of the theme you want to use. For example:

   ```powershell
   Set-PoshPrompt -Theme theme_name
   ```

   Replace `theme_name` with the actual name of the theme you selected.

   b. **Option 2 - oh-my-posh init**:
   Alternatively, you can use the following command to select a theme and apply it directly to your current terminal session:

   ```powershell
   oh-my-posh init pwsh --config $env:POSH_THEMES_PATH\<theme_name>.omp.json | Invoke-Expression
   ```

   Replace `theme_name` with the actual name of the theme you selected.

5. **Save and Apply Changes**: Save the changes to the `$PROFILE` script in Notepad and close the editor.

By following these steps, you'll seamlessly integrate your chosen theme into your terminal environment, allowing you to enjoy a personalized and visually appealing command-line experience.

## Optional: Installing and Inserting Required Modules

In this section, we will walk through the process of installing and inserting the necessary modules to enhance your Oh My Posh experience. These modules provide additional features such as displaying illustrations, colors, command history, and Git information. Let's get started!

>Notes: Before you proceed, please open PowerShell as an <code>Administrator</code>.

### Install PSReadLine Module

The `PSReadLine` module is essential for displaying the commands you've entered before, making it convenient for you to re-enter commands.

```powershell
Install-Module PSReadLine -Force
```

### Install posh-git Module

The `posh-git` module is used to display Git information from your current repository (if you're in a Git repository).

```powershell
Install-Module posh-git -Force
```

### Install Terminal-icons Module

The `Terminal-icons` module enhances your command console by displaying icons for your files and folders, adding a visually appealing touch to your terminal.

```powershell
Install-Module Terminal-icons -Force
```

## Inserting Modules for Enhanced Functionality

Now that we've installed the necessary modules, let's delve into how to insert them into PowerShell, allowing you to utilize their functions and enhance your terminal experience. Below, we'll guide you through the process of inserting each module.

### Inserting Terminal-icons Module

The `Terminal-icons` module enhances your command console by displaying icons for files and folders, making your terminal visually engaging and informative. To insert this module, follow these steps:

1. Launch PowerShell.

2. Enter the following command:

   ```powershell
   Import-Module Terminal-icons
   ```

   This will load the `Terminal-icons` module into your PowerShell session.

### Inserting posh-git Module

The `posh-git` module is designed to display Git-related information, such as the current branch name in your repository. To insert this module, proceed as follows:

1. Launch PowerShell.

2. Enter the following command:

   ```powershell
   Import-Module posh-git
   ```

   This command will load the `posh-git` module, enabling its features in your terminal.

### Inserting PSReadLine Module

The `PSReadLine` module enriches your command history experience by offering several modes. To insert this module, follow these steps:

1. Launch PowerShell.

2. Enter the following command:

   ```powershell
   Import-Module PSReadLine
   ```

   This command will load the `PSReadLine` module, providing enhanced command history capabilities.

By inserting these modules, you'll unlock a range of features and visual enhancements that will elevate your PowerShell sessions. Whether you're dealing with files and folders, Git repositories, or command history, these modules will streamline your interactions and make your terminal usage more efficient and enjoyable.

#### PSReadLine Modes for Enhanced Command History

Enhance your PowerShell command history experience with different PSReadLine modes that cater to your preferences and ease of use. PSReadLine offers various modes to facilitate command recall and streamline your interactions with previous commands. Here's how to utilize these modes:

#### PSReadLine Mode: History

This mode mimics the behavior seen on most Linux systems and is a favorite among many users. To enable this mode, use the following command:

> **Note**: In this mode, if the text you're about to enter matches previous text, a gray prompt displays the matching text.

```powershell
Set-PSReadLineOption -PredictionSource History
```

![PSReadLine Mode: History](/blog/win/windows-install-oh-my-posh/history_1.gif)

#### PSReadLine Mode: ListView

The ListView mode presents a list of all commands related to the text you've typed, offering easy command selection. Use the arrow keys (↑ ↓ ← →) to navigate the list, and press Enter to execute the selected command.

>**Tip**: Utilize the arrow keys to navigate and press Enter to execute the selected command.

To activate the ListView mode, execute the following command:

```powershell
Set-PSReadLineOption -PredictionViewStyle ListView
```

![PSReadLine Mode: ListView](/blog/win/windows-install-oh-my-posh/history_2.gif)

By selecting the PSReadLine mode that aligns with your workflow, you can make your PowerShell interactions even more efficient and tailored to your needs. Experiment with these modes to find the one that best suits your preferences.

## Configuring Persistent Modifications in Your PowerShell Profile

While the changes you've made so far are valuable, they only apply to the current terminal window. If you close the window, these modifications will be lost. To ensure that your enhancements remain in effect every time you launch PowerShell, you'll need to make adjustments to your PowerShell profile.

### Opening with Notepad

1. using Notepad to edit files, you can initiate the editing process with the following PowerShell command:

```powershell
notepad $PROFILE
```

#### Modifying the Profile File

2. Once the profile file is open in your preferred text editor, insert the following lines of code:

```powershell
Import-Module Terminal-icons
Import-Module posh-git

Set-PSReadLineOption -PredictionSource History

oh-my-posh init pwsh --config $env:POSH_THEMES_PATH\microverse-power.omp.json | Invoke-Expression
```

3. Save the changes you've made to the profile file and then close the text editor.

By appending these lines to your PowerShell profile, you ensure that the specified modules are loaded and the defined settings are applied each time you initiate PowerShell. With this setup, you'll enjoy a consistent and enriched terminal experience every time you launch PowerShell.

## Article Usage Directives

To facilitate your interaction with this article, here is a concise list of the PowerShell commands and instructions that have been discussed:

1. Installing Oh My Posh using Winget:
   ```powershell
   winget install JanDeDobbeleer.OhMyPosh -s winget
   ```

2. Installing Oh My Posh using Scoop:
   ```powershell
   scoop install https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json
   ```

3. Installing Oh My Posh manually:
   ```powershell
   Set-ExecutionPolicy Bypass -Scope Process -Force; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://ohmyposh.dev/install.ps1'))
   ```

4. Installing the PSReadLine Module:
   ```powershell
   Install-Module PSReadLine-Force
   ```

5. Installing the posh-git Module:
   ```powershell
   Install-Module posh-git-Force
   ```

6. Installing the Terminal-icons Module:
   ```powershell
   Install-Module Terminal-icons -Force
   ```

7. Importing the Terminal-icons Module:
   ```powershell
   Import-Module Terminal-icons
   ```

8. Importing the posh-git Module:
   ```powershell
   Import-Module posh-git
   ```

9. Importing the PSReadLine Module:
   ```powershell
   Import-Module PSReadLine
   ```

10. Setting PSReadLine mode to History:
    ```powershell
    Set-PSReadLineOption -PredictionSource History
    ```

11. Setting PSReadLine mode to ListView:
    ```powershell
    Set-PSReadLineOption -PredictionViewStyle ListView
    ```

12. Displaying Available Oh My Posh Themes:
    ```powershell
    Get-PoshThemes
    ```

14. Initializing Oh My Posh with a Chosen Theme:
    ```powershell
    oh-my-posh init pwsh --config $env:POSH_THEMES_PATH\microverse-power.omp.json | Invoke-Expression
    ```

15. Opening Your PowerShell Profile with Notepad:
    ```powershell
    notepad $PROFILE
    ```

## Conclusion

In this guide, we've explored the process of enhancing your Windows terminal experience using Oh My Posh. By incorporating stylish themes, powerful modules, and customizable configurations, you can transform your command-line environment into a more productive and visually appealing workspace. Here's a summary of what we've covered:

1. **Installation and Setup**: We began by installing Oh My Posh using different methods, such as Winget, Scoop, and manual installation. We also emphasized the importance of using Nerd Fonts for optimal display.

2. **Theme Selection**: We introduced you to the wide variety of themes available for Oh My Posh and demonstrated how to preview and choose a theme that suits your style.

3. **Module Installation**: We explored the installation of essential modules—PSReadLine, posh-git, and Terminal-icons. These modules enhance your terminal experience by providing command history, Git information, and file and folder icons.

4. **Module Integration**: We explained how to integrate the installed modules into your PowerShell profile. This ensures that the modules are loaded automatically whenever you start PowerShell, enabling a consistent and enhanced terminal environment.

5. **PSReadLine Modes**: We covered different PSReadLine modes—History and ListView—that enhance command prediction and navigation within your terminal.

6. **Profile Customization**: We guided you through locating and modifying your PowerShell profile file. By adding specific commands to your profile, you can ensure that your chosen themes and modules are seamlessly integrated each time you launch PowerShell.

With the knowledge gained from this guide, you're now equipped to take control of your Windows terminal environment and create a customized workspace that reflects your preferences and boosts your productivity. Whether you're a developer, system administrator, or casual user, Oh My Posh empowers you to make the most of your command-line interactions.

Remember, the journey doesn't end here—experiment with themes, explore more modules, and tweak your settings until you achieve the perfect terminal setup tailored to your needs. Enjoy the powerful and visually pleasing experience that Oh My Posh brings to your Windows terminal!

## References

- https://ohmyposh.dev/docs/
- https://www.kwchang0831.dev/dev-env/pwsh/oh-my-posh