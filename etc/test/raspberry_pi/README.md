# raspberry-pi-setup
raspberry pi auto setup script

## Install Package
### Raspbian Jessie
- Editor(vim,vim-gtk) ✔OK
- JAPANESE environment(fonts-vlgothic, ibus-mozc) ✔OK
- VNC Server(tightvncserver) ✔OK

#### 以下から追加したパッケージ
- zsh ✔OK
- 不要 Chromium ✔OK

#### 以下はオミット
- Terminal(gnome-terminal)
- Pertition tool(gparted)
- Virtual Terminal(byobu)

### Raspbian Jessie LITE
- Git
- Editor(vim,vim-gtk)

#### 以下はオミット
- Virtual Terminal(byobu)

## Setting
### Raspbian Jessie
- Set dotfiles ✔
- Set Timezone # 設定不要✔再起動前OK
- Set Keyboard # 設定不要
- SSH Enable ✔NG スクリプトのミス 修正した

- 無線LAN 設定 ✔
- Auto start VNC

- Custom `/boot/config.txt`

- IPアドレス 固定 ✔OK
- パスワード 変更 ✔NG
- ホスト名 設定 ✔OK

- NotYet Camera Enable # 設定方法不明
- NotYet Set Locale # 設定不要

### Raspbian Jessie LITE
- Set dotfiles ✔
- Set Timezone # ✔再起動前OK
- Set Keyboard # 設定不要
- SSH Enable ✔NG スクリプトのミス 修正した

- 無線LAN 設定 ✔

- Custom `/boot/config.txt`

- IPアドレス 固定 ✔OK
- パスワード 変更 ✔OK
- ホスト名 設定 ✔OK

# Preparation
- Make SD disk of Raspbian Jessie
- Touch "ssh" file in /boot
- Insert SD disk to Raspberry Pi
- Network Enable (Ether or WiFi)
- Raspberry Pi power on

<!-- 不要と思われる！！！ ## Git installation -->
<!-- ```sh -->
<!-- $ sudo apt update -->
<!-- $ sudo apt -y install git -->
<!-- ``` -->

# Run this script

## Raspbian Jessie setup case
Execute following command(last command takes about half an hour):
```sh
$ cd
$ git clone https://github.com/Wacky515/dotfiles.git
$ cd ./dotfiles/etc/test/raspberry_pi
$ sudo bash ./init_raspi.sh
```
At the end of script, set the password for vnc.

## Raspbian Jessie LITE setup case
Execute following command(last command takes about half an hour):
```sh
$ sudo apt update
$ sudo apt -y install git
$ cd
$ git clone https://github.com/wacky515/dotfiles.git
$ cd ./dotfiles/etc/test/raspberry_pi
$ sudo bash ./init_raspi.sh
```
Raspberry Pi setup is done!
