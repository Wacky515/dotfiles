# raspberry-pi-setup
raspberry pi auto setup script

# Install command

## Raspbian Jessie setup case
Execute following command(last command takes about a 2 hour):
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

# Install Package

## Common install
- Editor(vim,vim-gtk)
- zsh(Added)

### Ignored
- Virtual Terminal(byobu)

## Raspbian Jessie
- JAPANESE environment(fonts-vlgothic, ibus-mozc) ✔OK
- VNC Server(tightvncserver) ✔OK

- (Default) Chromium ✔OK(added)

### Ignored
- Terminal(gnome-terminal)
- Pertition tool(gparted)

## Raspbian Jessie LITE
- Git

### Ignored

# Setting
## Raspbian Jessie
- Set dotfiles
- Set Keyboard # Not yet
- SSH Enable

- 無線LAN 設定 ✔
- Auto start VNC # Not yet

- Custom `/boot/config.txt` # Not yet

- Fixed IP addr
- Change password
- Change host name

- NotYet Camera Enable # 設定方法不明
- NotYet Set Locale # 設定不要

## Raspbian Jessie LITE
- Set dotfiles
- Set Keyboard # Not yet
- SSH Enable

- 無線LAN 設定 ✔

- Custom `/boot/config.txt`

- Fixed IP addr
- Change password
- Change host name

# Preparation
- Make SD disk of Raspbian Jessie
- Touch "ssh" file in /boot
- Insert SD disk to Raspberry Pi
- Network Enable (Ether or WiFi)
- Raspberry Pi power on
