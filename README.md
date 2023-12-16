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
git clone --recursive git@codeberg.org:UmmIt/Blog.git
```

### 3. Navigate to the Repository

Move into the cloned repository directory:

```shell
cd Server
```

### 4. Update Submodules

Ensure all submodules are up to date:

```shell
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

If you encounter any issues, refer to the [Hugo documentation](https://gohugo.io/documentation/) for additional support.
