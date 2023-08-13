---
author: "Arcsly"
title: "Boost AUR Compilation in Arch Linux with ccache"
description: "Speed up AUR package compilation in Arch Linux using ccache. Follow our guide to unlock efficient multi-threading and caching, optimizing your software installation process."
tags: ["Arch Linux"]
date: 2023-08-13T07:55:46+0800
thumbnail: https://wallpaperaccess.com/full/4537030.png
---


## Introduction

Optimizing your Arch Linux experience goes beyond mere installation – it's about maximizing efficiency during software compilation. In this guide, we'll walk you through a powerful technique to dramatically reduce compilation times for AUR (Arch User Repository) packages using a tool called `ccache`.

## Step 1: Install `ccache`

The first step towards speeding up your AUR package compilation process is installing `ccache`. This clever tool caches previously compiled object files and metadata, enabling faster subsequent compilations. To install `ccache`, use the following command:

```bash
sudo pacman -S ccache
```

## Step 2: Configure `makepkg.conf`

Next, open the `makepkg.conf` file using your preferred text editor. To quickly locate the `BUILDENV` section, press `Ctrl+W` and type `BUILDENV`. Find the line containing `BUILDENV`, and remove the `!` from in front of `ccache`, like this:

```bash
BUILDENV=(distcc color ccache check !sign)
```

## Step 3: Determine Your CPU Cores

Before optimizing `MAKEFLAGS`, let's determine the exact number of CPU cores on your system. To do this, open your terminal and enter:

```bash
lscpu
```

Alternatively, you can use the `nproc` command to quickly see the number of available CPU cores:

```bash
nproc
```

This information will help us fine-tune the compilation settings in the next step.

## Step 4: Optimize `MAKEFLAGS` for Your CPU

With the core count known, adjust the `MAKEFLAGS` variable in the `makepkg.conf` file accordingly. Locate the section for `MAKEFLAGS`, either by scrolling or by using `Ctrl+W` and typing `MAKEFLAGS`. Modify the line to allow for parallel compilation. For example, if your system has 10 CPU cores, set it as follows:

```bash
#-- Make Flags: change this for DistCC/SMP systems
MAKEFLAGS="-j10"
```

## Step 5: Add `ccache` to PATH

For seamless access to `ccache` commands, we'll add the `ccache` binary directory to your system's PATH. Open your shell's configuration file using your favorite text editor:

### For `bash` Users (Default Shell for Many Linux Distributions):

```bash
nano ~/.bashrc
```

### For `zsh` Users (Alternative Shell with Enhanced Features):

```bash
nano ~/.zshrc
```

Add the following line to the bottom of the file:

```bash
export PATH="/usr/lib/ccache/bin/:$PATH"
```

Save the changes and exit the text editor.

## Step 6: Refresh Configuration and Apply Changes

To apply the changes made to your shell's configuration file, you need to refresh the shell's configuration. This ensures that the new PATH settings for `ccache` are immediately available. Here's how you can do it:

### For `bash` Users:

```bash
source ~/.bashrc
```

The `source` command reads and executes commands from the specified file (in this case, `~/.bashrc`), making the changes take effect in the current terminal session.

### For `zsh` Users:

```bash
source ~/.zshrc
```

Similarly, `source` is used to execute the commands in `~/.zshrc`, updating the configuration in your current terminal session.

By using the `source` command, you ensure that your shell recognizes the updated PATH and other configuration changes, allowing you to use `ccache` seamlessly without needing to open a new terminal window.

Certainly, I understand your request. Here's the modified Step 7 with the addition of how to view the locations contained in the `$PATH` variable:

## Step 7: Verify PATH Configuration

To ensure that the `ccache` directory has been added to your PATH successfully, you can check the PATH variable. Open a new terminal window to apply any recent changes and then enter the following command:

```bash
echo $PATH
```

If you see `/usr/lib/ccache/bin/` included in the output, it confirms that the PATH configuration has been successfully applied.

### Bonus Tip: Exploring Paths

If you're curious about the different paths in your `$PATH`, you can use the `echo` command in combination with the `tr` command to list each path on a separate line. This can give you a clearer view of the directories included in your PATH. Run the following command:

```bash
echo $PATH | tr ':' '\n'
```

This will display a list of directories that are part of your `$PATH`. You can then scan through the list to see if the `/usr/lib/ccache/bin/` directory is indeed included.

## Conclusion

By incorporating `ccache` and optimizing your compilation settings, you've unlocked a new level of efficiency in your Arch Linux environment. The software installation process becomes remarkably faster, allowing you to focus on exploring and using the software you need without the wait.

Harness the power of `ccache` to supercharge your AUR package compilation, making your Arch Linux journey even more seamless and enjoyable.

## Reference

- https://ostechnix.com/speed-compilation-process-installing-packages-aur/