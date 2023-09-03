---
author: "Arcsly"
title: "Checking Home and Server vulnerability with Nmap: A Comprehensive Guide"
description: "Explore the world of cybersecurity and learn how to checking your home network and server using Nmap. Dive into the network scanning and vulnerability detection in this comprehensive guide."
tags: ["nmap", "Security"]
date: 2021-12-14T17:07:28+0800
thumbnail: https://www.kali.org/tools/nmap/images/nmap-logo.svg
lastmod: 2023-09-03T20:32:10+0800
---

## Introduction

In an increasingly interconnected world, ensuring the security of your home network and server is paramount. Cyber threats are continually evolving, making it crucial to stay one step ahead. This is where Nmap, or Network Mapper, comes into play. Nmap is a versatile and powerful open-source tool that empowers you to take control of your digital defenses. In this comprehensive guide, we will explore how to harness the capabilities of Nmap to check your home network.

## How to Install Nmap

Before we dive into the intricacies of using Nmap, let's start with the basics: installation. Nmap is available for various operating systems, including Windows, Linux, and macOS. Here's how to get it up and running on your system:

- **Windows**:

  - Visit the official Nmap download page at [https://nmap.org/download.html](https://nmap.org/download.html).
  - Choose the installer that matches your system architecture (32-bit or 64-bit).
  - Run the installer and follow the on-screen instructions.

- **Linux** (Debian/Ubuntu):

  - Open your terminal.
  - Run the following command to install Nmap:

    ```shell
    sudo apt-get install nmap
    ```

  - Provide your sudo password when prompted.

- **Linux** (Red Hat/Fedora):

  - Open your terminal.
  - Run the following command to install Nmap:

    ```shell
    sudo dnf install nmap
    ```

  - Provide your sudo password when prompted.

- **macOS**:

  - You can use Homebrew to install Nmap on macOS. If you don't have Homebrew installed, you can get it from [https://brew.sh/](https://brew.sh/).
  - Once you have Homebrew, open your terminal and run:

    ```shell
    brew install nmap
    ```

With Nmap successfully installed, let's move on how to use it effectively to bolster your security.

## How to Use Nmap for Home Security

Nmap is renowned for its ability to map out networks, discover devices, and identify open ports and services. Here's a simplified guide on how to use Nmap to enhance your security:

### Basic Network Scan

1. **Run a Basic Network Scan**:
   - Open your terminal or command prompt.
   - Use this command to run a basic network scan:

     ```shell
     nmap <target>
     ```

     Replace `<target>` with the IP address or domain you want to scan. For example:

     ```shell
     nmap 192.168.1.1
     ```

   - Nmap will provide you with a list of open ports and services on the target system.

### Service Version Detection

2. **Service Version Detection**:
   - To obtain detailed information about detected services, use the `-sV` flag:

     ```shell
     nmap -sV <target>
     ```

   - This command will not only identify open ports but also attempt to determine the service and its version.

### Scanning Multiple IP Addresses

3. **Scan a Range of IP Addresses**:
   - You can scan multiple IP addresses in a range by specifying the range, for example:

     ```shell
     nmap 192.168.1.1-20
     ```

### Scan a Larger Network (/24 /16 /2 /1):

You can also expand your scanning scope to a larger network using CIDR notation like `/24`. In this case, `/24` indicates that you're scanning all IP addresses in the third and fourth octets. For example:

```shell
nmap 192.168.0.0/24
```

This command scans a massive range of IP addresses from 192.168.0.1 to 192.168.255.254. Be cautious when scanning such large networks, as it can take a considerable amount of time and resources.

When using IP address ranges, CIDR notation (/24, /16, etc.) simplifies specifying large address ranges concisely. It's a handy technique for efficiently scanning multiple hosts within a network.

#### CIDR Notation and Corresponding IP Address Ranges

This table shows the CIDR notation and the corresponding range of IP addresses represented by that notation.

| **CIDR Notation** | **Equivalent Range**                |
|-------------------|------------------------------------|
| **/24**           | **0.0.0.0 - 0.0.0.255**             |
| **/16**           | **0.0.0.0 - 0.0.255.255**           |
| **/8**            | **0.0.0.0 - 0.255.255.255**             |
| **/0**            | **0.0.0.0 - 255.255.255.255**           |

#### CIDR Notation: Dividing the IPv4 Address Space

Let's clarify the meaning of the `/8` and `/0` CIDR notations:

- **/24**: This notation represents a subnet where the first 24 bits of the IP address are fixed, while the remaining 8 bits can vary. In practical terms, it covers IP addresses from `0.0.0.0` to `0.0.0.255`. 

- **/16**: In this case, the first 16 bits of the IP address are fixed, while the remaining 16 bits can vary. The IP address range extends from `0.0.0.0` to `0.0.255.255`.

- **/8**: The `/8` notation fixes the first 8 bits of the IP address, allowing for IP addresses from `0.0.0.0` to `0.255.255.255`. This notation effectively creates 256 subnets.

- **/0**: The `/0` notation represents the entire IPv4 address space, where no bits are fixed, allowing all 32 bits to vary. Consequently, it covers the full range from `0.0.0.0` to `255.255.255.255`. This notation encompasses all possible IP addresses without creating subnets.

These CIDR notations are essential for subnetting and network addressing, enabling the organization of IP addresses into smaller, more manageable groups while maintaining a structured and efficient allocation of addresses within the vast IPv4 address space.


### Advanced Scanning Options

Here are some advanced scanning options to enhance your security testing:

5. **Basic Network Scan with Service Version Detection** (-Pn -sV):
   - Run a basic network scan with service version detection using the `-Pn -sV` flags:

     ```shell
     nmap -Pn -sV <target>
     ```

   - This command will provide you with a list of open ports and services on the target system, along with their versions.

6. **Basic Network Scan without Ping** (-Pn):
   - In cases where you want to skip the host discovery (ping) phase, use the `-Pn` flag alone:

     ```shell
     nmap -Pn <target>
     ```

     This command directly scans the target without checking if it's online.

7. **Ping Scan** (-sP):
   - If you only want to check which hosts are online in a network, use the `-sP` flag:

     ```shell
     nmap -sP <target>
     ```

   - Nmap will provide a list of hosts that responded to the ping scan.

8. **List Scan** (-sL):
   - The `-sL` flag allows you to list all targets without actually scanning them. This can be useful for generating a list of hosts for further scans:

     ```shell
     nmap -sL <target>
     ```

### Vulnerability Scanning - NSE Script

While Nmap isn't primarily a vulnerability scanner, you can integrate scripts like `nmap-vulners` to check for known vulnerabilities.

Using `nmap-vulners` is relatively straightforward, and it can enhance your Nmap scans by checking for known vulnerabilities associated with the services and software versions it detects. Here's how to use `nmap-vulners`:

>**Prerequisites:**
Before you begin, ensure you have Nmap and `nmap-vulners` installed on your system. You can usually install `nmap-vulners` as a Nmap script, which makes it compatible with your Nmap installation. By default, `nmap-vulners` is included in the Nmap package.

#### Ensure `nmap-vulners` is Installed

To ensure that you have `nmap-vulners` installed along with Nmap, you can check the list of installed Nmap scripts. Here's how you can do it:

1. Open your terminal.

2. Run the following command to list the installed Nmap scripts:

   ```shell
   ls /usr/share/nmap/scripts | grep vulners
   ```

   This command checks for scripts related to `vulners` in the Nmap scripts directory.

If you see a result like `vulners.nse`, it means that the `nmap-vulners` script is installed and available for use with your Nmap installation. If you don't see any results, it's likely that the script isn't installed.

#### Install `nmap-vulners`

1. Download the `vulners.nse` script from the official repository [@vulnersCom/nmap-vulners](https://github.com/vulnersCom/nmap-vulners).

2. Place the downloaded `vulners.nse` script in the Nmap scripts directory. On many systems, this directory is `/usr/share/nmap/scripts/`.

3. Once the script is in place, you should be able to use it with Nmap as shown in the previous response.

#### Scanning with `nmap-vulners`

1. **Integrate `nmap-vulners` as a Script**:
   - You need to use the `--script` option to integrate `nmap-vulners` into your Nmap scan. Use the following command:

     ```shell
     nmap --script vulners <target>
     ```

   - This command will run Nmap and apply the `nmap-vulners` script to your scan.

2. **View Vulnerability Information**:
   - After the scan is complete, Nmap will display information about detected vulnerabilities associated with the services and software versions found on the target.

#### Vulners Script Usage example

Here's a complete example of scanning a target and using `nmap-vulners`:

```shell
nmap --script vulners 192.168.1.1
```

This command scans the target IP address 192.168.1.1 and uses the `nmap-vulners` script to check for known vulnerabilities.

- `nmap-vulners` relies on the Nmap Scripting Engine (NSE). Therefore, you need Nmap installed to use this script.
- Keep your Nmap and `nmap-vulners` versions up to date to ensure accurate results.
- Vulnerability detection depends on the accuracy and completeness of the nmap-vulners database. Regular updates of the script and the vulnerability database are recommended.

### Running Nmap with Root Privileges

When using Nmap for more advanced features like operating system detection (using the -O flag), you may encounter situations where the tool requires elevated privileges. Operating system detection typically involves sending low-level network packets and certain ICMP requests, which can only be done with root or administrator permissions.

To run Nmap with root privileges, you can use the sudo command on Unix-like systems (such as Linux and macOS). Here's an example: 

**TCP SYN Scan with OS Fingerprinting** (-sS -O):

   - To perform a TCP SYN scan (stealth scan) and attempt to guess the target's operating system, use the `-sS -O` flags:

      - This combination of flags conducts a stealthy scan while also trying to identify the OS.

```shell
sudo nmap -sS -O <target>
```

## Conclusion

In today's digital landscape, safeguarding your home network and server is paramount. Nmap is a valuable tool in your cybersecurity arsenal, allowing you to understand your digital territory better. Whether you're protecting your home network from intruders or scanning your server for vulnerabilities.