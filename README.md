## Introduction

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

or run the lazy script :D

```shell
chmod +x update.sh
./update.sh
```

#### Skipping Confirmation

You can skip the confirmation prompt for updating submodules and Building hugo site by using the `--noconfirm` option:

```shell
./update.sh --noconfirm
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

Currently, we have CI/CD pipelines set up across multiple platforms: `.woodpecker.yml` on Codeberg, `.gitlab-ci.yml` on GitLab, and `hugo.yaml` within `./github/workflows` on GitHub. Once successfully enabled, these pipelines automatically trigger builds every time you push changes, This is very convenient!

With Cloudflare Pages, just link your GitLab or GitHub repository, clone it, and run the installation commands (See build section)

## Running Server

I'm using differnet Devops to hosting my server. Including Mirror servers.

Here are the servers of my hosting list. You can visit the same content with different server.

- [Github page](https://gh-blog.ummit.dev) (Mirror Server) - Running
- [Codeberg page](https://cb-blog.ummit.dev) (Mirror Server) - Running 
- [Gitlab page](https://gl-blog.ummit.dev) (Mirror Server) - Running
- [Cloudflare page](https://cf-blog.ummit.dev) (Mirror Server) - Running

## Help me

Feel free to open an issue in my codeberg [repository](https://codeberg.org/UmmIt/Blog/issues) :D

## LICENSE

All articles are under [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/). See [here](https://codeberg.org/UmmIt/Article/src/branch/master/LICENSE.md)
