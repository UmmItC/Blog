> [!NOTE]
> The blog will soon close and be replaced by my new theme use Astro to write, which I created. Please check it out at this :D
>
> https://github.com/UmmItC/Purple

# Blog Server

My Blog server was utilizes [Hugo](https://gohugo.io/) with the [Blowfish](https://blowfish.page/) theme to power. Follow the steps below to host this website on your server.

## Usage Guide

This website was built using Hugo, so please install it on your system before proceeding. For Arch Linux users, you can install Hugo using the following command:

```shell
sudo pacman -S hugo
```

Next, clone the repository, including its submodules. It is important to use the `--recursive` flag to include the submodules, as this repository relies on two submodules that are necessary for building:

```shell
git clone --recursive https://github.com/UmmItC/Blog.git
```

Ensure that all submodules are up to date:

```shell
git submodule update --recursive --remote # First time only
git submodule update --recursive --remote
```

Alternatively, you can run the provided script to update everything which i wrote:

```shell
./update.sh
```

To skip the confirmation prompt for updating submodules and building the Hugo site, use the `--noconfirm` option:

```shell
./update.sh --noconfirm
```

## Start the Server

To run your server, use the following command:

```shell
hugo server --watch --logLevel debug
```

## Build HTML Files

To build the HTML files to the default path `./public/`, run the following command. After building, you can upload the files to your server:

```shell
hugo --logLevel debug
```

### CI/CD

We have CI/CD pipelines set up across multiple platforms: `.woodpecker.yml` on Codeberg and `hugo.yaml` within `./github/workflows` on GitHub. Once enabled, these pipelines automatically trigger builds every time you push changes :)

With Cloudflare Pages, you can link your GitHub repository, clone it, and run the installation commands (see the build section).

## Running the Server

I use various DevOps tools to host my server, including mirror servers. Here are the servers in my hosting list. You can access the same content through different servers:

- [GitHub Page](https://blog.ummit.dev) (Main Server) - Running
- [Codeberg Page](https://cb-blog.ummit.dev) (Mirror Server) - Running 
- [Cloudflare Page](https://cf-blog.ummit.dev) (Mirror Server) - Running

## Help

Feel free to open an issue in my repository if you have any questions or need assistance. I will do my best to help you!

## License

This project is licensed under the GPL-2.0 License - see the [LICENSE](./LICENSE) file for details.
