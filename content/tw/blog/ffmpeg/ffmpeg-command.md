---
author: "VBoo"
title: "FFMPEG 實用指令"
tags: ["ffmpeg"]
date: 2021-12-11T03:44:40+0800
description: "本文章說明 FFMPEG 的實用指令"
thumbnail: https://blogx.ch/wp-content/uploads/2018/08/ffmpeg_logo.jpg
---

# FFMPEG
FFmpeg 是處理多媒體內容（例如音頻、視頻、字幕和相關元數據）的庫和工具的集合。

## Libraries

* `libavcodec` 提供了更廣泛的編解碼器的實現。
* `libavformat` 實現流協議、容器格式和基本 I/O 訪問。
* `libavutil` 包括散列器、解壓縮器和其他實用功能。
* `libavfilter` 提供了通過連接過濾器的有向圖來改變解碼的音頻和視頻的方法。
* `libavdevice` 提供了訪問捕獲和播放設備的抽象。
* `libswresample` 實現音頻混合和重採樣例程。
* `libswscale` 實現顏色轉換和縮放例程。

## 工具

* [ffmpeg](https://ffmpeg.org/ffmpeg.html) 是一個命令行工具箱操作、轉換和流式傳輸多媒體內容。
* [ffplay](https://ffmpeg.org/ffplay.html) 是一個簡約的多媒體播放器。
* [ffprobe](https://ffmpeg.org/ffprobe.html) 是一個簡單的檢查分析工具多媒體內容。

# 合成媒體指令

## 影片和音樂合成並重新編碼

將影片和音樂合成，並重新編碼一次。

```shell
ffmpeg -i video.mp4 -i audio.wav -c:v copy -c:a aac output.mp4
```

## 影片和音樂複製而不重新編碼

這裡會將影片和音樂合成，但是不會重新編碼一次。

```shell
ffmpeg -i video.mp4 -i audio.wav -c copy output.mkv
```

# 替換影片內的音樂

將你原本的音樂變成你想要的音樂，影片不會換掉。

```shell
ffmpeg -i video.mp4 -i audio.wav -c:v copy -c:a aac -map 0:v:0 -map 1:a:0 output.mp4
```

# 下載媒體指令

以下是有關下載媒體的指令。

- `-i` 轉檔用

## 下載網路上的影片 (m3u8)

使用此方法可以下載大部分網路上經 `m3u8 HLS` 處理的影片。

>此方法只適用於未經處理的 <code>m3u8 檔案</code>

**格式 :**
```bash
ffmpeg -i [m3u8 link] -c copy [output name.mp4]
```

**完整示範 :**
```bash
ffmpeg -i file.m3u8 -c copy file.mp4
```

# 封面圖選項

以下指令可以將圖片放置到影片，並將他設定為封面圖片。

- [input video] // 輸入你要加入封面圖的影片檔名
- [input image] // 輸入你要加入至影片封面圖的圖片檔名
- [added_cover_video] // 輸入兩者合成後的影片檔名 (輸出檔名)

```shell
ffmpeg.exe -i [input video] -i [input image] -map 1 -map 0 -acodec copy -vcodec copy [added_cover_video]
```

**例子 :**
```shell
ffmpeg.exe -i "IPX-404.mp4" -i "IPX-404.jpg' -map 1 -map 0  -acodec copy -vcodec copy "cover_IPX_404.mp4"
```

# Screenshot

以下是有關 Screenshot 影片內的指令。

我們需要使用兩個指令 :
- `-ss` [HH:MM:SS:MILLISECONDS] // 代表 seek，意思是尋找要進行 Screenshot 的位置，然後在後面輸入參數 [HH:MM:SS:MILLISECONDS]。
- `-frames:v` [NUMBER] // Screenshot 多小個數量。


## Screenshot 格式

以下指令說明 :

- `-i` inputvideo.mp4 (你要 Screenshot 的檔案)
- `-ss` 00:00:10 (影片內你要 Screensoht 的秒數)
- `-frames:v` 1 (輸出圖片數量)
- `sc.jpg` (輸出檔案名稱)

### 輸出一張圖片

將 <code>inputvideo.mp4</code> 的第 10 秒鐘 Screenshot，然後只輸出一張圖片，並將輸出檔案名稱改為 <code>sc.jpg</code>。

>如果是這樣的格式 <code>-frames:v 1 sc.jpg</code> 那麼就算你將 <code>-frames:v 1</code> 改為 <code>-frames:v 50</code> 也是沒有反應。

```shell
ffmpeg -i inputvideo.mp4 -ss 00:00:10 -frames:v 1 sc.jpg
```

![op](../../../images/Linux/Linux%20Tools/ffmpeg/ffmpeg-command/op.png)

### 輸出多張圖片

此方法為輸出多個圖片，因為要輸出多張圖片, 我們需要更改指令上的 `output` 讓它自動格式化輸出的檔案名稱。

以下指令說明 :

- `-i` inputvideo.mp4 (你要 Screenshot 的檔案)
- `-ss` 00:00:10 (影片內你要 Screensoht 的秒數)
- `-frames:v` 50 (輸出圖片數量)
- `sc_%3d.jpg` (輸出檔案名稱)

<div class="note info flat">
    說明：由影片 <code>inputvideo.mp4</code> 播放第 10 秒時開始截取之後的 50 個影格 (<code>-frames:v 50</code>) , 輸出共 50 張圖片。
</div>

```shell
ffmpeg -i inputvideo.mp4 -ss 00:00:10 -frames:v 50 sc_%3d.jpg
```

##### %d 說明**

這個是有關 Programming 的語法。

##### %d 0 位數**
我以上述指令來說明，你可以只輸入 %d，
得出來的結果是這樣 :  `1,2,3,4,5,6,7,8,9,10,10,11`。

##### %d 3 位數**

如果你輸入 %3d，那麼就代表會將檔案名稱預設會輸入 3 位數，
得出來的結果是這樣 : `001,002,003,004,005,006,007,008,009,010`。

##### %d 4 位數**
所以如果是輸入 %4d，
得出來的結果是這樣 : `0001,0002,0003,0004,0005,0006,0007,0008,0009,0010`。

# Reference

- https://superuser.com/questions/277642/how-to-merge-audio-and-video-file-in-ffmpeg
- https://itectec.com/superuser/how-to-merge-audio-and-video-file-in-ffmpeg/
- https://ottverse.com/thumbnails-screenshots-using-ffmpeg/
- https://stackoverflow.com/questions/35526253/how-do-i-add-a-cover-image-to-a-mp4-file-with-ffmpeg
- https://stackoverflow.com/questions/54717175/how-do-i-add-a-custom-thumbnail-to-a-mp4-file-using-ffmpeg
- https://stackoverflow.com/questions/14423647/ffmpeg-remove-cover-picture-from-mp3-convert-to-ogg-without-cover