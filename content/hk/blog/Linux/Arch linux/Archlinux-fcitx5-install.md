---
author: "Arcsly"
title: "Arch Linux 安裝 fcitx5 速成輸入法 - Quick Classic"
description: "於 Arch linux 內安裝中文輸入法 Fcitx5 並配置 速成 Classic."
tags: ["Arch Linux", "Fcitx", "KDE"]
date: 2022-12-17T02:57:50+08:00
thumbnail: /blog/linux/Archlinux-fcitx5-install/fix_ed_fontfaimly.png
---

# Fctix5

Fcitx5 is an input method framework with a lightweight core, offering additional language support via addons. It is the successor to Fcitx. 

# 中文輸入法

喺 linux 入面有好多唔同款既中文輸入法工具：

- ibus
- Rime
- fcitx

而今次我會講解點裝 **fcitx5**

# Fcitx5 安裝

如果要係 Arch Linux 打到中文，我地需要裝一個叫做 **fxitx5** 既中文輸入法工具，輸入以下呢句指令安裝

```shell
sudo pacman -S fcitx5-chinese-addons libime fcitx5 fcitx5-table-extra
```

![fcitx5 install](/blog/linux/Archlinux-fcitx5-install/fxitx5%20install.png)


## KDE Support

如果你係用緊 KDE 既話 你需要裝埋呢樣

You're currently running KDE, but KCModule for fcitx couldn't be found, the package name of this KCModule is usually kcm-fcitx or kde-config-fcitx. Now it will open config directory.

```shell
sudo pacman -S kcm-fcitx5
```

![fcitx5 install](/blog/linux/Archlinux-fcitx5-install/kcm%20install.png)

## Support Program Windows

因為每個程式行緊既 Windwos 所用既技術都係唔一樣，
所以係要視乎返用緊咩程式，咁先可以係個個程式入面打到字，各自裝一個係 for 返佢打字- - QT
- GTK
- IM

```shell
sudo pacman -S fcitx5-qt fcitx5-gtk fcitx5-im
```

![fcitx5 install](/blog/linux/Archlinux-fcitx5-install/qt5%20gtk%20im%20support%20install.png)

## 新增 `~/.profile`

用 `nano` `~/.profile`

```shell
nano ~/.profile
```

### 複製內容

將以下呢段野 Paste 落去 (`Ctrl + Shift + V`)
```shell
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
```

![fcitx5 install](/blog/linux/Archlinux-fcitx5-install/profile%20edit.png)

## 新增 `/etc/environment/`

```shell
sudo nano /etc/environment/
```

將以下呢段野 Paste 落去 (`Ctrl + Shift + V`)

```shell
export GTK_IM_MODULE=fcitx
export XMODIFIERS=fcitx
export QT_IM_MODULE=fcitx
export SDL_IM_MODULE=fcitx
```

![fcitx5 install](/blog/linux/Archlinux-fcitx5-install/etc%20environment%20added.png)

## 新增輸入法

右下角打 search input method，將佢打開.

![add input type](/blog/linux/Archlinux-fcitx5-install/add_input_type.png)

### Add Input Method

右下角撳 `+ Add Input Method` -> 搵返你想打邊隻 -> 之後撳 `ADD`.

- 速成 = QuickClassic

![fcitx5 install](/blog/linux/Archlinux-fcitx5-install/add%20input%20type-2.png)

# Logout

最後完成哂以上既野就將部機 Logout.

![fcitx5 install](/blog/linux/Archlinux-fcitx5-install/logout.png)

## 檢查係咪已經 setup 好

打呢句指令睇下你有冇真係 set 好 config, 如果打完冇顯示野既話, 即係你 set 得唔岩, 如果打完有顯示 fcitx5, 咁你就成功左.

```shell
echo $GTK_IM_MODULE
```

# 字體問題

因為 Arch linux 本身係冇裝到中文字體，所以你係需要另外再裝，如果唔裝既話，咁你打字個陣會見到有啲字係會變左亂碼，好似下圖咁

![fcitx5 install](/blog/linux/Archlinux-fcitx5-install/font-family-error.png)

## 解決方法

直接係你部機裝一隻字體，咁樣問題就解決.

```shell
sudo pacman -S wqy-zenhei
```

![fcitx5 install](/blog/linux/Archlinux-fcitx5-install/install%20font-family%20fix.png)

之後重新 login 就可以見到啲字冇再亂碼啦！

![fcitx5 install](/blog/linux/Archlinux-fcitx5-install/fix_ed_fontfaimly.png)

# Reference

- https://wiki.archlinux.org/title/Localization/Simplified_Chinese?rdfrom=https%3A%2F%2Fwiki.archlinux.org%2Findex.php%3Ftitle%3DLocalization_%28%25E7%25AE%2580%25E4%25BD%2593%25E4%25B8%25AD%25E6%2596%2587%29%2FSimplified_Chinese_%28%25E7%25AE%2580%25E4%25BD%2593%25E4%25B8%25AD%25E6%2596%2587%29%26redirect%3Dno
- https://www.programmerall.com/article/6459746231/
- https://www.youtube.com/watch?v=yXSDJWtGeKY