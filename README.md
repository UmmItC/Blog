## Introductio

UmmIt server utilizes [Hugo](https://gohugo.io/) with the [Blowfish](https://blowfish.page/) theme to power its website. Follow the steps below to host this website on your server.

## Usage Guide

### 1. Install Required Packages

Ensure you have the necessary packages installed by running the following command:

```shell
sudo pacman -S hugo git
```

### 2. Clone the Repository

Clone the repository, including its submodules:

```shell
git clone --recursive https://codeberg.org/UmmIt/Blog.git
```

### 3. Navigate to the Repository

Move into the cloned repository directory:

```shell
cd Blog
```

### 4. Update Submodules

Ensure all submodules are up to date:

```shell
git submodule update --recursive --remote --init # First time only
git submodule update --recursive --remote
```

## Start the Server

To run your server, use the following command:

```shell
hugo server --watch --logLevel debug
```

## Build HTML Files

Build the HTML files to the default path `./public/`. After building, upload them to your server:

```shell
hugo --logLevel debug
```

### CI/CD

Currently only the gitlab CI/CD action can automatically create HTML files. You can see the `./.gitlab-ci.yml` file.

If you enable it successfully, gitlab pages will be automatically built every time you push them. This is very convenient!

**Action TODO**

- Codeberg action (Forgejo)
- Github action

## Mirror Server

My glow is using Differnet DevSecOps and hosting all the servers. Including Mirror servers.

Here are the servers of my hosting list. You can visit the same content with different server.

- [Codeberg page](blog.ummit.dev) (Main Server) - Running 
- [Gitlab page](gl-blog.ummit.dev) (Mirror Server) - Running
- Github page (Mirror Server) - **Coming soon**
- [Cloudflare page](cf-blog.ummit.dev) (Mirror Server) - Running
- Vercel (Mirror Server) - **Coming soon**
- Netlify (Mirror Server) - **Coming soon**

## Help me

If you encounter any issues, refer to the [Hugo documentation](https://gohugo.io/documentation/) to learn hugo first. Also, if you really need help, feel free to open an issue in my codeberg [repository](https://codeberg.org/UmmIt/Blog/issues).
