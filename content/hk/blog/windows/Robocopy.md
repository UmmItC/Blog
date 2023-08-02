---
author: "Arcsly"
title: "Robocopy 實用指令說明"
description: "講解 Robocopy 所有實用指令。"
tags: ["Windows", "robocopy"]
date: 2022-06-02T14:40:50+0800
thumbnail: https://images.unsplash.com/photo-1530133532239-eda6f53fcf0f?ixlib=rb-4.0.3
---

# RoboCopy

RoboCopy 係一個多線程既檔案管理功具，意味著會比起你 <kbd>Ctrl</kbd>+<kbd>C</kbd> <kbd>Ctrl</kbd>+<kbd>V</kbd> 快幾倍。


# 假設情況

當你管理超多 Files 既時候，你又想將佢分類，整理，Backup，但係入面有好多唔需要既檔案。
你要選擇性咁拉佢出黎 Backup，呢個操作哂你好多時間，呢個時候可以用 RoboCopy，以下講解。


# 指令說明

---

## 格式
```bat
robocopy <你想入去既位置> <你要擺檔案既位置> "你要擺乜檔案" "Argument"
```

## 示範 (最基本)

最基本既 Argument (無任何 Argument)

- 入去 "Server" 呢個位置 - "Server"
- 將 "Server" 入面既所有野擺入 "assets/yoyo" - "Server assets/yoyo"
- 放既檔案只會包括 png 檔案 - "*.png"

```bat
robocopy Server "Server assets/yoyo" *.png
```

## 示範 (Argument 加入)

Argument 示範

- Server (入去 "Server" 呢個位置)
- "Server assets/yoyo" (將野擺入 "Server assets/yoyo" 呢個位置入面)
- *.png (將所有副檔係 png 既檔案擺入 "Server assets/yoyo")
- /PURGE (即係會跟返你要求既來源檔既所有野都係一樣)
- /S (將 Folder 複製)

```bat
robocopy Server "Server assets/yoyo" *.png /PURGE /S
```

## 進入其他 Disks

成句意思係，入去 d drive，再入去 d drive 入面既 folder1，入到去再將所有 html files types，擺入去 e drive 入面既 folder2。

- d:folder1 (入 d drive 既 folder1)
- e:folder2 (將檔案擺入 e drive 既 folder2)
- *.html (指定淨係要 html files types)

```bat
robocopy d:folder1 e:folder2 *.html
```


# 實用參數
---

## Folder 參數

- /XD (排除 Folder)
- /PURGE (會跟返你要求既來源檔既所有野都係一樣)
- /S (Folder 複製，唔加就唔會 copy Folder，淨係 copy files)
- /MOVE (移動 Folder 同 files)
- /E 複製空既 Folder

## Files 參數

- /XF (排除 files)
- /PURGE (會跟返你要求既來源檔既所有野都係一樣)
- /MOV (移動 files)
- /MOVE (移動 Folder 同 files)

# Reference
- http://www.happystreet.com.tw/index.php/system-dynamic-teaching/windows/247-examples-robocopy-command-reference-mir-many-problems-with-care-1