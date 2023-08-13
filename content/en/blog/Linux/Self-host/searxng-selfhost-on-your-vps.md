---
author: "Arcsly"
title: "Set Up SearXNG on Your SSH VPS Server with Docker: A Quick and Private Metasearch"
description: "Set up your private SearXNG metasearch engine on an SSH VPS server using Docker. Follow this concise guide to quickly install, customize, and maintain SearXNG."
tags: ["Arch Linux"]
date: 2023-08-13T07:55:46+0800
thumbnail: https://www.maketecheasier.com/assets/uploads/2022/06/searxng-install-00-featured-image.jpg
---

## Introduction

SearXNG is a powerful metasearch engine that respects your privacy by aggregating results from various search engines while not tracking your searches. In this guide, we'll show you how to quickly set up a SearXNG instance on your SSH VPS server using Docker.

## What's Included?

The SearXNG Docker setup includes the following components:

| Name      | Description                                     | Docker image                        | Dockerfile                                |
| --------- | ----------------------------------------------- | ----------------------------------- | ----------------------------------------- |
| Caddy     | Reverse proxy with automatic LetsEncrypt certs | [caddy/caddy:2-alpine](https://hub.docker.com/_/caddy) | [Dockerfile](https://github.com/caddyserver/caddy-docker) |
| SearXNG   | SearXNG search engine                          | [searxng/searxng:latest](https://hub.docker.com/r/searxng/searxng) | [Dockerfile](https://github.com/searxng/searxng/blob/master/Dockerfile) |
| Redis     | In-memory database                             | [redis:alpine](https://hub.docker.com/_/redis) | [Dockerfile-alpine.template](https://github.com/docker-library/redis/blob/master/Dockerfile-alpine.template) |

## Buying a Domain and VPS Server

Before diving into the installation process, you need both a domain name and a VPS server. You can purchase a domain from platforms like Cloudflare, Namecheap, and others. Likewise, you can choose reputable VPS providers such as Linode, DigitalOcean, or AWS Lightsail to host your SearXNG instance.

1. **Acquire a Domain:**
   Purchase a domain name from a domain registrar like Cloudflare or Namecheap. This will be the web address through which you access your SearXNG instance.

2. **Choose a VPS Provider:**
   Select a reliable VPS provider such as Linode, DigitalOcean, or AWS Lightsail. Ensure that the chosen provider meets your requirements in terms of server resources and location.

### Step 1: Configure DNS Settings

For your domain to point to your VPS server, you'll need to configure DNS settings:

1. **Obtain Server IP Address:**
   After setting up your VPS server, copy the real IP address of your server. You'll need this IP address to configure DNS settings.

2. **Configure DNS Records:**
   Access the DNS management interface of your domain registrar. Add an A record that points to your VPS server's IP address. This step ensures that your domain directs visitors to your SearXNG instance.

## Step 2: Prepare Your System and Install Docker

Before setting up SearXNG with Docker, make sure your system is up to date and has the necessary tools installed. Follow these steps:

1. **Update and Upgrade:**
   Open a terminal and update your package repositories and upgrade installed packages:

   ```shell
   sudo apt update -y
   sudo apt upgrade -y
   ```

2. **Install Docker and Docker Compose:**
   Install Docker and Docker Compose using the following commands:

   ```shell
   sudo apt install docker.io docker-compose -y
   ```

## Step 3: Clone the SearXNG Docker Repository

Continue with the installation process by cloning the SearXNG Docker repository:

```shell
cd /usr/local/
git clone https://github.com/searxng/searxng-docker.git
cd searxng-docker
```

## Step 4: Set Up Environment and Generate Secret Key

Customize your SearXNG environment by editing the `.env` file in the `searxng-docker` directory. Follow these steps:

1. Open the `.env` file using your preferred text editor:

   ```shell
   nano /usr/local/searxng-docker/.env
   ```

2. Replace `<host>` with your desired SearXNG hostname and `<email>` with your email address to set up a Let's Encrypt certificate.

   Example:

   ```shell
   SEARXNG_HOSTNAME=mysearxng.example.com
   LETSENCRYPT_EMAIL=you@example.com
   ```

   Save the changes and exit the text editor.

3. Generate a secret key for SearXNG by executing the following command:

   ```shell
   sed -i "s|ultrasecretkey|$(openssl rand -hex 32)|g" /usr/local/searxng-docker/searxng/settings.yml
   ```

   This ensures a secure configuration for your SearXNG instance.

### Example of **.env**

Here's an example of how your `.env` file might look:

```shell
# By default listen on https://localhost
# To change this:
# * uncomment SEARXNG_HOSTNAME, and replace <host> by the SearXNG hostname
# * uncomment LETSENCRYPT_EMAIL, and replace <email> by your email (required for Let's Encrypt certificate)

SEARXNG_HOSTNAME=mysearxng.example.com
LETSENCRYPT_EMAIL=you@example.com
```

These steps will ensure a tailored environment for your SearXNG setup.

## Step 5: Customize Settings

Edit the `searxng/settings.yml` file according to your preferences and needs.

### Example of **settings.yml**

Here's an example of how your `settings.yml` file might look:

```shell
# see https://docs.searxng.org/admin/engines/settings.html#use-default-settings
use_default_settings: true
server:
  # base_url is defined in the SEARXNG_BASE_URL environment variable, see .env and docker-compose.yml
  secret_key: "your_keys"  # change this!
  limiter: true  # can be disabled for a private instance
  image_proxy: true
  method: "GET"
ui:
  static_use_hash: true
  default_theme: simple
  theme_args:
    simple_style: dark
redis:
  url: redis://redis:6379/0
general:
  instance_name:  "SearXNG  - Search Engine"
search:
  safe_search: 0
  autocomplete: ""
  default_lang: ""
```

## Step 6: Start SearXNG

Ensure everything is set up correctly by starting the SearXNG instance:

```shell
sudo docker-compose up -d
```

This will launch the SearXNG stack and keep it running in the background, allowing you to continue using the terminal for other tasks.

## Step 7: Verify and Access SearXNG

With SearXNG running in the background, you can now access it through your web browser. Open your browser and enter the hostname you configured earlier, prefixed with `https://`. You should see the SearXNG search interface, ready for private and efficient searches.

## Updating Your SearXNG Instance

Ensuring your SearXNG instance is up-to-date is crucial for maintaining security and performance. To update your SearXNG stack, follow these simplified steps:

1. **Stop and Remove Containers:**
   Open a terminal and navigate to the `searxng-docker` directory. Stop and remove the current SearXNG containers:

   ```shell
   cd /usr/local/searxng-docker
   sudo docker-compose down
   ```

2. **Pull Latest Docker Images:**
   After stopping the containers, pull the latest SearXNG Docker images to ensure you have the most recent updates:

   ```shell
   sudo docker-compose pull
   ```

3. **Start Updated Stack in Background:**
   Start the updated SearXNG stack in the background:

   ```shell
   sudo docker-compose up -d
   ```

By following these three simple steps, you'll successfully update your SearXNG instance, ensuring an improved and secure search experience.

## Conclusion

Setting up your SearXNG instance using Docker is now a streamlined process, thanks to this guide. While the provided `docker-compose.yml` file is comprehensive, we understand that the official `docker-compose` README might not be the most user-friendly resource for everyone. That's why we've gone the extra mile to break down the Docker Compose setup and explain its components in a more accessible way.

By creating this guide, we aim to bridge the gap and make the process of deploying your own SearXNG instance smoother and more understandable. Docker Compose abstracts the complexity of managing containers and services, but we've taken the effort to provide you with insights into how each service works together to bring your SearXNG metasearch engine to life.

Feel confident in using Docker Compose to set up and maintain your SearXNG instance. This guide empowers you to create your private, efficient, and privacy-respecting search engine.

### Keeping Your System and SearXNG Up to Date

To maintain the security and optimal performance of your SearXNG instance and the underlying Linux system, remember to:

- Regularly apply updates to your Linux system.
- Periodically update your SearXNG using Docker Compose.

By adhering to these practices, you ensure that both your SearXNG instance and your system remain current and resilient.

## Reference

- https://github.com/searxng/searxng-docker