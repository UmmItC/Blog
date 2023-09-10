---
author: "Arcsly"
title: "Setting Up NGINX on Linux VPS: Host a Website and Configure SSL with Self-Signed TLS (Cloudflare)"
description: "Learn how to set up NGINX on a Linux VPS, host a website, and secure it with SSL using a self-signed TLS certificate through Cloudflare. Follow our step-by-step guide to ensure your website is up and running securely."
tags: ["NGINX", "Web"]
date: 2023-09-11T04:00:50+0800
thumbnail: https://c93fea60bb98e121740fc38ff31162a8.s3.amazonaws.com/wp-content/uploads/2016/04/nginx.png
---

## Introduction

In the world of web servers, NGINX stands out as a powerful and efficient choice for hosting websites and web applications. Whether you're running a personal blog, a small business website, or a complex web application, NGINX is a versatile tool that can handle the job with ease. In this blog post, we'll walk you through the process of setting up NGINX on a Linux VPS, hosting a website, and securing it with SSL using a self-signed TLS certificate through Cloudflare.

## Step 1: Provision a Linux VPS

Before you can set up NGINX, you'll need a virtual private server (VPS) running a Linux distribution of your choice. Popular options include Ubuntu, CentOS, and Debian. You can choose a VPS provider like DigitalOcean, Linode, or AWS to provision your server.

## Step 2: Connect to Your VPS

Once your VPS is up and running, you'll need to connect to it using SSH. Open your terminal and use the following command to connect to your VPS:

```bash
ssh username@your_server_ip
```

Replace `username` with your server's username and `your_server_ip` with the actual IP address of your VPS.

## Step 3: Update Your System

It's essential to keep your server's software up to date for security and stability. Run the following commands to update your server:

```bash
sudo apt update
sudo apt upgrade
```

Replace `apt` with `yum` if you're using CentOS.

## Step 4: Install NGINX

Installing NGINX on Linux is straightforward. Use the package manager for your distribution to install NGINX. For Ubuntu, you can run:

```bash
sudo apt install nginx
```

For CentOS:

```bash
sudo yum install nginx
```

## Step 5: Start NGINX and Enable Auto-Start on Boot

After installation, start NGINX and enable it to start automatically on boot:

```bash
sudo systemctl start nginx
sudo systemctl enable nginx
```

## Nginx configuration

```shell
sudo vim /etc/nginx/conf.d/yoursite_me.conf
```

...