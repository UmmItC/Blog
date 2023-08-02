---
author: "Arcsly"
title: "電腦版 Firefox 自訂你想使用的 Search Engine"
description: "Firefox 沒有一個預設選項來新增其他的 Search Engine，你是需要修改 about:config。本文章會說明如何修改 ~"
tags: ["youtube-dl", "yt-dlp"]
date: 2023-06-28T01:09:30+0800
thumbnail: https://upload.wikimedia.org/wikipedia/commons/2/28/Firefox_logo%2C_2017.svg
---

# Firefox 預設 Search engine

如果你需要在你的電腦版使用其他的 search engine，並且設為預設的話，電話版是有提供的，但是電腦版就沒有了，你只能使用他本身提供的幾個預設選項，就像 `Duckduckgo`, `Google`, `Bing`。

## 如何修改

Firefox 原本其實提供了很多不同的參數給大家修改，但那一頁需要你入手輸入 ~


1. 我們先在 URL 欄內輸入 `about:config` 去到這一頁

![about:config](/blog/tw/browser/custom-searchengine/about-config.png)

2. 然後查 `browser.urlbar.update2.engineAliasRefresh` 再將原本的 `false` 改為 `true`。(如下圖)

![browser.urlbar.update2.engineAliasRefresh](/blog/tw/browser/custom-searchengine/browser.urlbar.update2.engineAliasRefresh.png)

3. 這樣當你回到 Search settings 欄你就會發現多了一個選擇是 `Add`。現在就可以加入你想要的預設 Search Engine 了！

- Search engine name -  (SearXNG)
- Engine URL - https://search.ononoki.org/search?q=%s
- Alias - (@SearXNG)

![about:config](/blog/tw/browser/custom-searchengine/added.png)