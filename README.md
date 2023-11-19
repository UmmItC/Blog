# IMPORTANT

⚠️  This is a past version of the blist theme used on my blog server. I am using TAG to archive my previous blog versions. But if you prefer to use this older version, that is fine. Just please ensure that you are using the 'blist-theme' tag version of this, otherwise, it will not function properly.

## Introduction

Arcsly blog server was using [Hugo](https://gohugo.io/) and [Blist](https://blist.vercel.app/en/) themes. but i modify something.

## Usage

Follow these steps to host this website:

### 1. Install Required Packages

You need install hugo, git, nodejs and npm, type the following commnad:

```shell
sudo pacman -S hugo git nodejs npm
```

### 2. Clone the Repository

Clone the repository:

```shell
git clone --recursive https://codeberg.org/Arcsly/Server.git
```

### 3. Navigate to the directory

Now navigate to the git repo repository.

```shell
cd Server
```

### 4. Update submodule

Make sure submodule are updated to lastest commits.

```shell
git submodule update --remote --merge
```

### 5. Install Required node modules

Make sure `nodejs` and `npm` are installed on your computer:

```shell
npm install
npm install postcss-cli
npx update-browserslist-db@latest
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
