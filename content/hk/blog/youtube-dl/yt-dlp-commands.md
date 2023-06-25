---
author: "VBoo"
title: "yt-dlp - 下載影片或音樂"
description: "Sample article showcasing basic Markdown syntax and formatting for HTML elements."
tags: ["youtube-dl", "yt-dlp", "html"]
date: 2021-12-11T02:15:01+0800
thumbnail: https://raw.githubusercontent.com/yt-dlp/yt-dlp/master/.github/banner.svg
---

<img alt="yt-dlp" src="https://raw.githubusercontent.com/yt-dlp/yt-dlp/master/.github/banner.svg" width="auto"/>

# Youtube-dl <i class="fa-brands fa-youtube"></i>

yt-dlp 係一個 youtube-dl 既加強版本，基本上所有功能都比起原本既 youtube-dl 好好多，例如喺下載速度方面，因為 youtube-dl 係用單線程，而 yt-dlp 呢邊就係用緊多線程下載，所以速度方面係快好撚多。
另外，喺更新速度方面，佢比起 youtube-dl 本身既快好多倍。指令方面會比起 youtube-dl 本身仲多左。

## 第三方程式 <i class="fa-brands fa-youtube"></i>

因應 youtube-dl 係開源 github 作品，所以出現左好多唔同版本由社群創造既版本，以下係三個作品既分別資訊

| 版本           | 更新速度 | 連接方法    | 支援系統                | 指令分別              | 介面             |
|----------------|--------|---------|---------------------|-------------------|----------------|
| [Youtube-dl](https://github.com/ytdl-org/youtube-dl)     | 超慢     | 單線程     | Linux, Mac, Windows | 唔夠 yt-dlp 多指令     | 指令操作，白色字顯示     |
| [yt-dlp](https://github.com/yt-dlp/yt-dlp)        | 頻繁     | 多線程     | Linux, Mac, Windows | 比起 youtube-dl 多指令 | 指令操作，顏色字顯示 |
| [youtube-dl-gui](https://github.com/jely2002/youtube-dl-gui) | 似乎已停更  | Unknown | Mac, Windows        | 圖形用戶介面             | 圖形用戶介面         |

---

# 多線程下載影片

其實呢個指令係唔洗打都得，因為佢預設係已經會用多線程下載，不過你想指定既數字咁下載就用啦 ~~

`--concurrent-fragments [number]` 使用你想要的線程下載影片。

```shell
yt-dlp [link] --concurrent-fragments (number)
```

**例子 :**

```shell
yt-dlp --concurrent-fragments 10 https://www.youtube.com/watch?v=d59Qe_Ov2k8
```

---

# 改變下載速度

下載片既時候係會用左你既頻寛 (流量)，呢個時候就會將你部機既上網變慢左，
咁有可能會造成你上網既體驗變差左，呢個時候就可以用呢個指令去指定你想要既速度。

`--throttled-rate [number]K` 限制使用你想要的速度下載影片。

```shell
yt-dlp [link] --throttled-rate [number]K
```

**例子 :**

限制使用 100K 下載影片。

```shell
yt-dlp --throttled-rate 100K https://www.youtube.com/watch?v=d59Qe_Ov2k8
```