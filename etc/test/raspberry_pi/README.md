# raspberry-pi-setup
raspberry pi auto setup script

## Setting
### Raspbian Jessie
- IPアドレス 固定 ✔
- 無線LAN 設定 ✔
- 時計 JSTに設定 ✔
- ホスト名 設定 ✔
- パスワード 変更 ✔
- SSH Enable ✔
- Camera Enable # 設定方法不明
- Set Locale # 設定不要
- Set Timezone # 設定不要
- Set Keyboard # 設定不要

- Custom `.zshrc`
- Custom `/boot/config.txt`
- Auto start VNC

### Raspbian Jessie LITE
- Custom `/boot/config.txt`

- 独自設定は移植途中

## Install Package
### Raspbian Jessie
- JAPANESE environment(fonts-vlgothic, ibus-mozc)
- VNC Server(tightvncserver)
- Editor(vim,vim-gtk)

#### 以下から追加したパッケージ
- zsh ✔
- Chromium ✔

#### 以下はオミット
- Terminal(gnome-terminal)
- Pertition tool(gparted)
- Virtual Terminal(byobu)

### Raspbian Jessie LITE
- Editor(vim,vim-gtk)
- Virtual Terminal(byobu)

# Preparation
- Make SD disk of Raspbian Jessie
- Insert SD disk to Raspberry Pi
- Network Enable (Ether or WiFi)
- Raspberry Pi power on
- Install Git

## Git installation
```sh
$ sudo apt update
$ sudo apt -y install git
```

# Run this script

## Raspbian Jessie setup case
Execute following command(last command takes about half an hour):
```sh
$ cd
$ git clone https://github.com/wacky515/dotfiles.git
$ cd ./dotfiles/etc/test/raspberry_pi
$ sh ./init_raspi_jessie.sh
```
At the end of script, set the password for vnc.

## Raspbian Jessie LITE setup case
Execute following command(last command takes about half an hour):
```sh
$ cd
$ git clone https://github.com/wacky515/dotfiles.git
$ cd ./dotfiles/etc/test/raspberry_pi
$ sh ./init_raspi_jessie_lite.sh
```
Raspberry Pi setup is done!
