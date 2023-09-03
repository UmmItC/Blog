---
author: "Arcsly"
title: "Hugo: How to Disable the Sitemap After Generating Your Public Files"
description: "Discover the distinctions between various bootable USB tools and find the right one for your needs. including YUMI, Rufus and BalenaEtcher."
tags: ["SSG", "Hugo"]
date: 2023-09-03T23:33:40+0800
thumbnail: https://d33wubrfki0l68.cloudfront.net/c38c7334cc3f23585738e40334284fddcaf03d5e/2e17c/images/hugo-logo-wide.svg
---

## Introduction

If you’re using Hugo, a popular static site generator, you might be aware that it automatically generates certain files, such as sitemaps, to enhance your website’s functionality and search engine optimization. However, there are cases where you might want to disable the sitemap generation. In this article, we’ll explore how to disable the sitemap in Hugo after generating your public files.

## Why Disable the Sitemap?

Before we dive into the how, let's briefly discuss why you might want to disable the sitemap in Hugo:

1. **Customization**: You might have specific needs for your website's sitemap structure that Hugo's default sitemap generation doesn't fulfill. In such cases, you can choose to disable Hugo's sitemap generation and create a custom sitemap yourself.

2. **Reducing Files**: If you want to reduce the number of files in your public directory or keep it clean, disabling the sitemap can help accomplish this.

## Steps to Disable the Sitemap in Hugo

To disable the sitemap in Hugo, follow these steps:

### 1. Open Your Hugo Configuration File

Start by opening your Hugo project's configuration file. This file is typically named `config.toml` or `config.yaml` or `hugo.toml` this is located in the root directory of your Hugo project.

### 2. Add `disableKinds` Configuration

Inside your configuration file, locate or add the `[outputs]` section. Within this section, you can specify which Hugo output types you want to disable. To disable the sitemap, you can use the `disableKinds` parameter like this:

```toml
disableKinds = ["sitemap"]
```

If you want to disable multiple output types, you can list them within the square brackets. For example, to disable the sitemap, RSS feed, and `robots.txt` file, you can use the following configuration:

```toml
disableKinds = ["sitemap", "RSS", "robotsTXT"]
```

By adding `sitemap`, `RSS`, and `robotsTXT` to the disableKinds configuration, you have effectively disabled the generation of the sitemap, RSS feed, and the robots.txt file in your Hugo project.

### Example for result

your result should look like that:

```toml
# Example Hugo Configuration File
# -------------------------------

# Basic Site Configuration
baseurl = "yourdomain.com"
title = "My Pages"
theme = "mytheme"

# Disable Output Kinds
disableKinds = ["sitemap", "RSS", "robotsTXT"]

```

This example demonstrates a simplified Hugo configuration file with some common settings, including the base URL, site title, theme, and the disabling of specific output kinds as discussed earlier in the article. You can customize these settings according to your actual Hugo project's configuration.

### 3. Save the Configuration File

After adding or modifying the `disableKinds` configuration, save the changes to your configuration file.

### 4. Rebuild Your Hugo Site and Verify

To apply the changes and disable the sitemap, you need to rebuild your Hugo site. Open your terminal or command prompt, navigate to your Hugo project's root directory, and run the following command:

```shell
hugo --logLevel debug
```

Hugo will recompile your site with the updated configuration, and the sitemap will no longer be generated in the `public` directory.

### Delete absolutely
However, if you find that the sitemap file still exists in the `public` directory after running the command, you can take additional steps to remove it:

```shell
cd public && rm -rfv * && cd .. && hugo --logLevel debug
```

This one-liner combines the commands to navigate to the public directory, remove its contents, return to the project's root directory, and rebuild Hugo with debug output in a concise and visually appealing manner.


## Conclusion

Disabling the sitemap in Hugo is a straightforward process that allows you to have more control over your website's output. Whether you have specific SEO requirements, customization needs, or simply want to keep your `public` directory cleaner, Hugo's flexibility makes it easy to achieve your goals.\

## References

- [Customize sitemap in Hugo Website](https://codingnconcepts.com/hugo/sitemap-hugo/)
- [Turn Off sitemap.xml - HUGO discourse](https://discourse.gohugo.io/t/turn-off-sitemap-xml/6912)
- [Disable page from sitemap - HUGO discourse](https://discourse.gohugo.io/t/disable-page-from-sitemap/37213)
- [Sitemap templates - HUGO](https://gohugo.io/templates/sitemap-template/)