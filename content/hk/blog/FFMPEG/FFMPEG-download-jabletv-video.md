---
author: "VBoo"
title: "使用 FFEMPG 下載 Jable.tv 影片教學"
tags: ["ffmpeg"]
date: 2021-12-13T00:28:36+0800
thumbnail: /blog/linux/linux-tools/FFMPEG/FFMPEG-download-jabletv-video/jable.png
---

# 2022.6.16 訊息

我發現原來 `youtube-dl` 同 `yt-dlp` 係有 support `Jable.tv` 既片，
所以以下咁多操作係唔洗做都得 =.=
但係以下既下載方法都係仲 work，當學一個操作囉，反正呢個方法有好多網都做到，唔一定係 `Jable.tv` 先可以 .w.

# 需要工具

喺下載之前你需要有以下既工具：

- `FFMPEG` (轉檔用)
- `Terminal` (用黎打指令)
- `Browser` （抽條 link 出黎)


# FFMPEG 下載

## Windows

windows 用家可以用 `scoop`.

```shell
scoop install ffmpeg
```

## Arch linux

```shell
sudo pacman -S ffmpeg
```

## Fedora

```shell
sudo dnf install ffmpeg
```

## Debian

```shell
sudo apt-get install ffmpeg
```

# 尋找 m3u8 連結

1. 開你既 Browser (我用 Firefox)。
2. 撳你鍵盤既 `F12` (Inspect)。
3. 之後撳 `Network`。
4. 再上 `Jable.tv`。
5. 搵你想下載既片，呢度我用既例子係 `https://jable.tv/videos/ipx-258-c/`。
6. 喺 Filter URLs 打 `m3u8` 極速搵條 link，當你成功搵到 m3u8 link 既時候，Copy 條 link：
`https://qto-sara.mushroomtrack.com/hls/lZV1tlFoDmHKmafcXbv3BA/1656584219/0/108/108.m3u8`，呢條就係我地要既Link。

>搵唔到 m3u8 link 可能係因為你做漏左步驟，撳 F5 Refresh 再試下 Play 條片就一定會搵到架啦。

![find](/blog/linux/linux-tools/FFMPEG/FFMPEG-download-jabletv-video/1.gif)

### 下載影片

當你見到 <code>[https @ 000001947ece8180] Opening 'https://qmm-truts.mushroomtrack.com/hls/NFb_sIwTdg3IZ6FeEFo9-g/1656586701/0/108/1082.ts' for reading</code> 呢啲野就代表已經讀取成功，開始下載緊。

```shell
ffmpeg -user_agent "Mozilla/5.0 (Macintosh; Intel Mac OS X 11_1_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36" -headers "referer: https://jable.tv/" -i "https://qmm-truts.mushroomtrack.com/hls/NFb_sIwTdg3IZ6FeEFo9-g/1656586701/0/108/108.m3u8" -c copy IPX-258.mp4
```

![find](/blog/linux/linux-tools/FFMPEG/FFMPEG-download-jabletv-video/downloaded.png)

### 注意

呢個等待既時候，你會見到多左個 files 叫 `IPX-258.mp4`，千奇唔好以為已經 downlaod 完，其實佢仲 download 緊，唔好中途冇拉拉閂左個 Windows (CMD)，咁會炒車搞到你要由頭再 down 過，又或者可能會喺 Download 到個個 time 既位完左條片。
當你等完之後，咁就搞掂哂啦，慢慢打你既 J 啦 hehe ~~


### 完整下載示範 (CAWD-091)
```bash
ffmpeg -user_agent "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:92.0) Gecko/20100101 Firefox/92.0" -headers "referer: https://jable.tv/" -i "https://record-smart.alonestreaming.com/hls/Jyz4bZStuyQzFk6168lSdA/1656587266/8000/8688/8688.m3u8" -c copy CAWD-091.mp4
```