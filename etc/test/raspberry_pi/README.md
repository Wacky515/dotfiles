# raspberry-pi-setup
raspberry pi auto setup script

## Setting
### Raspbian Jessie
- 無線LAN 設定 ✔
- Set Timezone # ✔再起動前OK
- SSH Enable ✔NG スクリプトのミス 修正した

- Camera Enable # 設定方法不明
- Set Locale # 設定不要
- Set Keyboard # 設定不要

- Custom `.zshrc`
- Custom `/boot/config.txt`
- Auto start VNC

- IPアドレス 固定 ✔OK
- パスワード 変更 ✔OK
- ホスト名 設定 ✔OK

### Raspbian Jessie LITE
- Custom `/boot/config.txt`

- 独自設定は移植途中

## Install Package
### Raspbian Jessie
- JAPANESE environment(fonts-vlgothic, ibus-mozc) ✔OK
- VNC Server(tightvncserver) ✔OK
- Editor(vim,vim-gtk) ✔OK

#### 以下から追加したパッケージ
- zsh ✔OK
- Chromium ✔OK

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

<!-- 不要と思われる！！！ ## Git installation -->
<!-- ```sh -->
<!-- $ sudo apt update -->
<!-- $ sudo apt -y install git -->
<!-- ``` -->
<!--  -->
# Run this script

## Raspbian Jessie setup case
Execute following command(last command takes about half an hour):
```sh
$ cd
$ git clone https://github.com/Wacky515/dotfiles.git
$ cd ./dotfiles/etc/test/raspberry_pi
$ sudo bash ./init_raspbian_jessie.sh
```
At the end of script, set the password for vnc.

<!-- ## Raspbian Jessie LITE setup case -->
<!-- Execute following command(last command takes about half an hour): -->
<!-- ```sh -->
<!-- $ cd -->
<!-- $ git clone https://github.com/wacky515/dotfiles.git -->
<!-- $ cd ./dotfiles/etc/test/raspberry_pi -->
<!-- $ sudo bash ./init_raspi_jessie_lite.sh -->
<!-- ``` -->
Raspberry Pi setup is done!
