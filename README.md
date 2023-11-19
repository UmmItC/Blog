## Introduction

Arcsly blog server was using [Hugo](https://gohugo.io/) and [Blowfish](https://blowfish.page/) themes.

## Usage

Follow these steps to host this website:

### 1. Install Required Packages

You need install hugo and git, type the following commnad:

```shell
sudo pacman -S hugo git
```

### 2. Clone the Repository

Clone the repository:

```shell
git clone --recursive git@codeberg.org:Arcsly/Server.git
```

### 3. Navigate to the directory

Now navigate to the git repo repository.

```shell
cd Server
```

## Start the Server

To run your server, use the following command:

```shell
hugo server --watch --logLevel debug
```

## Build HTML Files

The HTML files are built to the default paths in `./public/`. After building, upload them to your server:

```shell
hugo --logLevel debug
```
