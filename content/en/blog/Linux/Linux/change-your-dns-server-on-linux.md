---
author: "Arcsly"
title: "Optimizing Network Performance: Changing DNS Servers on Linux"
description: "Learn how to improve your network performance by changing DNS servers on Linux. Configure popular DNS servers like Cloudflare DNS and Google DNS to enhance your browsing experience."
tags: ["Linux", "Nameserver", "DNS"]
date: 2023-08-19T15:22:25+0800
thumbnail: https://3.bp.blogspot.com/-pliAvOUHP7M/XBvKGNPJF1I/AAAAAAAADRc/12h765aA9_MkB2hxKwjDg_-Lk9kxbTQfQCLcBGAs/s1600/What%2BIs%2BDNS%2BTypes%2BOf%2BDNS%2BServer.jpg
---

## Introduction

Efficient network connectivity is vital for a seamless online experience. One way to enhance your network performance is by utilizing faster and more reliable DNS (Domain Name System) servers. In this guide, we'll show you how to change DNS servers on a Linux system by modifying the `/etc/resolv.conf` file. We'll focus on configuring two popular DNS servers: Cloudflare DNS and Google DNS. By the end of this tutorial, you'll have the tools to optimize your network's performance and responsiveness.

## Understanding DNS Servers

DNS servers are crucial in translating human-readable domain names (e.g., www.example.com) into IP addresses that computers understand. Using faster and more reliable DNS servers can significantly reduce the time it takes to resolve domain names, resulting in quicker website loading times.

## Configuring DNS Servers

Configuring DNS servers on your Linux system involves editing a specific configuration file. Below, we'll guide you through the process of configuring popular DNS servers such as Cloudflare DNS and Google DNS.

### Using Cloudflare DNS (1.1.1.1 and 1.0.0.1)

Cloudflare DNS is renowned for its impressive speed, often outperforming other DNS servers. To set up your Linux system to utilize Cloudflare DNS, follow these steps:

1. Open a terminal window.

2. Edit the `/etc/resolv.conf` file using a text editor such as `nano` or `vim`:

   ```shell
   sudo nano /etc/resolv.conf
   ```

3. Add the following lines at the top of the file:

   ```shell
   nameserver 1.1.1.1
   nameserver 1.0.0.1
   ```

These lines specify the Cloudflare DNS servers for domain name resolution.

### Using Google DNS (8.8.8.8 and 8.8.4.4)

Google DNS is another popular choice, valued for its reliability and performance. To configure your system to use Google DNS, follow these steps:

1. Open a terminal window.

2. Edit the `/etc/resolv.conf` file:

   ```shell
   sudo nano /etc/resolv.conf
   ```

3. Add the following lines:

   ```shell
   nameserver 8.8.8.8
   nameserver 8.8.4.4
   ```

These lines indicate the Google DNS servers for your domain resolution needs.

With these configurations in place, your Linux system will utilize either Cloudflare DNS or Google DNS for translating domain names to IP addresses. This can result in improved speed and responsiveness, ultimately enhancing your online experience.

## Installation on Arch-Based Linux

If you're using an Arch-Based Linux distribution, such as Arch Linux or Manjaro, you can easily install the necessary tools for working with DNS settings. The `dnsutils` package provides essential utilities like `nslookup` and `dig`. To install this package, follow these steps:

1. Open a terminal window.

2. Run the following command to install the `dnsutils` package:

   ```shell
   sudo pacman -S dnsutils
   ```

This will install the required tools for DNS-related tasks on your Arch-Based system.

### Verifying Your Configured DNS Server

After configuring your DNS server, it's important to verify that your Linux system is indeed using the desired DNS server. You can achieve this by using the `dig` command in combination with `grep` to extract relevant information. Follow these steps:

1. Open a terminal window.

2. Enter the following command:

   ```shell
   dig | grep "SERVER"
   ```

This command will display the DNS server information currently in use by your system. By performing this check, you can ensure that your chosen DNS server has been successfully configured and is actively being utilized for domain name resolution.

## Conclusion

Changing DNS servers on your Linux system is a straightforward way to enhance network performance and reduce latency. By configuring popular DNS servers like Cloudflare DNS (1.1.1.1 and 1.0.0.1) or Google DNS (8.8.8.8 and 8.8.4.4), you can experience faster and more reliable domain name resolution. Whether you're looking to streamline your browsing experience or optimize online activities, adjusting your DNS settings can make a significant impact on your network's responsiveness.