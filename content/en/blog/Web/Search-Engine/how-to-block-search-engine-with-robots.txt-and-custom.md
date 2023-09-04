---
author: "Arcsly"
title: "Search Engine Crawlers: A Guide to custom robots.txt with Disallow or allow Rule"
description: "Learn how to take control of search engine crawling by using the robots.txt disallow rule to restrict access to specific parts of your website."
tags: ["Search-Engine", "Robots.txt"]
date: 2023-09-04T21:14:00+0800
thumbnail: http://studywarehouse.com/wp-content/uploads/2017/06/Google-Search.jpg
---

## Introduction

In the vast landscape of the internet, search engines are the navigators, helping users discover websites and content. However, not every website owner wants search engines to freely roam their digital domain. This is where the robots.txt file, with its "Allow" and "Disallow" directives, comes into play, offering webmasters a powerful tool for controlling how search engine crawlers interact with their sites.

In this comprehensive guide, we will delve into the world of controlling search engine crawlers using the robots.txt file's "Allow" and "Disallow" directives. You'll learn what it is, why it's essential, and how to implement it effectively to regulate search engine access to your web content.

## What is Robots.txt?

At its core, the robots.txt file is a simple but powerful tool that website owners use to communicate with web crawlers, also known as spiders or bots. These automated programs, employed by search engines like Google, Bing, and others, traverse the web, indexing web pages to make them searchable.

The robots.txt file serves as a set of instructions for these crawlers. It tells them which parts of a website are open for exploration and indexing (using "Allow") and which should remain off-limits (using "Disallow"). In essence, it acts as both a "Welcome" and a "No Entry" sign for certain areas of your website.

To create and manage a robots.txt file, you don't need to be a coding wizard. It's a plain text file that sits at the root directory of your website, and you can create or edit it with a simple text editor.

### Why Is This Control Necessary?

By default, even if you haven't explicitly added your site to a search engine, web crawlers can autonomously find and index your public domain. This can lead to undesired visibility or indexing of confidential information.

### Why You Might Want to Use "Disallow"

The internet is a vast, interconnected ecosystem where privacy, security, and content control matter. Here are some compelling reasons why you might want to use the "Disallow" directive to block search engines from crawling specific parts of your website:

- **Private or Restricted Content**: You have sections of your site that are intended for specific users only, and you want to keep them hidden from search engine indexing.

- **Staging or Development Sites**: You may have staging or development versions of your site that you don't want appearing in search results.

## Implementing "Allow" and "Disallow" in Robots.txt

Now that we understand why you might want to use "Disallow" to block a search engine, let's explore how to use both "Allow" and "Disallow" effectively in your robots.txt file:

1. **Locate Your Robots.txt File**: Find the robots.txt file at the root directory of your website. For example, it's accessible at `https://yourwebsite.com/robots.txt`.

2. **Choose User Agents**: Decide which search engine bots you want to allow or block. The User-agent directive specifies the bot you're addressing.

3. **Set "Disallow" Rules**: Use the "Disallow" directive to specify the URLs or directories you want to block for the chosen user agent.

4. **Set "Allow" Rules**: Use the "Allow" directive to specify exceptions to the "Disallow" rules, allowing certain parts of your site to be crawled by search engines.

### Example: Allowing and Disallowing with Robots.txt

You can further refine your control over search engine access by using both "Allow" and "Disallow" directives. Here's an example:

```plain
User-agent: Googlebot
Disallow: /private/
Allow: /public/
```

- `User-agent: Googlebot` specifies that these rules apply specifically to Google's search engine bot.

- `Disallow: /private/` tells Googlebot not to access the "/private/" directory.

- `Allow: /public/` provides an exception, allowing Googlebot to access the "/public/" directory, even though it falls under the broader "Disallow" rule.

By combining "Allow" and "Disallow" directives, you can fine-tune access control for different search engines or specific parts of your site.

### Example: Blocking Everything with Robots.txt

In some cases, you might want to prevent all search engines from crawling and indexing your entire website. This is a drastic step, but it can be useful for specific scenarios, such as when you're working on a development version of your site and don't want it to appear in search results. Here's how you can achieve this by blocking everything using robots.txt:

```plain
User-agent: *
Disallow: /
```

In this example:

- `User-agent: *` specifies that these rules apply to all web crawlers.

- `Disallow: /` is the directive that tells all web crawlers to stay away from your entire site. The forward slash "/" represents the root directory, so "Disallow: /" effectively blocks access to the entire website.

Please use this directive with caution, as it will make your entire site inaccessible to search engines. Only use it temporarily and in situations where you have a specific need to keep your site out of search engine results. Be sure to remove or modify this rule when you want your site to be indexed again.

### Example: Specifying Rules for Googlebot

If you want to specify rules for Googlebot specifically, you can use the following example:

```plain
User-agent: Googlebot
Disallow: /private/
```

- `User-agent: Googlebot` specifies that these rules apply only to Google's search engine bot.

- `Disallow: /private/` tells Googlebot not to access the "/private/" directory.

You can customize these rules to control how Googlebot interacts with your website.

### Example: Specifying Rules for Bingbot

To specify rules for Bingbot, Microsoft's search engine bot, you can use a similar approach:

```plain
User-agent: Bingbot
Disallow: /restricted/
Allow: /public/
```

- `User-agent: Bingbot` specifies that these rules apply specifically to Bingbot.

- `Disallow: /restricted/` instructs Bingbot not to access the "/restricted/" directory.

- `Allow: /public/` provides an exception, allowing Bingbot to access the "/public/" directory, even though it falls under the broader "Disallow" rule.

## Using `noindex, nofollow` to Disallow Crawling

While the `robots.txt` file is effective for controlling search engine access to entire directories or sections of your website, you might want to exert more granular control over individual web pages. To achieve this level of control, you can use the `noindex, nofollow` meta tag within the HTML of specific pages.

Here's how to use the `noindex, nofollow` meta tag:

1. **Locate the HTML `<head>` Section**: Open the HTML file of the page you want to block search engines from indexing and locate the `<head>` section within the HTML document.

2. **Insert the Meta Tag**: Inside the `<head>` section, add the following meta tag:

   ```html
   <meta name="robots" content="noindex, nofollow" />
   ```

   This meta tag instructs search engine crawlers not to index the page (`noindex`) and not to follow any links on the page (`nofollow`), effectively preventing the page from appearing in search engine results and preventing search engines from crawling any links present on the page.

3. **Save and Update**: Save the changes to your HTML file and upload it to your web server if necessary.

4. **Verify the Meta Tag**: To ensure that the `noindex, nofollow` meta tag has been correctly implemented, you can inspect the HTML source code of the page after it's live on your server. Right-click on the page in your web browser and select "View Page Source" or use the browser's developer tools to inspect the page's HTML source. Look for the presence of the meta tag within the `<head>` section.

Using the `noindex, nofollow` meta tag is particularly useful when you want to block individual pages from being indexed while allowing the rest of your website to be accessible to search engine crawlers. It's a versatile tool for fine-tuning your website's visibility and ensuring that specific content remains private or hidden from search engine results.

Remember that while the `robots.txt` file blocks access to pages and directories at the crawling stage, the `noindex, nofollow` meta tag affects how search engines display and follow links on already indexed pages. Both methods work together to provide comprehensive control over your website's visibility on search engines.

## Verifying Your Robots.txt Configuration

After you've created or modified your robots.txt file, it's crucial to verify its configuration to ensure it's working as intended. Here's how you can do it:

1. **Upload the Robots.txt File**: First, upload the robots.txt file to the root directory of your web server. You can access it by visiting `https://yourdomain.com/robots.txt`.

2. **Check the Content**: When you access this URL, you should see the content of your robots.txt file displayed in your web browser. This confirms that the file has been correctly uploaded and is accessible to both humans and web crawlers.

### Waiting for Search Engine Bot Action

Once your robots.txt file is uploaded and accessible, you'll need to be patient as search engine bots process the changes. Here's what to expect:

1. **Monitoring and Waiting**: After you've uploaded the robots.txt file, you'll need to be patient. It may take a few days or more for search engine bots to discover and process your updated robots.txt file. During this period, the bots will continue to crawl your site based on their previous instructions.

2. **Updates to Search Results**: Once the search engine bots have processed the new robots.txt file, they will update their indexing accordingly. This means that any URLs or directories you've disallowed in the robots.txt file will eventually be removed from search engine results, and any new instructions will be implemented.

3. **Consider Submitting a Sitemap**: To help search engines better understand the structure of your website, you can also consider submitting a sitemap through search engine webmaster tools. This can expedite the indexing process and ensure that your site's content is accurately represented in search results.

Remember that changes to your robots.txt file can take some time to propagate across search engines, so it's essential to be patient and monitor the results over time to ensure that your website's visibility aligns with your intentions.

## Checking for Removal of Blocked Pages

Once you've implemented changes to your robots.txt file to block specific pages or directories from search engine indexing, you'll want to confirm that the changes have taken effect on both Google and Bing. Here's how to do it:

### Checking with Google Search Engine

1. **Visit Google.com**: Open your web browser and visit the Google search engine at [Google.com](https://www.google.com/).

2. **Use the "site:" Operator**: In the Google search bar, enter the following command, replacing "yourdomain.com" with your actual domain name:

   ```plain
   site:yourdomain.com
   ```

   This command tells Google to search specifically for pages indexed from your website.

3. **Review the Search Results**: After executing the search, review the search results. Pay attention to whether the pages or directories you've blocked in your robots.txt file still appear in the search results.

   - If the blocked pages are no longer listed, it indicates that Google has successfully removed them from its index, and your robots.txt directives are working as intended.

   - If the blocked pages still appear in the search results, it may take more time for Google to process the changes fully. Be patient and continue monitoring the results.

### Checking with Bing Search Engine

1. **Visit Bing.com**: Open your web browser and visit the Bing search engine at [Bing.com](https://www.bing.com/).

2. **Use the "site:" Operator**: In the Bing search bar, enter the following command, replacing "yourdomain.com" with your actual domain name:

   ```plain
   site:yourdomain.com
   ```

   This command tells Bing to search specifically for pages indexed from your website.

3. **Review the Search Results**: After executing the search, review the search results. Pay attention to whether the pages or directories you've blocked in your robots.txt file still appear in the search results.

   - If the blocked pages are no longer listed, it indicates that Bing has successfully removed them from its index, and your robots.txt directives are working as intended.

   - If the blocked pages still appear in the search results, it may take more time for Bing to process the changes fully. Be patient and continue monitoring the results.

This method provides a quick and accessible way to verify that both Google and Bing search engines have respected your robots.txt directives and removed blocked content from their search results. Remember that it may take some time for changes to propagate across search engines, so periodic checks can help ensure that your website's privacy and content control are maintained.

## Conclusion

Controlling search engine crawlers with the robots.txt file's "Allow" and "Disallow" directives is a fundamental aspect of managing your website's visibility and content accessibility. Whether you're safeguarding private sections, conserving resources, or optimizing your SEO, this tool empowers you to take charge of how search engines interact with your web domain. By understanding and effectively implementing the "Allow" and "Disallow" directives, you can navigate the digital landscape with confidence and control.

## References

- [How to Use Robots.txt to Allow or Disallow Everything - searchfacts](https://searchfacts.com/robots-txt-allow-disallow-all/)
- [How to Use Robots.txt to Allow or Disallow Everything - V DIGITAL SERVICES BLOG](https://www.vdigitalservices.com/how-to-use-robots-txt-to-allow-or-disallow-everything/)
- [How to Block Search Engines Using robots.txt disallow Rule](https://www.hostinger.com/tutorials/website/how-to-block-search-engines-using-robotstxt)
- [robots.txt to disallow all pages except one? Do they override and cascade?](https://stackoverflow.com/questions/19869004/robots-txt-to-disallow-all-pages-except-one-do-they-override-and-cascade)