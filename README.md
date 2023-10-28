# Introduction

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

Now navigate to the git repo repository.

```shell
cd Server
```

### 3. Install Required node modules

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