---
author: "Arcsly"
title: "電腦版 Firefox 上自訂您的預設搜尋引擎"
description: "了解如何在 Firefox 桌面版上自訂您的預設搜尋引擎。"
tags: ["Browser", "firefox"]
date: 2023-06-28T01:09:30+0800
thumbnail: https://upload.wikimedia.org/wikipedia/commons/2/28/Firefox_logo%2C_2017.svg
---

# 在 Firefox 桌面版中自訂預設搜尋引擎

如果您是 Firefox 的使用者，且想要在桌面版中設置不同的預設搜尋引擎，您可能已經注意到，在行動版中雖然有這個選項，但在桌面版上則不太直觀。預設情況下，您只能選擇一組預設的搜尋引擎選項，如 `DuckDuckGo`、`Google` 和 `Bing`。但請不要擔心，我們有一個解決方法，讓您在 Firefox 桌面版上自訂您的預設搜尋引擎。

## 修改 Firefox 設定

在我們深入步驟之前，請注意這些指示涉及修改 Firefox 的設定，這需要一些技術知識。但請放心，我們將引導您完成整個過程。

### 步驟 1：進入設定頁面

1. 打開 Firefox，並在地址欄中輸入 `about:config`。

2. 您可能會看到一個警告訊息。點擊「接受風險並繼續」以繼續。

![about:config](/blog/browser/custom-searchengine/about-config.png)

### 步驟 2：啟用其他搜尋引擎

1. 在 `about:config` 頁面頂部的搜尋欄中，輸入 `browser.urlbar.update2.engineAliasRefresh`。

2. 找到名為 `browser.urlbar.update2.engineAliasRefresh` 的設定，並雙擊它，將其值從 `false` 切換為 `true`。

   ![browser.urlbar.update2.engineAliasRefresh](/blog/browser/custom-searchengine/browser.urlbar.update2.engineAliasRefresh.png)

### 步驟 3：新增您喜歡的搜尋引擎

1. 現在，返回 Firefox 的搜尋設定。您會注意到多了一個選項：「新增」。點擊此選項。

   ![新增新搜尋引擎](/blog/browser/custom-searchengine/Add.png)

2. 輸入您喜愛的搜尋引擎的詳細資料：

   - 搜尋引擎名稱：SearXNG
   - 引擎網址：`https://search.ononoki.org/search?q=%s`
   - 別名：@SearXNG

   ![新增搜尋引擎](/blog/browser/custom-searchengine/added.png)

3. 點擊「新增引擎」以保存您的自訂搜尋引擎。

### 步驟 4：將您的自訂搜尋引擎設為預設

1. 返回搜尋設定，並在清單中尋找您新加入的搜尋引擎。

2. 點擊您的自訂搜尋引擎旁的三點選單，然後選擇「設為預設」。

## 總結

在 Firefox 桌面版中自訂預設搜尋引擎可能需要比行動版多一些步驟，但這絕對是值得的。通過設定，您可以將您喜愛的搜尋引擎設為預設，從而更好地掌握您的瀏覽體驗。現在，您可以直接從 Firefox 的地址欄中使用您選擇的搜尋引擎進行無縫搜尋。所以，請隨心所欲地個性化您的瀏覽之旅，讓 Firefox 更適合您的需求！