---
author: "Arcsly"
title: "7 Tips to Secure your linux VPS server"
description: "Secure your linux vps server is simple. only 7 points."
tags: ["VPS", "SSH", "Linux"]
date: 2023-06-29T01:23:00+08:00
thumbnail: https://www.atulhost.com/wp-content/uploads/2020/04/ssh.png
---
## How to secure?

while using VPS hosting your server, that hava a few things you need to do before you public your server.

## File Locations

In this blog, you will find the following files located at:

- **1. SSH Configuration File:**

```shell
/etc/ssh/sshd_config
```

- **2. UFW Before Rules File** (for Restricting Ping Responses):

```shell
sudo nano /etc/ufw/before.rules
```

## **Securing Your VPS Hosting Server**

When using VPS hosting for your server, there are several important steps you should take to enhance security before making your server publicly accessible.

### **1. Add a New User with Sudo Privileges**

Strengthen security by creating a new user and granting them sudo privileges:

1. **Create a New User:**
   Add a new user to your system. Replace `newusername` with your desired username.
   ```shell
   sudo adduser newusername
   ```

2. **Grant Sudo Privileges:**
   Assign administrative privileges to the new user, enabling them to use the `sudo` command.
   ```shell
   sudo usermod -aG sudo newusername
   ```

3. **Test Sudo Access:**
   Verify that the new user can use `sudo` by switching to their account and running a test command.
   ```shell
   su - newusername
   sudo ls -la /root
   ```

4. **Exit User Account:**
   Exit the new user's account when testing is complete.
   ```shell
   exit
   ```

By creating a new user and granting them sudo privileges, you enhance security by reducing the need for constant root access. This minimizes potential risks and contributes to a more secure server environment.

5. **Access sudoers File:**
   If you are currently signed in as root, run:
   ```shell
   visudo
   ```
   If you are signed in as a non-root user with sudo privileges, use:
   ```shell
   sudo visudo
   ```

6. **Edit with Ease:**
   By default, visudo uses the nano text editor, making it more user-friendly. You can use arrow keys to move and navigate. Look for the line similar to:
   ```shell
   root    ALL=(ALL:ALL) ALL
   ```

7. **Add User to sudoers:**
   Below the above line, add the following highlighted line (replace `newuser` with the actual username):
   ```shell
   root    ALL=(ALL:ALL) ALL
   newusername ALL=(ALL:ALL) ALL
   ```

8. **Save and Exit:**
   Save your changes and exit the editor.

By completing these steps, you grant the specified user sudo privileges, enabling them to use administrative commands while maintaining a secure environment.

---

### 2. **Avoid Password Login**
   Disable password-based logins and exclusively use SSH key authentication.
   ```shell
   PasswordAuthentication no
   ```

---

### 3. **Use SSH Key Authentication**
   Utilize SSH key pairs for authentication. Generate a key pair on your local machine and add the public key to the server's `~/.ssh/authorized_keys` file.
   ```shell
   ssh-keygen -t rsa
   ssh-copy-id newusername@your_server_ip
   ```

Certainly, here's the revised section with the combined steps:

---

### 4. Install a Firewall & Change SSH Port Number

Enhance your server's security by configuring a firewall and changing the SSH port number:

1. **Install UFW (Uncomplicated Firewall):**
   Start by installing the Uncomplicated Firewall, which simplifies the process of managing your firewall rules.
   ```shell
   sudo apt-get install ufw
   ```

2. **Enable UFW:**
   Activate UFW and ensure it starts automatically at boot.
   ```shell
   sudo ufw enable
   ```

3. **Allow SSH Traffic on Custom Port:**
   Allow SSH traffic through the newly chosen custom port (replace `your_custom_port_number` with your desired port).
   ```shell
   sudo ufw allow your_custom_port_number/tcp
   ```

4. **Change SSH Port Number:**
   Modify the default SSH port (22) to the chosen custom port. This step adds an extra layer of security by moving SSH away from the default port.
   ```shell
   sudo nano /etc/ssh/sshd_config
   # Change 'Port 22' to 'Port your_custom_port_number'
   # Save the file and exit the text editor
   sudo service sshd restart
   ```

By performing these steps, you establish a firewall to manage incoming and outgoing traffic and also change the SSH port to enhance security. These measures collectively help safeguard your server from potential threats.

---

### 5. **Restrict User Logins**
   Allow only specific users to log in using SSH. Edit the SSH configuration file (`sshd_config`).
   ```shell
   AllowUsers newusername
   ```

---

### 6. **Disable Root Login**
   Disable direct root login via SSH. Edit the SSH configuration file.
   ```shell
   PermitRootLogin no
   ```

---

### 7. **Regularly Update Your System**
   Keep your Linux system up to date by regularly applying security updates.
   ```shell
   sudo apt-get update -y
   sudo apt-get upgrade -y
   ```

Certainly, here's the revised section with improved readability:

---

### **8. Restrict Ping Responses**

Disabling ICMP ping responses helps prevent potential reconnaissance attacks. Follow these steps to achieve this:

1. Open the UFW (Uncomplicated Firewall) configuration file:
   ```shell
   sudo nano /etc/ufw/before.rules
   ```

2. Add the following line at the end of the file to block ICMP echo request (ping) packets:
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

By completing these steps, you effectively prevent your server from responding to ICMP ping requests, enhancing its security by reducing its exposure to potential reconnaissance attempts.

## That's all!

Remember, security is an ongoing process. Regularly review and update your security measures to adapt to emerging threats. By following these steps and utilizing the provided command lines, you significantly enhance the security posture of your VPS hosting server, ensuring a safer environment for your applications and data.

## Reference

- https://www.youtube.com/watch?v=ZhMw53Ud2tY&t=