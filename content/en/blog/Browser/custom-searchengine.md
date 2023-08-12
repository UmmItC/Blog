---
author: "Arcsly"
title: "Enhance Your Firefox Experience: Customizing the Default Search Engine on Desktop"
description: "Unlock a world of personalized browsing in Firefox with our step-by-step guide. Learn how to easily customize your default search engine on the desktop version."
tags: ["Browser", "firefox"]
date: 2023-08-11T08:20:50+0800
thumbnail: https://upload.wikimedia.org/wikipedia/commons/2/28/Firefox_logo%2C_2017.svg
---

# Customizing Default Search Engines in Firefox Desktop

If you're a Firefox user looking to set a different default search engine in the desktop version, you might have noticed that while this option is available in the mobile version, it's not as straightforward on desktop. By default, you're limited to a set of preset search engine options such as `DuckDuckGo`, `Google`, and `Bing`. But fear not, we have a workaround that allows you to customize your default search engine on Firefox desktop.

## Modifying Firefox Configuration

Before we dive into the steps, keep in mind that these instructions involve modifying Firefox's configuration settings, which requires a bit of technical know-how. But don't worry, we'll guide you through the process.

### Step 1: Accessing the Configuration Page

1. Open Firefox and type `about:config` in the address bar.

2. You may encounter a warning message. Click on "Accept the Risk and Continue" to proceed.

![about:config](/blog/browser/custom-searchengine/about-config.png)

### Step 2: Enabling Additional Search Engines

1. In the search bar at the top of the `about:config` page, enter `browser.urlbar.update2.engineAliasRefresh`.

2. Locate the preference named `browser.urlbar.update2.engineAliasRefresh` and double-click on it to toggle its value from `false` to `true`.

   ![browser.urlbar.update2.engineAliasRefresh](/blog/browser/custom-searchengine/browser.urlbar.update2.engineAliasRefresh.png)

### Step 3: Adding Your Preferred Search Engine

1. Now, head back to the Firefox search settings. You'll notice a new option: "Add." Click on this option.

   ![Add new search engine](/blog/browser/custom-searchengine/Add.png)

2. Enter the details of your preferred search engine:

   - Search Engine Name: SearXNG
   - Engine URL: `https://search.ononoki.org/search?q=%s`
   - Alias: @SearXNG

![about:config](/blog/browser/custom-searchengine/added.png)

3. Click "Add Engine" to save your custom search engine.

### Step 4: Set Your Custom Search Engine as Default

1. Return to the search settings and find your newly added search engine in the list.

2. Click on the three-dot menu next to your custom search engine and select "Set as Default."

## Conclusion

Customizing the default search engine in Firefox desktop might involve a few extra steps compared to the mobile version, but it's certainly worth the effort. By leveraging the configuration settings, you can set your preferred search engine as the default, giving you greater control over your browsing experience. Now you can enjoy seamless searches using your chosen search engine directly from the Firefox address bar. So go ahead, personalize your browsing journey, and make Firefox work for you!