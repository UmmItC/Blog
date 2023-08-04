---
author: "Arcsly"
title: "教你由零開始裝 Arch linux distro"
description: "教你點樣由零開始裝 Arch linux"
tags: ["Arch Linux"]
date: 2022-12-17T02:57:50+08:00
thumbnail: http://www.pixelstalk.net/wp-content/uploads/2016/10/Free-Arch-Linux-Image.png
---

# 要做啲乜 ?

呢段文會教你點樣裝 Arch linux 喺你部 `VM` 入面，由零教你點樣一步一步打指令安裝 Arch linux distro Opearting System，步驟有以下 (步驟不分先後)：

- ISO 下載
- ISO USB 燒錄
- 修改 BIOS 設置
- 啟動 Arch linux live
- Ping test network
- 割開幾舊 Partition (efi, root, home, swap)
- Genfstab file system table
- 安裝基本 Arch System
- Set languages
- Set hostname
- Set Host table
- Set timezone
- set user config, permission
- grub install, grub config
- DE Install (KDE)
- Service enable

# ISO 下載

- https://archlinux.org/download/

用上面條 link 搵最近你國家既 mirror 下載返個 iso.


# ISO USB 燒錄

首先我地需要一個可以將 `.iso` 整成一個可以 Bootable 既啟動器。

工具有幾款，可以跟返你而加用緊咩系純去決定。

- [balenaEtcher](https://www.balena.io/etcher/) (Mac, Linux, Windows Support)
- [Rufus](https://rufus.ie/en/) (Windows Only)
- [Pendrivelinux](https://www.pendrivelinux.com/) (Windows only, Support multi OS)

## 使用 DD 製作 Bootable USB

dd 係每一款 linux 機都會存在既工具，所以係唔需要特別再去裝多次，而加插左usb 先。

- if：打返 iso 檔既位置
- of：打返你 USB device 個 id
- status=progress：realtime print 睇到整到邊

```shell
dd if=/home/username/Downloads/archlinux.iso of=/dev/sdX status=progress
```

# Arch Linux Live Boot

當你整完一隻可以 Bootable 既 USB，Boot 到部機入去就可以繼續，呢度要視乎返你部機係用緊咩底版去決定你部機應該要撳乜先可以 Select 個 Boot options menu，我用自己部機黎做例子，係 `F9`。

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/boot-1.png)
![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/boot-2.png)

## Ping network - 測試網路連線

試下 Ping link 睇下有冇 Response,有 response 代表連到 network.

```shell
ping google.com
```

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/ping%20arch%20website.png)


# Check Booted UFFI

如果打完有出一大段野就確定係 UEFI Booted.

```shell
ls /sys/firmware/efi/efivars
```

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/verify%20efi.png)


# 建立 Partitions

呢一步我地需要起四個 Partitions：

- 一個係 for `grub`
- 一個係 for `root`
- 一個係 for `home normal user`
- 一個係 for `swap`

首先睇下你而加部機每個 Partitons 既名係 sd幾? (eg: sda)

```shell
lsblk
```
![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/lsblk.png)


我既 Target 係一隻 60GB 既 Partitions，你會見到 NAME 寫住 `sda`, TYPE 寫住 `disk`，用呢隻黎割上面四樣野出黎.

而加我會示範點樣用 `cfdisk` 去做分割。當然你可以用 `gdisk` 去做呢一步。但係佢比較圖形化啲。岩一啲無咁多 exp 既人去用 ~

1. 輸入以下指令後。

```shell
cfdisk /dev/sda
```

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/cfdisk%20gpt.png)

2. 打完你會見到以下既畫面，撳 `GPT`

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/gpt%20select.png)

3. 用鍵盤既方向鍵 `上下左右箭嘴` 控制，揀 `Free space`，下面個舊揀 `NEW`，之後佢會問你要起幾多 size，就咁樣跟住起：

- 500M (efi Grub) - Type : EFI System
- 30G (root) - Type : Linux filesystem
- 25G (home) - Type : Linux filesystem
- 4.5G (swap) - Type : Linux swap

> 以上既都係一啲示範用既 Size. 你唔需要全部跟我!!! **比較重要既野係 EFI 唔可以太小。如果唔係既話就會開唔到機。**

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/CREATE%20PARTITION%204.png)

4. 完成哂之後喺下面 select `Write` 寫入 Partition.

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/ARE%20YOU%20SURE%20WRITE%20PARTITION%3F.png)

5. 會問你真咪真係要寫入 partition, 你打 `YES`.

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/DONE%20PARTITION.png)

6. 搞掂會見到下面會出現藍色字寫住 `The partition table has benn altered.`

7. 用方向鍵指去 `Quit` quit `cfdisk`，之後你會見 `Syncing disks.`

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/Syncing%20disks.png)

## lsblk 確定 Partition

你會見到多左四個 Partiton, 咁就已經成功左.

- sda1 for efi system
- sda2 for home partition
- sda3 for root partition
- sda4 for swap partition

```shell
lsblk
```

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/confirm%20done%20partition.png)

### 格式化 Partitions

而加需要將呢四隻 Partitions 各格式化一次

#### Format EFI System partition (sda1)

EFI System 係只會 Support FAT32，打以下既指令格式化佢 ~

```shell
mkfs.fat -F32 /dev/sda1
```

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/format%20efi.png)


#### Format root partition (sda2)

home 同 root 一樣，都係用 ex4 format.

```shell
mkfs.ext4 /dev/sda2
```

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/format%20root.png)

#### Format home partition (sda3)

```shell
mkfs.ext4 /dev/sda3
```

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/format%20home.png)

#### Format swap partition (sda4)

swap 同 root & home 唔一樣，要改小小.

```shell
mkswap /dev/sda4
```

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/format%20swap.png)


#### Enable swap partition (sda4)

format 完我地仲需要將呢個 partition enable.

```shell
swapon /dev/sda4
```

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/swapon.png)

# mount root Partition (sda2)

而加要 mount root Partition, root partition 本身係已經有，所以只需要 mount 返個位置就得。

```shell
mount /dev/sda1 /mnt
```

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/mount%20root.png)

# mount home Partition (sda3)

而加要起一個 folder,之後 mount home partition,因為 home space 係需要你手動加.

```shell
mkdir /mnt/home #create home space.
mount /dev/sda3 /mnt/home
```

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/mount%20home.png)

# 安裝 Arch 基本系統

因為而加 Partition 入面係冇野，我地需要用 `pacstrap` 裝入 `/mnt`，會裝以下既野：

- base
- base-devel
- linux
- linux-lts
- linux-headers
- linux-firmware
- intel-ucode (似乎返你部機既底版係咪用緊 intel)
- amd-ucode (似乎返你部機既底版係咪用緊 amd)
- nano (text editor)
- neofetch (display this pc information)
- networkmanager (上網要用)
- dhcpcd （上網要用)
- pulseaudio (聲音要用)
- pipewire (聲音要用)

```shell
pacstrap -i /mnt base base-devel linux linux-lts linux-headers linux-firmware intel-ucode nano neofetch networkmanager dhcpcd pulseaudio
```

>注意：裝個陣佢可能會彈啲野問你想裝邊個，直接 enter 用 default 就可以，然後等佢裝哂.

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/install%20base%20system.png)

安裝完成.

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/base%20system%20install%20complete.png)


# Generate file system table (FSTAB)

Table 係你部機既 files system. 然後自動 Gen 返你頭先 Mount 完既 path.

```shell
genfstab -U /mnt >> /mnt/etc/fstab
```

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/genfstab%20-U.png)

# CHRooting Arch system

將而加呢個 termial session 轉去你已經裝好左 Arch System.

```shell
arch-chroot /mnt
```

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/arch-chroot.png)

## 修改 Root password

直接打你想用既 root password,呢個密碼就係你之後可以登入既 root password.

```shell
passwd
```

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/passwd.png)

## 新增新用戶 & 密碼

起一個新既 normal user, 因為一定唔會用 root 做哂所有野，係 secutiry 角度黎講太危險，所以我地起一個 user 係 for 你平時登入用電腦個陣.

```shell
useradd -m <username>
```

俾個密碼新 user

```shell
passwd <username>
```

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/useradd%26passwd.png)

## 金魚腦用戶

如果你係咁快唔記得左你個 `username` 係乜既話，打返以下呢句野睇返，最底就係你岩岩起左既 `username`

```shell
getent passwd
```

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/getent%20passwd.png)

### Add Permission to 新用戶

- wheel: allow user access root / any commands 

```shell
usermod -aG wheel,storage,power <username>
```

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/usermod.png)

## sudoers.tmp 修改

打完頭先個句野之後我地仲要 edit 一個 file，咁先可以真係成功改到，打下面個句 command 之後 scroll down 落去搵 `%wheel ALL=(ALL:ALL) ALL` 將前面個 `#` 剷左佢.

```shell
EDITOR=nano visudo #Default 會識自動 run 去 /etc/sudoers.tmp
```

再係佢下面打一句

```shell
Defaults timestamp_timeout=0
```

之後就可以 Quit.

- for save: Ctrl + S
- for quit: Ctrl + X

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/sudoers.tmp.png)

# 設置系統語言 - 修改 `locale.gen`

而加我地要改我地部機既 System langagues,我會將佢將做 UTF-8 English.
改完就同上面一樣，因為用緊 `nano` 所以 hotkey 都係一樣.

搵 `en_US.UTF-8 UTF-8` 將 `#` 剷走佢.

- for save: Ctrl + S
- for quit: Ctrl + X

```shell
nano /etc/locale.gen
```

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/nano%20locale.gen.png)

## 設置系紜語言 - 產生語言

我地岩岩改完係仲未work架，仲需要 gen 返出黎.

```shell
locale-gen
```

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/locale-gen.png)

## 設置系統語言 - 建立語言 config 檔案

```shell
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
```

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/config%20lang.png)

# Hostname 設置

```shell
echo Archlinux > /etc/hostname
```

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/hostname.png)

## Host table 新增內容

```shell
nano /etc/hosts
```

加呢三行野.

```shell
127.0.0.1       localhost
::1             localhost.localdomain
127.0.0.1       localhost
```

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/hosts.png)

# Timezone 新增,更新硬件時間

```shell
ln -sf /usr/share/zoneinfo/Asia/Hong_Kong /etc/localtime
hwclock -w
```

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/timezone.png)

# EFI System 安裝 Grub Boot

差唔多完成哂安裝啦，就係差 grub menu ~

打以下呢句野裝 grub, efibootmgr

> 其他：os-prober 既作用係用黎 detect 你呢部機有冇其他 OS，但係因為我地呢個 case 係得一個 os，所以唔需要裝呢舊.

```shell
pacman -S grub efibootmgr
```

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/grub%20efibootmgr.png)


## 起 folder for efi boot

而加要起一個 folder，再 mount 呢個 folder, 之後裝去呢個 folder 入面.

```shell
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
```

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/mount%20boot%20efi.png)

## grub-install set bios type, set install paths

```shell
grub-install --target=x86_64-efi --efi-directory=/boot/efi
```

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/grub-install.png)

## grub-mkconfig

```shell
grub-mkconfig -o /boot/grub/grub.cfg
```

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/grub-mkconfig.png)

# Enable 上網 Service

如果你成功跟到呢一步，你己經成功整好左 80% 既野，你只係差未裝 DE, enable 返上網 service,而加我地打下面兩句野 enable 返上網.

>enable 既作用係當你每次開機都會自動行埋呢個 Service.

```shell
systemctl enable NetworkManager.service
systemctl enable dhcpcd.service
```

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/enable%20networkmanager%20dhcpcd.png)

# exit arch-chroot

而加可以退你你而加呢個 arch installed session.

```shell
exit
```

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/exit%20arch-chroot.png)

# umount /mnt

```shell
umount -lR /mnt
```

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/umount%20lR%20mnt.png)

# reboot

reboot 完之後你就會見到你既 arch linux grub menu, select arch linux 之後登入你岩岩起完既帳號.

```shell
reboot
```

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/reboot-1.png)

## Grub 安裝成功 ~

搞掂 ~ 撳 enter 入返你部 arch linux ~~

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/grub%20done.png)

## Login

入返你頭先整左既 user 名，打返你個密碼.

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/login.png)

## Check network

睇下你係咪連緊上網.

```shell
ping archlinux.org
```

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/ping%20web%20arch.png)

# 安裝 DE

因為而加你部機淨係得個 Commandline, kernel, base system, 所以而加呢一步係會裝埋 DE (桌面環境)

>注意一：部機第一次行 sudo 會問你係咪真係要用，不過唔洗理，你照打返你而加呢個 user 既密碼就可以。

>注意二：佢會問你好多次係想裝邊樣，你只需要係咁撳 enter 裝返 default 個舊就可以架啦，之後就係等佢裝好。

```shell
sudo pacman -S xorg xorg-xinit plasma plasma-desktop plasma-wayland-session kde-applications kdeplasma-addons sddm
```

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/install%20de.png)

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/de_install_done.png)

## 新增 `xinitrc`

而加要喺個檔案加返個指令先可以每次開機個陣自動 run kde,唔係既話你每次 boot 機都要打返句 `startkde`.

>呢一步可以唔做!!！ 我重試左一次發現就算你唔整呢步都會自動開 KDE!

```shell
echo startkde > ~/.xinitrc
```

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/startkde.png)

## SDDM service

之後 enable 返 SDDM Service.

```shell
sudo systemctl enable sddm.service
```

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/sddmservice%20enable.png)

## reboot

已經成功，可以 reboot 部機，之後就會見到 kde.

```shell
reboot
```
![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/kde-1.png)
![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/kde-2.png)
![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/kde-3.png)


# 後話

搞掂啦 ～ 成個流程就係咁樣，當然其實呢個方法係比較麻煩，但係你咁樣裝先會真係學到一隻 Linux 既架構

- 佢需要啲乜檔案
- 乜野去啟動
- 每個 service 要開邊d 先上到網
- grub 要點裝先擺到隻 linux 入去
- partition 要點分
- 點樣 set 時間, 加 user, 俾權限
- DE 點裝，等等唔同既知識 ~

當然如果你係好新手，其實官方係有整一個 Script 係叫 `archinstall`，佢一樣可以裝到 archlinux，你 liveboot 機個陣只需要打返 `archinstall` 就用到，但係點用就會係另一篇文度講解啦!

另外，dualboot 同 vm 裝,又或者實機一個 os,其實個分別只係你 partition 既 grub install 個位裝去邊，其他基本上係一樣架，識得點睇識得點分識得點 mount folder 就得 ~ 當你學到咁上下，你會發現其實裝 arch 唔係想像中咁難，佢每句 command 都係有佢既意思，明白之後，你唔需要睇都識裝 archlinux ~

## archinstall Screen

![archboot-1](/blog/linux/ArchlinuxOS-Complete-Installation/archinstall.png)

# Reference

- https://ithelp.ithome.com.tw/articles/10158495
- https://wiki.archlinux.org/title/intel_graphics#Installation
- https://www.embarcadero.com/starthere/xe5/mobdevsetup/android/en/enabling_usb_debugging_on_an_android_device.html
- https://www.reddit.com/r/linux4noobs/comments/y4rg46/installing_arch_linux_please_help_with_the_below/
- https://www.linuxquestions.org/questions/linux-newbie-8/error-mounting-mount-unknown-filesystem-type-%27ntfs%27-926355/