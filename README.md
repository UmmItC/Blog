# Introduction

Arcsly blog server was using Hugo and [Blist](https://blist.vercel.app/en/) themes. but i modify something.

## Usage

Follow these steps to host this website:

### 1. Install Hugo

You need install hugo, git, nodejs and npm , type the following commnad:

```shell
sudo pacman -S hugo git nodejs npm
```

### 2. Install Required Packages

Make sure `nodejs` and `npm` are installed on your computer:

```shell
npm install
npm install postcss-cli
npx browserslist@latest --update-db
```

### 3. Clone the Repository

Ensure that you have `git` installed on your computer, and then clone the repository:

```shell
git clone https://codeberg.org/Arcsly/Arcsly-server.git
```

#### Start the Server

To run your server, use the following command:

```shell
npm start  # Use npm to run
hugo server --watch --verbose # Use Hugo to run
```

## Build HTML Files

The HTML files are built to the default paths in `./public/`. After building, upload them to your server:

```shell
hugo -v
```