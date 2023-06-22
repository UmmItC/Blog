---
author: "VBoo"
title: "鐵人賽 Day1 - 建立子網域和了解子網域"
description: "更了解 DNS, DOMAIN."
tags: ["DNS", "鐵人賽", "DOMAIN"]
date: 2023-06-20T20:36:00+0800
thumbnail: https://mythemeshop.com/wp-content/uploads/2020/02/Different-domain-types.jpg
---

近期我重溫有關 DNS, DOMAIN 的知識。因為我需要自己架設一部用來看 Youtube 的 piped.video instance，重新接觸了 DNS, DOMAIN 相關的知識。
對上一次真正研究如何建立 DNS 已經是 2018 的時侯。哪時候我並沒有了解太多，就覺得運行成功就好了。而且網站也只有一個固定的名稱。什麼 `api.`, `docs.`, 可說是想也沒想過。

小時侯還以為 `www.` 這些是包括的 ... 直到現在開始重新研究該如何申請一個 `api.`, `docs.` 原來以前所使用的 www. 也只是其中一款的 common subdomain 名稱。實際上其實你喜歡用什麼名就什麼名。例如你想用 `hello.` 也是可以的，你喜歡就好了。

我現在知道了 subdomain 原來是可以無上限的建立，這樣解釋了為什麼一堆 `dev.`, `docs.`, `www2`。 以前的我一直在想到底要怎樣才能建立一個子網域？了解了一輪後發現原來這東西叫 subdomain。
所以實際來說這些網站都只需要一個就可以耶！我以前都以為要再申請才能使用... 想太多了。不過近來開始使用自己的 instance 來作日常的工具取代品，實在令我學習很多。原因是 `piped.video` 是需要 `api.`, `proxy.` 的 subdomain，但是沒理由申請3個網域吧？

![piped.video](https://camo.githubusercontent.com/6b3294a50da42f986a31e6ed9ea46cefd07f51d2c4e6b16c223a696702ba57a0/68747470733a2f2f636c6f7564666c6172652d697066732e636f6d2f697066732f62616679626569676166756d7672676266797566786a70747675666f627374727977726676326b7465797575696374666b6f366b7667686a737a75)

---

*`還未寫好，太累了。`*