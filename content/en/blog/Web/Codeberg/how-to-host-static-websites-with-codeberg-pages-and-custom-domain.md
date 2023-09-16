---
author: "Arcsly"
title: "Codeberg Pages: A Guide to Hosting Static Websites for free and Custom Domain Setup"
description: "Learn how to using Codeberg Pages to host static websites for free and seamlessly integrate your custom domain. Explore the power of hassle-free web hosting with this comprehensive guide."
tags: ["Git", "Codeberg", "Web"]
date: 2023-09-03T19:50:04+0800
thumbnail: https://design.codeberg.org/logo-kit/icon_inverted.svg
lastmod: 2023-09-16T10:45:30+0800
---

## Host with Codeberg Page

Are you looking to host a website without the hassle of renting a server or dealing with complex backend setups? If your website is static, meaning it consists of only HTML, CSS, and JavaScript files, then Codeberg Pages might be the perfect solution for you. Not only can you host your static site for free, but you can also use your own custom domain to give it a personalized touch.

In this tutorial, we'll walk you through the process of hosting a website with Codeberg Pages and customizing it with your own domain. Let's dive right in!

## What Are Codeberg Pages?

Codeberg Pages is a feature provided by Codeberg, a hosting platform for Git repositories. With Codeberg Pages, you can easily publish your static websites directly from your Codeberg repository. It's a fantastic option for projects, blogs, or personal websites that don't require server-side scripting.

For more detailed information, you can check out the official Codeberg Pages documentation [here](https://docs.codeberg.org/codeberg-pages/).

## Hosting Your Website with Codeberg Pages

### Step 1: Create an Account

Before you can start hosting your website with Codeberg Pages, you'll need a Codeberg account. If you don't already have one, head over to [Codeberg](https://codeberg.org/user/login?redirect_to=%2f) and create an account.

### Step 2: Create a 'pages' Repository

Codeberg Pages will automatically detect repositories with the name `pages`. To create one, follow these steps:

1. Log in to your Codeberg account.

2. Click on the '+' icon in the upper right corner and choose 'New Repository'.

3. Name your repository 'pages'. Make sure the repository name is all in lowercase.

Now, your repository is ready to host your website's content.

>Note : for Codeberg Pages to work, you'll need at least one HTML file in this repository. Codeberg Pages detects and serves HTML files for rendering web pages, so ensure you have an 'index.html'  file.

### Step 3: Set Up Your Git Repository

Now, let's initialize a Git repository on your local development environment and push your website's content to your 'pages' repository on Codeberg.

1. **Initialize a Git Repository**:

    ```shell
    git init
    ```

2. **Add Your 'pages' Repository as the Remote Origin**:

    ```shell
    git remote add origin [your-repo-url]
    ```

3. **Create and Switch to a New Branch Named 'pages'**:

    ```shell
    git switch --orphan pages
    ```

4. **Add Your Website's Files**:

    Make sure to include at least one HTML file (e.g., 'index.html') in this step.

    ```shell
    git add .
    ```

5. **Commit Your Changes**:

    ```shell
    git commit -m "Initial commit"
    ```

6. **Push Your Files to the 'pages' Repository on Codeberg**:

    ```shell
    git push origin pages
    ```

Your website content is now uploaded to your 'pages' repository on Codeberg, making it accessible via your Codeberg Pages URL. Next, we'll look at customizing your domain for your static site.

## Adding Your Custom Domain

Now, let's personalize your website's domain name. Before proceeding, ensure you've already acquired your domain name through a domain provider like Cloudflare or Namecheap. We won't delve into the domain purchase process here, so let's begin the customization.

### Step 1: DNS Setting

To use a custom domain with your Codeberg Pages site, you'll need to purchase a domain from a domain registrar like [Cloudflare](https://www.cloudflare.com/) or [Namecheap](https://www.namecheap.com/).

### Step 2: Configure Your DNS

Next, configure your domain's DNS settings. Your DNS settings should look something like this:

| Domain             | Type  | Data                                    |
|--------------------|-------|-----------------------------------------|
| `yourdomain.com`     | A     | `217.197.91.145`                          |
| `yourdomain.com`     | AAAA  | `2001:67c:1401:20f0::1`                  |
| `yourdomain.com`     | TXT   | `pages.yourusername.codeberg.page`         |
| `www.yourdomain.com` | CNAME | `yourdomain.com`                         |

Please note that DNS changes can take some time to propagate across the internet.

#### How this working?

- **A (Address) Record**: This type of DNS record maps a domain name to an IPv4 address. In the example:

  - `Domain`: `yourdomain.com` is your custom domain.
  - `Type`: `A` signifies that it's an IPv4 address record.
  - `Data`: `217.197.91.145` is the IPv4 address to which `yourdomain.com` is mapped.

  When someone enters `yourdomain.com` in a web browser, the DNS system uses the A record to find the corresponding IPv4 address, allowing the browser to connect to the correct server.

- **AAAA (IPv6 Address) Record**: Similar to the A record, this type of DNS record maps a domain name to an IPv6 address, but for IPv6 networks. In the example:

  - `Domain`: `yourdomain.com` is your custom domain.
  - `Type`: `AAAA` signifies that it's an IPv6 address record.
  - `Data`: `2001:67c:1401:20f0::1` is the IPv6 address to which `yourdomain.com` is mapped.

  This record is used when the client (like a web browser) is using an IPv6 network and needs to resolve the domain to an IPv6 address.

- **TXT (Text) Record**: A TXT record carries human-readable information in a DNS record. In the example:

  - `Domain`: `yourdomain.com` is your custom domain.
  - `Type`: `TXT` signifies that it's a text record.
  - `Data`: `reponame.username.codeberg.page` contains text information.

  TXT records are often used for various purposes, such as domain ownership verification, email authentication (SPF, DKIM), and more. In this case, it seems to be related to Codeberg Pages and domain validation.

- **CNAME (Canonical Name) Record**: A CNAME record is used to create an alias for a domain name. In the example:

  - `Domain`: `www.yourdomain.com` is a subdomain alias.
  - `Type`: `CNAME` signifies that it's a canonical name record.
  - `Data`: `yourdomain.com` indicates that `www.yourdomain.com` is an alias for `yourdomain.com`.

  When a user enters `www.yourdomain.com` in a web browser, the DNS system redirects them to `yourdomain.com`. CNAMEs are often used to create shorter, more user-friendly URLs that point to longer or canonical domain names.

These DNS record types play a crucial role in ensuring that when someone accesses your custom domain, they are directed to the correct server and resources associated with that domain.

>For more detailed instructions on configuring your custom domain, refer to the [Codeberg Pages documentation](https://docs.codeberg.org/codeberg-pages/using-custom-domain/).

### Step 3: Create a '.domains' File

To link your custom domain to your Codeberg Pages site, create a file named '.domains' and add three lines to it:

```shell
<your-custom-domain>
<your_username>.codeberg.page
pages.<your_username>.codeberg.page
```

Replace `<your-custom-domain>` with your custom domain name and `<your_username>` with your Codeberg username.

Your final '.domains' file should look something like this:

```shell
mydomain.com
myusername.codeberg.page
pages.myusername.codeberg.page
```

Once you've created this file, push it to your 'pages' repository.

```shell
git add .domains
git commit -m "Create domain"
git push origin pages
```

### Final Step: Testing Your Custom Domain

It might take a few minutes for your DNS changes to fully propagate. Once that's done, you can visit your website using your custom domain to see it live. Alternatively, a quick way to check if the DNS changes have taken effect is to visit a site like this [site](enter your domain here). If the results display the IP you've pointed to, it means your changes are working.

> **Tips**: If you're using Cloudflare CDN, make sure your DNS points to Cloudflare's DNS rather than your specific IP address. Afterward, if you decide to disable the proxy, simply click on the orange icon to turn it grey.

And that's it! Congratulations on successfully hosting your static website with Codeberg Pages and customizing it with your own domain. Thank you for following these steps!