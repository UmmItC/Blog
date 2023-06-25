---
author: "VBoo"
title: "使用 yt-dlp 下載影片或音樂"
description: "yt-dlp 是一款主要下載影片的工具。本文章會說明 yt-dlp 一些常用的參數和使用示範。"
tags: ["youtube-dl", "yt-dlp"]
date: 2021-12-11T02:15:01+0800
thumbnail: https://raw.githubusercontent.com/yt-dlp/yt-dlp/master/.github/banner.svg
---

<img alt="yt-dlp" src="https://raw.githubusercontent.com/yt-dlp/yt-dlp/master/.github/banner.svg" width="auto"/>

# yt-dlp <i class="fa-brands fa-youtube"></i>

yt-dlp 其實是 youtube-dl 的 fork 版本，而 youtube-dl 是官方版本，但似乎 youtube-dl 的作者已經不再製作了。因此我建議使用 yt-dlp，有一個長期的 long-maintain。而本文章全部主力集中於 yt-dlp，因為 yt-dlp 用到的 youtube-dl 也用到。

---

# 1. 下載 yt-dlp <i class="fa-brands fa-youtube"></i>

以下會說明使用 `curl` 或者 `wget` 的下載方法，轉自作者。

<div class="note warning flat">
    注意 : 如果要用 youtube-dl 轉檔功能，你需要裝 <a href="https://www.ffmpeg.org/">FFmpeg</a>。</br>
    安裝方法只需將 <code>FFMPEG</code> 放在和 <code>youtube-dl</code> 同一個資料夾內就能偵查到 <code>FFMPEG</code>。
</div>

---

## 使用 Curl 下載

<div class="note warning flat">
    此方法只適用於你部機本身有裝 <code>curl</code> 工具。
</div>

```shell
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
```

## 使用 wget 下載

<div class="note warning flat">
    此方法只適用於你部機本身有裝 <code>wget</code> 工具。
</div>

```shell
sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
```

## Linux Package Manager 下載

### <i class="fa-brands fa-linux"></i> APT-GET

<div class="note info flat">
    適用於 : Debian, Ubuntu, Linux mint, Pop_OS 等有使用 <code>APT</code> 套裝管理員的系統。
</div>

```shell
sudo apt-get install yt-dlp -y
```

### <i class="fa-brands fa-apple"></i> MacOS

<div class="note info flat">
    適用於 : MacOS
</div>

```shell
sudo brew install yt-dlp -y
```

### <i class="fa-brands fa-linux"></i> Pacman

<div class="note info flat">
    適用於 : Arch Linux,Manjaro,EndeavourOs
</div>

```shell
sudo pacman -S yt-dlp
```

### <i class="fa-brands fa-fedora"></i> Fedora

<div class="note info flat">
    適用於 : Fedora
</div>

```shell
sudo dnf install yt-dlp
```

### <i class="fa-brands fa-python"></i> python pip

<div class="note info flat">
    適用於 : 有安裝 python pip 的系統
</div>

```shell
pip install yt-dlp
```

# 2. 更新 yt-dlp

當某網站更新後，有可能會下載失敗，此時可以嘗試將 `yt-dlp` 更新後再重複輸入指令嘗試下載。

> 此方法只適用於非 Package manager 下載的方法。使用 Package manager 的話你要使用 Package manager 更新 yt-dlp。

```shell
yt-dlp -U
```

## 2.1 檢查 yt-dlp 版本

此指令用來查看目前的 `yt-dlp` 版本。

```shell
yt-dlp --version
```

## 格式選擇

此方法為列出影片有的畫質，音質等資料。

>說明 : 以數字來作準是最準確，有時候 <code>yt-dlp</code> 可能有 bug，即使預設選項下載為最高畫質，但下載後有可能是低畫質，所以指定數字是最準確的下載方法。

### 列出所有格式的號碼
```shell
yt-dlp -F [link]
```

**例子 :**
```shell
yt-dlp -F https://www.youtube.com/watch?v=QW28YKqdxe0
```

## 合併音樂和影片

此方法為指定下載你想要的畫質，音質等。

>說明 : 在 <ocde>yt-dlp</code> 內，下載 youtube 影片格式數字 <code>248+251</code> 是最高畫質和音質。

```shell
yt-dlp -f 248+251 [link]
```

**例子:**
```shell
yt-dlp -f 248+251 https://www.youtube.com/watch?v=QW28YKqdxe0
```


## 字幕選擇

此選項為下載影片內有的字幕檔案 (如果有的話)。

>說明 : 假設影片沒有字幕檔在內，在 Terminal 當中只是會出現警告，並不會影響你的下載。


### 列出存在的字幕語言檔

此方法為列出影片內存在的字幕名稱。

```shell
yt-dlp --list-subs [link]
```

**例子 :**

```shell
yt-dlp --list-sub https://www.youtube.com/watch?v=QW28YKqdxe0
```

### 下載字幕檔和插入繁體中文字幕

假設影片存在繁體中文字幕，此示範會將字幕檔案插入在影片內變成一個外掛字幕，
再使用相應的 Media Player 播放器，例如 [VLC Player](https://www.videolan.org/)，其後在 subtitle 選項中開關外掛字幕。

```shell
yt-dlp --write-sub --embed-sub --sub-lang zh-tw [link]
```

**例子 :**

```shell
yt-dlp --write-sub --embed-sub --sub-lang zh-tw https://www.youtube.com/watch?v=_5pnCgRtcfM
```

### 下載所有語言的字幕並插入影片內

此示範會將影片連結內存在的字幕檔案插入在影片內變成外掛字幕，
再使用相應的 Media Player 播放器，例如 [VLC Player](https://www.videolan.org/)，其後在 subtitle 選項中開關外掛字幕。

```shell
yt-dlp --write-sub --embed-sub --all-subs [link]
```

**例子 :**

```shell
yt-dlp --write-sub --embed-sub --all-subs https://www.youtube.com/watch?v=_5pnCgRtcfM
```

### 下載所有語言的字幕並插入影片內 (包括自動生產)

此方法適用於 youtube 網站，如果影片內有自動生產的字幕選項，使用這個指令就能下載自動生產的字幕檔並插入在影片內並生字外掛字幕。

```shell
yt-dlp --write-auto-sub --embed-sub --all-subs [link]
```

**例子 :**

```shell
yt-dlp --write-auto-sub --embed-sub --all-subs https://www.youtube.com/watch?v=_5pnCgRtcfM
```

## 下載音樂

下載音樂我們需要使用兩個指令，包括為：

- `-x, --extract-audio` // 取得音頻
- `--audio-format` [format]  // 取得指定音頻檔桿類型 eg: mp3, wav, m4a, aac

>注意 : 此功能需要安裝 <a href="https://www.ffmpeg.org/">FFmpeg</a> 才能使用，因為你會需要轉檔。安裝方法只需要將 yt-dlp 和 ffmpeg 放在同一個位置即可。

```shell
yt-dlp --extract-audio --audio-format [audio format] [link]
```

**例子 :**

此示範會將影片轉為 `mp3` 檔案，當然如果你想要的檔案為 `wav`，那麼你只需將 `mp3` 改為 `wav`。

```shell
yt-dlp --extract-audio --audio-format mp3 https://www.youtube.com/watch?v=WJxSNbAer9M
```

## 封面圖 Thumbnail

下載封面 Cover 圖片，我們會需要使用以下的指令：

- `--embed-thumbnail` // 放置封面圖
- `--add-metadata`  // 加入封面圖
- `--write-thumbnail` // 下載封面圖

>注意：有些影片檔不支援封面圖，例如 `webm` 檔案。

### 下載影片和放置封面圖

>操作流程：下載影片封面圖後，再進行下載影片，影片下載完成後，再將下載的封面圖放置到影片內，然後將下載回來的封面圖刪除。

```shell
yt-dlp --embed-thumbnail --add-metadata [link]
```

**例子:**
```shell
yt-dlp --embed-thumbnail --add-metadata https://www.youtube.com/watch?v=WJxSNbAer9M
```

### 下載影片和封面圖

>說明：下載影片和封面圖，即是會下載兩個檔案。

```shell
yt-dlp --write-thumbnail --embed-thumbnail [link]
```

**例子:**
```shell
yt-dlp --write-thumbnail --embed-thumbnail https://www.youtube.com/watch?v=wxoo-PCM8No
```
### 下載影片封面圖

如果指定下載圖片，我們需要使用以下指令：

- `--skip-download` // 跳過影片下載

>說明 : 讀取條片，攞佢條片既封面圖但係唔下載條片，淨係下載封面圖。

```shell
yt-dlp --write-thumbnail --skip-download [link]
```

**例子:**
```shell
yt-dlp --write-thumbnail --skip-download https://www.youtube.com/watch?v=miu4FEKepjY
```

---

## 指定檔案格式

使用以下指令拍定檔案格式 (其實是轉檔功能)。

`-f` 或 `--format` // 指定格式 (mp4, flv, mkv, webm, mp3, aac, wav ... etc)

```shell
yt-dlp -f [format] [link]
```

**例子:**

>說明：將他下載為 mp4 檔案。

```shell
yt-dlp -f mp4 https://www.youtube.com/watch?v=WJxSNbAer9M
```

## 清單選項
- --playlist-start [NUMBER] 指定起點
- --playlist-end [NUMBER] 指定終點
- --playlist-items [NUMBER] 指定清單
- --max-downloads [NUMBER] 拍定最多下載數量

### 指定起點 (清單)

```shell
yt-dlp --playlist-start [number] [playlist-url]
```

**例子:**

第三條片開始下載到最後個條片

>注意 : 如果不輸入 <code>--playlist-end</code> 即是預設會幫你下載到最後的影片。

```shell
yt-dlp --playlist-start 3 https://www.youtube.com/playlist?list=PL9K3xwFkFqWGEVTB3QNRQ1wgxF6Y-DMOX
```

### 指定終點 (清單)

```shell
yt-dlp --playlist-end [number] [playlist-url]
```

**例子:**
第一條片開始下載到第二條片並轉為 `mp4` 檔

>注意 : 如果不輸入 <code>--playlist-start</code> 即是預設會幫你由第一條片下載到你指定的數字。 (10)

```shell
yt-dlp --playlist-end 10 https://www.youtube.com/playlist?list=PL9K3xwFkFqWGEVTB3QNRQ1wgxF6Y-DMOX
```

### 指定清單起點和終點 (清單)

第 4 條片下載到第 10 條片。
```shell
yt-dlp --playlist-start 4 --playlist-end 10 <playlist-url>
```

**例子:**
```shell
yt-dlp --playlist-start 4 --playlist-end 10 https://www.youtube.com/playlist?list=PL9K3xwFkFqWGEVTB3QNRQ1wgxF6Y-DMOX
```

### 指定清單下載
`--playlist-items` 呢個指令係用黎下載你想下載呢條 playlist 既邊條片。

```shell
yt-dlp --playlist-items [NUMBER] [link] 
```

**例子 :**

淨係下載數字 71,83 同埋第一條片。

```shell
yt-dlp --playlist-items 71,83,1
```


### 清單下載數量限制

`--max-downloads` // 用呢個指令就將你下載既片淨係下載喺你既最大上限既數字。

```shell
yt-dlp --max-downloads [number] [link]
```

**例子 :**
限制下載 Playlist 最大上限只有 50 條片。

>簡單黎講，即係唔洗打 <code>--playlist-end 50</code>。</br>
變成打呢個既話，咁得出黎既結果就係下載 1-50 既片。

```shell
yt-dlp --max-downloads 50 https://www.youtube.com/playlist?list=PL9K3xwFkFqWGEVTB3QNRQ1wgxF6Y-DMOX
```

### 轉換格式

要轉換格式，我們需要使用以下選項：

`-f, --format` // 轉換格式


```shell
yt-dlp -f [format name] [link] #方法一
yt-dlp --format [format name] [link] #方法二
```

**例子:**

將影片轉換為 mp4
```shell
yt-dlp -f mp4 https://www.youtube.com/playlist?list=PL9K3xwFkFqWGEVTB3QNRQ1wgxF6Y-DMOX #方法一
yt-dlp --format mp4 https://www.youtube.com/playlist?list=PL9K3xwFkFqWGEVTB3QNRQ1wgxF6Y-DMOX #方法二
```

---

## 輸出檔名

我們預設下載的檔案名稱為影片的 `title`，如果要改變，我們需要使用以下的選項改變：

`-o, --output` // 指定檔名輸出名稱

>yt-dlp 預設下載的檔名格式為：<code>%(title)s-%(id)s.%(ext)s</code>。

```shell
yt-dlp -o [change_name] [link]
```

**例子:**

將輸出影片名稱名為 `Hi.mp4`

```shell
yt-dlp -o "Hi.mp4" https://www.youtube.com/watch?v=rkVezCGQ22s
```

### 檔名 ID 去除

如果你只想要 `title` 的名稱，而又不想要 `ID` 的名稱你可以這樣做。

```shell
yt-dlp -o '%(title)s.%(ext)s' [link]
```

**例子:**

下載完成後檔案名稱為 `《食戟之靈 餐之皿》#11 (繁中字幕 _ 日語原聲)【Ani-One】-z6ptMZEj8pA.webm`。

```shell
yt-dlp -o '%(title)s.%(ext)s' https://www.youtube.com/watch?v=rkVezCGQ22s
```

### 檔名只有 ID

`--id` 個檔名得返 youtube 既 id。

下載完成後檔案名稱會是：`rkVezCGQ22s.webm`

```shell
yt-dlp --id https://www.youtube.com/watch?v=rkVezCGQ22s
```

---

## 登入選擇

此方法為下載你的私人影片 (需要登入的影片)。

- `-u, --username`
- `-p, --password`

```shell
yt-dlp -u [username] -p [password] [link]
yt-dlp --username [username] --password [password] [link]
```

**例子:**
```shell
yt-dlp -u 'username@gmail.com' -p 'password' https://www.youtube.com/watch?v=rkVezCGQ22s
yt-dlp --username 'username@gmail.com' --password 'password' https://www.youtube.com/watch?v=rkVezCGQ22s
```

---

## 網路指令

以下指令可以更改你網路的位置或指定 `protocol`。

### 更改 Proxy 下載

使用指定的 Proxy 位置連線至網站再下載。

Proxy 位置可到這網站找 : https://vpnoverview.com/privacy/anonymous-browsing/free-proxy-servers/

>注意 : 通常也不需要使用這指令，因為速度不太理想，會用的情況通常是想突破地區限制的影片。

```shell
yt-dlp --proxy [IP] [link]
```

**例子:**
```shell
yt-dlp --proxy 51.254.69.243 https://www.youtube.com/watch?v=rkVezCGQ22s
```

---

## 指定使用 IPV4 連線

使用以下指令限制使用連線 `ipv4`。 

`-4, --force-ipv4` // 將所有連線轉為 IPV4。

```shell
yt-dlp -4 [link]
yt-dlp --force-ipv4 [link]
```

**例子**
```shell
yt-dlp -4 https://www.youtube.com/watch?v=rkVezCGQ22s
yt-dlp --force-ipv4 https://www.youtube.com/watch?v=rkVezCGQ22s
```


## 指定使用 IPV6 連線

使用以下指令限制使用連線 `ipv6`。 

`-6, --force-ipv6` // 將所有連線轉為 IPV6。

```shell
yt-dlp -6 [link]
yt-dlp --force-ipv6 [link]
```

**例子**
```shell
yt-dlp -6 https://www.youtube.com/watch?v=rkVezCGQ22s
yt-dlp --force-ipv6 https://www.youtube.com/watch?v=rkVezCGQ22s
```

## 使用其他 IP 連線

`--source-address [IP]` 將所有連線改變至這 IP 位置。

```shell
yt-dlp --source-address [IP]
```

**例子**
```shell
yt-dlp --source-address 123.123.123.123
```

---

## 讀取文字檔連結

有時候你想將成個 Bookmarks 既 youtube 片下載，但係又唔想慢慢打 link 既時候，
你就可以起個 txt 檔案，然後再將 d link 擺入去 (每一行一條 link)。

要用呢個方法下載所有連結，我地只需要使用 `-a` 選項，以下示範 ~~


### 第一步 (建立文字檔)
起個 `txt 檔`，將個 file 名改做你想改既名 (我用 `link.txt` 做示範)，入面既內容就咁樣打 :

```
https://www.youtube.com/watch?v=gKn3xeli7vs
https://www.youtube.com/watch?v=DF3VumNX474
https://www.youtube.com/watch?v=2qUc2YZJWdM
```

### 第二步 (下載)

使用 `-a` 指令讀取 `link.txt` 內的連結並進行下載。

```shell
yt-dlp -a link.txt
```

## 改變下載速度

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


# 文章更新

以上就是我覺得很實用的指令，本文篇會不定期更新，更新日期為：

- 2022-06-19 (改至更詳細)
- 2022-06-30 (修改內文至更易明白)
- 2023-06-25 (重新整理所有內容)