---
author: "Arcsly"
title: "ALL Tips to Secure your linux VPS server"
description: "Learn how to effortlessly secure your VPS server with just a few essential steps. This blog will guide you through the process."
tags: ["VPS", "SSH", "Linux"]
date: 2023-06-29T01:23:00+08:00
thumbnail: https://www.atulhost.com/wp-content/uploads/2020/04/ssh.png
lastmod: 2023-09-09T10:42:20+0800
---

## Introduction

Securing your VPS hosting server is paramount before exposing it to the public. Here's how you can bolster your server's defenses.

### 1. Regularly Update Your System

Keeping your Linux system up to date is vital for security. Regularly apply security updates using the following commands:

```shell
sudo apt-get update -y
sudo apt-get upgrade -y
```

### 2. Add a New User with Sudo Privileges

Improving security involves creating a new user with administrative capabilities:

1. Create a New User:
   Add a new user to your system, replacing `newusername` with your preferred username.

   ```shell
   sudo adduser newusername
   ```

2. Grant Sudo Privileges:
   Enable the new user to use the `sudo` command by adding them to the sudo group.

   ```shell
   sudo usermod -aG sudo newusername
   ```

3. Test Sudo Access:
   Verify that the new user can use `sudo` by switching to their account and running a test command.

   ```shell
   su - newusername
   sudo ls -la /root
   ```

4. Exit User Account:
   Once the test is complete, exit the new user's account.

   ```shell
   exit
   ```

5. Access sudoers File:
   To edit the sudoers file, use:

   - If you're currently logged in as root:

   ```shell
   visudo
   ```

   - If you're logged in as a non-root user with sudo privileges:

   ```shell
   sudo visudo
   ```

6. Edit with Ease:
   The visudo command typically uses the nano text editor, making it user-friendly. Navigate with arrow keys and locate the line resembling:

   ```shell
   root    ALL=(ALL:ALL) ALL
   ```

7. Add User to sudoers:
   Below the mentioned line, add the highlighted line (replace `newuser` with the actual username):

   ```shell
   root    ALL=(ALL:ALL) ALL
   newusername ALL=(ALL:ALL) ALL
   ```

8. Save and Exit:
   Save your changes and exit the editor.

These steps grant specific users sudo privileges, allowing them to execute administrative commands while maintaining a secure server environment.

### 3. Avoid Password Login

Enhance security by disabling password-based logins and exclusively utilizing SSH key authentication.

```shell
PasswordAuthentication no
```

### 4. Use SSH Key Authentication

For authentication, use SSH key pairs. Generate a key pair on your local machine and add the public key to the server's `~/.ssh/authorized_keys` file.

```shell
ssh-keygen -t rsa
ssh-copy-id newusername@your_server_ip
```

### 5. Install a Firewall & Change SSH Port Number

Fortify your server's security by configuring a firewall and modifying the SSH port number:

1. Install UFW (Uncomplicated Firewall):
   Begin by installing the Uncomplicated Firewall, which simplifies managing firewall rules.

   ```shell
   sudo apt-get install ufw
   ```

2. Enable UFW:
   Activate UFW and ensure it starts automatically at boot.

   ```shell
   sudo ufw enable
   ```

3. Allow SSH Traffic on Custom Port:
   Permit SSH traffic on the custom port you've chosen (replace `your_custom_port_number` with your desired port).

   ```shell
   sudo ufw allow your_custom_port_number/tcp
   ```

4. Change SSH Port Number:
   Modify the default SSH port (22) to your chosen custom port. This adds an extra layer of security by moving SSH away from the default port.

   ```shell
   sudo nano /etc/ssh/sshd_config
   # Change 'Port 22' to 'Port your_custom_port_number'
   # Save the file and exit the text editor
   sudo service sshd restart
   ```

By completing these steps, you establish a firewall, modify the SSH port, and enhance your server's security, reducing potential threats.

### 6. Restrict User Logins

Allow only specific users to log in via SSH. Edit the SSH configuration file (`/etc/ssh/sshd_config`).

```shell
AllowUsers newusername
```

### 7. Disable Root Login

Prevent direct root login via SSH. Edit the SSH configuration file.

```shell
PermitRootLogin no
```

### 8. Restrict Ping Responses

Disable ICMP ping responses to thwart potential reconnaissance attacks:

1. Open the UFW (Uncomplicated Firewall) configuration file:

   ```shell
   sudo nano /etc/ufw/before.rules
   ```

2. Add this line at the file's end to block ICMP echo request (ping) packets:

   ```shell
   -A ufw-before-input -p icmp --icmp-type echo-request -j DROP
   ```

3. Save the file and exit the text editor.

4. Reload the UFW rules to apply the changes:

   ```shell
   sudo ufw reload
   ```

5. Reboot your server to ensure the changes take effect:

   ```shell
   sudo reboot
   ```

By implementing these measures, you effectively prevent your server from responding to ICMP ping requests, reducing its exposure to potential reconnaissance attempts.

## Conclusion

Security is an ongoing process. Regularly review and update your security measures to adapt to emerging threats. By following these steps and using the provided command lines, you significantly enhance your VPS hosting server's security, ensuring a safer environment for your applications and data.