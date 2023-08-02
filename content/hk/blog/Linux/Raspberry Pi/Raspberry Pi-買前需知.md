---
author: "Arcsly"
title: "Raspberry Pi 買前需知及說明"
description: "呢篇文會同你講我本人對 Raspberry 既用後感，應唔應該買? 如果要買要準備啲乜?"
tags: ["Raspberry Pi", "Linux", "Hardware"]
date: 2023-01-24T20:52:00+0800
thumbnail: https://images.wondershare.com/recoverit/article/2020/08/format-sd-card-raspberry-pi-0.jpg
---

# 咩係 Raspberry Pi ?

簡單黎講，你可以當係一部小型電腦，但係只係可以行到部分既 linux distro。

## Raspberry Pi 優缺點

1. 體積細 (除左細冇其他優點)

其實除左佢係真係好細舊之外真係好似冇咩優點 ... 因為如果你話個價錢既話，講返而加既市價都已經俾人炒到千幾蚊一隻。咁買已經係唔抵，講返佢原價只係 35 蚊美金起，炒到成千蚊已經係唔可以話係抵。所以真係得個細舊係優點 ...

仲有就係基本上已經斷哂貨，係好難買到，就算搵到都係要食炒價先買到 ...

## Raspberry Pi Port

以下所有野都以 Raspberry Pi Model B 黎做例子, 佢係有以下既 Port：

- Micro HDMI Port x2
- Power Port x1
- Ethernet Port x1
- 耳機 Port x1
- USB 2.0 x2
- USB 3.0 x2
- Micro SD Card Port x1

## 咁細部電腦可以用黎做乜 ?

其實佢同一部普通既電腦冇分別，你可以拎黎當日常做野都冇問題。不過啲人通常都係拎黎做 Hosting，叫做一部平平地既電腦。

![distro](https://hackster.imgix.net/uploads/attachments/1381275/image_nZIpjonlUU.png?auto=compress%2Cformat)

# 買前需知

買完呢部機之後你仲需要幾樣野，因為佢同而加呢個年代既電腦有啲唔同，例如佢既 Port 係需要用 Type-C, Mon 係要 Micro HDMI, SD Card 係 run os.

- [Power Supply](#1-power-supply---用黎俾電部機)
- [Micro SD Card](#2-micro-sd-card---用黎裝你個-os-同-run-個-os)
- [Keyboard, Mouse](#3-keyboard-mouse---打字同-control-mouse)
- [Micro HDMI cable (駁 Mon 用)](#4-micro-hdmi-cable---駁-mon-用)
- [對硬件，Linux 要有一定程度既認識](#5-對硬件linux-要有一定程度既認識)

## 1. Power Supply - 用黎俾電部機

**Raspberry Pi 既 Power supply port 係用緊 Type-C, 你可以用你平時手機 Android 叉電個條線黎俾電 Raspberry Pi**，但係通常黎講，如果咁樣做條線多數唔夠長，變相就唔係好方便，所以我建議係買返官方提供既 Power Supply，咁就 Perfect 喇.

另外，其實如果你用你平時叉電既尿袋黎俾電部機其實都係 work 架，我已經試過，變相即係話你可以喺條街度用XD，但係就另一個問題，你點都最起碼要有 Keyboard 打到字，有 Mon 睇到畫面先得 -.-

![power-supply](https://raspberrypi.dk/wp-content/uploads/2019/06/usb-c-stroemforsyning-raspberry-pi-eu-5v-3a.jpg)

## 2. Micro SD Card - 用黎裝你個 OS 同 Run 個 OS

當初我用個陣係諗住打算會唔會可以用 USB Bootable 咁行部機，但係我試完發現係行唔到，Raspberry Pi 本身係有個位置俾你放你既 Micro SD Card 入去，所以你需要買張 Micro SD Card 去擺入去，用呢張 Micro SD Card 黎裝你既 OS, 當你裝完之後，呢張 Micro SD Card 就係成個 OS黎。

因為你要裝個系純入去，但係一隻全身既 Micro SD Card 入面係唔會有野喺入面，你需要將 Micro SD Card read 入去另一部電腦入面，再下載返你想用既 distro image,如果有提供 image 既話，咁就只需要直接下載佢官方提供既 Raspberry Pi imager，再用佢呢個程式將你呢個 image 檔直接 write 入去你張 Micro SD Card.

但係因為本身電腦唔係部部都有一個可以俾你 read 到 Micro SD Card 既 Port，所以你係需要買一個 **Adapter** 先可以 read 到你張 Micro SD Card.

> 建議：直接買個有 Micro SD Card 既 USB Hub.

![sd-card](https://www.easyshoppi.com/wp-content/uploads/2019/11/vvv2.jpg)

## 3. Keyboard, Mouse - 打字同 control mouse

mouse 就可以唔一定要，主要係你一定要有 keyboard. 唔係你就打唔到字 ~

![keyboard-mouse](https://hocotech.com/wp-content/uploads/2022/02/hoco-gm12-light-and-shadow-rgb-gaming-keyboard-mouse-set-english.jpg)

## 4. Micro HDMI Cable - 駁 Mon 用

你平時用電腦駁 mon 個條 HDMI 線係唔得架，你需要買條係 Micro HDMI Cable 線插落去先得，如果冇就要買 Micro HDMI Adapter.

![mirco-hdmi-cable](https://www.bhphotovideo.com/images/images2500x2500/Pearstone_hdd_1015_High_Speed_HDMI_to_Micro_888043.jpg)

## 5. 對硬件，Linux 要有一定程度既認識

其實 Raspberry Pi 等同於一部電腦，而佢可以裝既 OS 基本上係得 Linux。然後裝既 Linux distro 係要似乎返佢有冇提供一個 image 俾你裝入去，如果唔係就裝唔到。你係需要睇返你想裝既 distro 係咪有你想要既 Raspberry Pi ，如果冇就裝唔到。

另外，你起碼要識得啲 Port 頭係點分，例如 Ethernet port, USB-A, USB-C 係邊個 Port.

>提示：熟用 Linux command ~

![linux-distro](https://149366088.v2.pressablecdn.com/wp-content/uploads/2020/01/distro-board.jpg)

# 總結 - 用後感

買唔買好? 基本上我覺得係睇你需求，如果你平時係需要 Host 野，咁又唔想買多部機，又想買部千幾蚊既電腦拎黎做 Hosting 既話我會建議你買，如果唔係就唔好手痕買啦。千幾蚊買個靚啲既 monitor 我覺得會仲實際 - -

因為講真呢部機既性能一定係差，極其量只可以拎黎 Host 野，睇下片咁 ... 我自已試過拎黎裝 Raspberry Pi official image 入去試用下，發現都真係幾 lag，係講緊郁 mouse 個陣都係 lag 下 lag 下咁郁。