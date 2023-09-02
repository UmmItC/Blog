---
author: "Arcsly"
title: "How to Ensure Your Operating System Stays Infection-Free"
description: "Explore essential steps to safeguard your operating system from viruses, malware, and more. Learn how to detect and prevent potential threats effectively."
tags: ["Lore", "How"]
date: 2023-09-02T17:46:20+0800
thumbnail: https://media.consumeraffairs.com/files/news/Malware_computer_concept_Olemedia_Getty_Images_1.jpg
---

## Introduction

In today's digital landscape, threats like viruses, malware, and trojans are pervasive. Despite having robust antivirus and anti-malware software, malicious entities can find ways to bypass real-time protection and infiltrate your system. These threats often operate covertly within your computer's depths. In this article, we aim to guide you through comprehensive steps to check and fortify your operating system against potential infections.

### Motivation

Recently, a friend of mine voiced concerns about their computer being compromised by an unknown entity. This prompted me to write this article, which is geared not only towards computer geeks well-versed in network security but also towards individuals who may not be programming experts. It's crucial to understand that computer security and programming skills are distinct, and this article addresses the former. Let's dive into the world of protecting your computer effectively.

### Is Apple Inherently Safe?

Let's consider a hypothesis: a long-time user of Apple and a long-time user of Windows. Windows users, on occasion, may download cracked or unofficial versions of software, which can expose them to malware and infections. Seeking help online becomes a common practice when their systems are compromised.

Then, Apple users will start laughing at Windows users, what a rotten system, it is really not as good as the Apple system, I will not be poisoned if I use Apple.

#### Why?

On the other hand, Apple adopts a default whitelist system in its approach. Here, the operating system restricts users from opening or downloading files that haven't received explicit approval. While this approach is often touted as safer, it can lead to complications when users attempt to access certain files not officially sanctioned by Apple.

#### Question

This raises a fundamental question: which system can genuinely be considered safe or unsafe? The answer isn't straightforward. Windows provides users with more flexibility, allowing them to open a wide range of files and software. However, this flexibility can expose them to greater risks if they engage in unsafe practices. In contrast, Apple's restrictive approach aims to minimize risks but can limit users' access to legitimate yet unofficial content.

>Most Apple users are really a joke

It's essential to emphasize. The choice of an operating system depends on various factors, including user preferences and requirements. What's crucial is for users of all systems to recognize that no platform is entirely immune to threats. Instead, it's the user's knowledge and security practices that often determine the level of safety in today's digital world.

## Checking Your Network Connections

### Wireshark - Peering into Data Traffic

[Wireshark](https://www.wireshark.org/) is a powerful network protocol analyzer. It enables you to inspect data traffic on your network comprehensively. By examining incoming and outgoing packets, you can spot any suspicious or unauthorized network activities.

**Interpreting Wireshark Data:**

When monitoring your network traffic with Wireshark, it's crucial to interpret the data correctly. Here are some key points to keep in mind:

1. **Normal Traffic Patterns:** Under normal circumstances, when your computer is in an idle state, it should receive minimal network traffic. While some background system processes may generate occasional traffic, it should not amount to thousands of packets per second. However, during active internet usage, such as downloading files or browsing websites, an increase in the number of incoming packets is expected and considered normal.

2. **Abnormal Activity:** If you notice an unusually high volume of incoming packets when you're not actively using the internet or running bandwidth-intensive applications, it could be a sign of unauthorized network activity.

3. **Exclusionary Approach:** To determine if the increased traffic is due to an infection or legitimate downloads, consider closing all unnecessary programs and processes one by one. If the excess traffic persists even with all applications closed, it raises suspicion.

Interpreting Wireshark data requires some networking knowledge. If you’re uncertain about what you’re seeing, you can learn Wireshark from tutorials like [Wireshark Masterclass by Chris Greer](https://www.youtube.com/playlist?list=PLW8bTPfXNGdC5Co0VnBK1yVzAwSSphzpJ).

### Process Hacker - Monitoring Running Processes

[Process Hacker](https://processhacker.sourceforge.io/) is a robust task manager and system monitoring tool. It allows you to delve deep into your system's processes, helping you identify any rogue applications or processes that may be running without your consent.

When using Process Hacker, follow these steps to monitor network-related activities:

1. **Open Process Hacker:** Launch the Process Hacker application.

2. **View Network Activity:** In the Process Hacker interface, select the 'Network' tab. Here, you can observe all processes that are currently using the network, including both UDP and TCP connections, as well as any listening ports.

3. **Spotting Abnormal Activity:** Pay close attention to this list and look for any processes that appear suspicious or unfamiliar. Check if there are programs running and connecting to unknown IP addresses. If you identify any such activity, it could be a sign that your system is compromised.

By monitoring network activity in Process Hacker, you can quickly spot any unauthorized or suspicious processes running on your system. This can help you take timely action to secure your computer.

## Scanning Your Ports

Understanding Port Scanning and Its Crucial Role in Network Security

In the vast realm of network security, comprehending the concept of ports and the necessity of scanning them is fundamental. Ports serve as entry points for data to travel in and out of your computer or network. They are like doors, each designed for a specific purpose, whether it's web browsing, email communication, or online gaming.

Here, we delve into the intricacies of ports, their significance, and why scanning them is essential for safeguarding your network.

### The Role of Ports

Imagine your computer as a bustling city with numerous buildings, each serving a distinct function. In this analogy, the city's streets represent your network, and the buildings are the programs or services running on your computer. Ports, then, are the entrances to these buildings, facilitating the flow of data in and out.

Here are some common port numbers and their associated services:

- **Port 80**: This is the default port for HTTP traffic, the protocol used for web browsing. When you visit a website, your browser communicates with the webserver through this port.

- **Port 25**: Reserved for Simple Mail Transfer Protocol (SMTP), it's used for sending email messages.

- **Port 22**: Associated with Secure Shell (SSH), it allows secure remote access to your computer or server.

- **Port 443**: Used for secure HTTPS web connections, commonly seen when accessing banking websites or online shopping.

### Why Scan Your Ports?

1. **Security Assessment**: Port scanning reveals which ports are open and listening for incoming connections. An open port could be a potential vulnerability if it's not needed for your network's operation.

2. **Network Troubleshooting**: Scanning helps identify issues with network services. If a particular service is not working correctly, checking whether its associated port is open can pinpoint the problem.

3. **Intrusion Detection**: It assists in identifying unauthorized access attempts. If someone is trying to gain access to your system, port scanning can detect these intrusion attempts.

4. **Firewall Configuration**: For network administrators, scanning helps in configuring firewalls to permit or deny specific port access, thereby enhancing security.

5. **Service Discovery**: Scanning can be used to discover which services are running on a network. This is especially useful in larger networks with many interconnected devices.

In summary, scanning your ports is a proactive measure to maintain a secure network. By regularly checking which doors are open and ensuring they should be, you can bolster your network's defenses against potential threats.

In the subsequent sections, we'll explore the tools and techniques for conducting port scans and interpreting the results.

### nmap - Network Mapper

[nmap](https://nmap.org/) is a versatile open-source tool for network discovery and security auditing. You can employ it to scan your system's ports, providing insights into open and potentially vulnerable ports. This step helps ensure that unauthorized access points are not open for exploitation.

To get started with nmap, follow these steps:

1. **Check Your Current IP Address:** Before using nmap, determine your system's current IP address. You can do this by opening a command prompt or terminal and running the `ipconfig` command on Windows or `ifconfig` on Linux. Note down your IP address as you will need it for the next step.

   Example (Windows):
   ```shell
   ipconfig
   ```

   Example (Linux):
   ```shell
   ifconfig
   ```

2. **Use nmap to Scan Your System:** With your IP address in hand, you can now use nmap to scan your system for open ports. Here's an example command to scan common ports on your local machine:

   ```shell
   nmap -p 1-65535 -T4 -A -v 127.0.0.1
   ```

   In this command:
   - `-p 1-65535` scans all possible ports.
   - `-T4` sets the scan speed to "Aggressive."
   - `-A` enables OS detection, version detection, script scanning, and traceroute.
   - `-v` enables verbose output.
   - `127.0.0.1` is the IP address to scan. Replace it with your system's IP address.

3. **Review nmap Results:** After running the nmap scan, carefully review the results. Look for any open ports that you didn't expect or are not related to services you use. If you find any unusual open ports, investigate further to determine if they pose a security risk.

4. **Learn More About nmap:** If you're new to nmap and want to learn more about how to use it effectively, consider checking out the ["Nmap - HackerSploit"](https://www.youtube.com/playlist?list=PLBf0hzazHTGM8V_3OEKhvCM9Xah3qDdIx) course on YouTube by HackerSploit. This course provides in-depth tutorials on using nmap for network scanning and security assessment.

By using nmap to scan your system and learning how to interpret its results, you can enhance your system's network security. Regularly performing these scans can help you identify and mitigate potential security risks.

# Analyzing URLs and Verifying Network Security

In the realm of cybersecurity, understanding the safety of URLs and ensuring network security are paramount. Here, we delve into valuable tools and procedures to assess the security of your digital connections.

## is MITM Attack?

Your Internet access may be slower than it otherwise would be. In the hacker world. It can achieve something called MITM attack. When we access the Internet, we first go through your router, then connect to the ISP, then connect to your DNS, and then connect to the server you want to access, right? In this power hit. Your content may be modified, or you may not change anything in comparison hidden. The purpose of this method of not modifying is to obtain your personal information. Credit cards, ID cards, etc., due to this attack, the hacker can send all the information you enter in the browser directly to his server. To successfully obtain all your information. This is the MITM attack.

- Internet speed may be slow
- I became abnormal when surfing the Internet and went to other websites.
- Wangwang url has more different domains such as www2, www1 and so on.
- Unknown web content

### Detecting Hijacked Web Content

Another sign of a potential security issue is the presence of hijacked web content. When your web elements, such as JavaScript files, images, or videos, get compromised or tampered with, it's a clear indicator that something might be wrong. 

For instance, if you notice that your website's JavaScript code has been altered without your consent, it's a cause for concern. Similarly, if images or videos on your site appear distorted or different from their original state, it's a sign that unauthorized changes have occurred.

Keeping a vigilant eye on the integrity of your web assets is crucial to maintaining a secure online presence. If you suspect any unauthorized modifications to your web content, it's essential to investigate and take appropriate security measures promptly.

## tracert: Uncovering the Network Path

[Tracert](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/tracert) is a command-line utility for Windows that enables you to trace the path taken by data packets from your system to a target server. By scrutinizing this path, you can uncover any unexpected hops or suspicious domains, providing insights into the security of your network communications.

```shell
tracert 1.1.1.1
```

After running this command, review the results to ensure that there are no unknown or unauthorized DNS servers in the path. Any irregularities could indicate potential security concerns. Stay vigilant and keep your network secure.

## Mitmproxy: Check your Traffic

**Mitmproxy** is a versatile, free, and open-source interactive HTTPS proxy that can significantly enhance your network security. It acts as a man-in-the-middle (MITM) tool, allowing you to intercept, inspect, modify, and even replay traffic between your device and a target server. Whether you're a security professional, developer, or simply a curious user, Mitmproxy can be a valuable addition to your toolkit.

![Mitmproxy](https://mitmproxy.org/screenshot.png)

### Key Features and Capabilities

Mitmproxy offers a range of powerful features and capabilities:

1. **HTTPS Inspection**: Mitmproxy excels in decrypting and inspecting HTTPS traffic, making it an invaluable tool for analyzing secure web communications.

2. **Traffic Recording**: You can capture and save network traffic for later analysis, which is useful for troubleshooting or auditing purposes.

3. **Request/Response Modification**: Mitmproxy enables you to modify both incoming and outgoing traffic in real-time. This is particularly helpful for testing web applications, APIs, or debugging network issues.

4. **Scripting and Automation**: It supports scripting using Python, allowing you to automate various tasks and customize your proxy's behavior.

5. **Interactive Web Interface**: Mitmproxy offers a user-friendly web interface that simplifies the inspection and manipulation of network traffic.

# Conclusion

In today's digitally connected world, ensuring the security of your operating system and network is of paramount importance. We've explored various aspects of safeguarding your system and enhancing your network security through this comprehensive guide.

Here are the key takeaways:

1. **Operating System Security:** Your choice of operating system, be it Windows or Apple's macOS, has implications for your system's security. However, it's crucial to recognize that no operating system is entirely immune to threats. Instead, it's your knowledge and security practices that play a pivotal role in safeguarding your system.

2. **Monitoring Network Connections:** We've discussed how tools like Wireshark and Process Hacker can help you monitor and analyze network activity. Being vigilant about unexpected spikes in network traffic or suspicious processes can help you identify potential threats early.

3. **Scanning Your Ports:** Understanding the role of ports in network communication is vital. Regularly scanning your ports with tools like nmap allows you to assess your network's security, troubleshoot issues, and detect unauthorized access attempts.

4. **Mitmproxy for Enhanced Security:** Mitmproxy, a versatile MITM HTTPS proxy, empowers you to intercept, inspect, and modify network traffic. It's a valuable tool for security professionals, developers, and anyone interested in enhancing their network security.

5. **Analyzing URLs and Network Security:** We've explored the signs of a Man-in-the-Middle (MITM) attack, which can lead to unauthorized modifications of your network traffic. Additionally, we've highlighted the importance of checking for hijacked web content and using tools like tracert to uncover unexpected network paths.

By following these best practices and leveraging the tools and techniques discussed in this guide, you can significantly strengthen your operating system's security and protect your network from evolving digital threats.