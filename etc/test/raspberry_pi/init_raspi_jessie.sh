#!/bin/bash
# TODO:

# DONE:
    # IP Addr 固定（アドレスを標準入力する）
    # Wi-Fi（自宅・会社Proxy） SSID Pass 設定
    # 時計合わせ

# ファームとパッケージ アップデート
update_package(){
	# パッケージ アップデート
    echo "Init package update"
	sudo apt update
	sudo apt -y upgrade
	sudo apt -y dist-upgrade

	# ファーム アップデート
	sudo rpi-update

    if [ "$?" -eq 0 ]
    then
        echo "Success init package update"
    else
        echo "fail init package update"
    fi
}

# 各パッケージ インストール
install_package(){
    echo "Init install package"
    # 日本語環境 インストール
    # sudo apt install -y fonts-ipafont
    # sudo apt install -y fonts-ipaexfont
	sudo apt install -y fonts-vlgothic
	sudo apt install -y ibus-mozc
	sudo apt install -y tightvncserver

    # "man" コマンド日本語化
    sudo apt install manpages-ja manpages-ja-dev

	# "Vim" インストール
	sudo apt install -y vim
	sudo apt install -y vim-gtk

    # "zsh" インストール
    sudo apt install -y zsh

    # "Chromium" インストール
    echo "Install Chromium"
    wget -qO - \
        http://bintray.com/user/downloadSubjectPublicKey?username=bintray \
        | sudo apt-key add -
    echo "deb http://dl.bintray.com/kusti8/chromium-rpi jessie main" \
        | sudo tee -a /etc/apt/sources.list
    sudo apt update
    sudo apt install chromium-browser rpi-youtube -y
    ginstall-ytdl

    if [ "$?" -eq 0 ]
    then
        echo "Success install Chromium"
    else
        echo "fail init install Chromium"
    fi

	# 端末 インストール
	# sudo apt-get install -y gnome-terminal

	# パーティションツール インストール
	# sudo apt-get install -y gparted

	# 仮想端末 インストール
	# sudo apt-get install -y byobu
}

# 独自設定
setup_dotfiles(){
    # 実行権限 付与
    echo "Change mod"
    sudo chmod +x *.sh
    sudo chmod +x /dotfiles/etc/test/raspberry_pi/*.sh

    if [ "$?" -eq 0 ]
    then
        echo "Success change mod"
    else
        echo "fail change mod"
    fi

    # "link.sh" 実施
    sudo sh ./ dotfiles/link.sh

    # IPアドレス 固定
    sudo sh ./dotfiles/etc/test/raspberry_pi/fix_ipaddr.sh

    # Wi-Fi 設定
    sudo sh ./dotfiles/etc/test/raspberry_pi/setting_wifi.sh

    # 時計 JSTに設定
    sudo mv /etc/localtime /etc/localtime.bak
    sudo ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

    # ホスト名 変更
    sudo sh ./dotfiles/etc/test/raspberry_pi/setting_hostname.sh

    # パスワード 変更
    echo "Input password for this pi(root)"
    sudo passwd

    echo "Input password for this pi"
    passwd

    # SSH 有効化
    sudo sh ./dotfiles/etc/test/raspberry_pi/setting_ssh.sh

    # ".bashrc" ."zhrc" の設定
	# sudo cp ./dotfiles/etc/test/raspberry_pi/.bashrc ~/.bashrc
	sudo cp ./dotfiles/etc/test/raspberry_pi/.zhrc ~/.zhrc

    # "config.txt" 設定
	sudo cp ./dotfiles/etc/test/raspberry_pi/config.txt /boot/config.txt

    # 仮想デスクトップ環境 設定
	sudo cp ./dotfiles/etc/test/raspberry_pi/lxpolkit.desktop \
        /etc/xdg/autostart/lxpolkit.desktop

    # Automatically start up VNC
	sudo cp ./dotfiles/etc/test/raspberry_pi/vncboot /etc/init.d/vncboot
	sudo update-rc.d -f lightdm remove
	sudo update-rc.d vncboot defaults
}

START_TIME=`date +%s`

# 実行したフォルダに "cd"
cd `dirname $0`

update_package
install_package
setup_dotfiles

END_TIME=`date +%s`

SS=`expr ${END_TIME} - ${START_TIME}`
HH=`expr ${SS} / 3600`
SS=`expr ${SS} % 3600`
MM=`expr ${SS} / 60`
SS=`expr ${SS} % 60`

echo "Total Time: ${HH}:${MM}:${SS} (h:m:s)"

echo "Input password for VNC server"
sudo /etc/init.d/vncboot start

echo "Please reboot"
# sudo shotdown -r now
# TODO: select y/n in STDINPUT -> sudo shotdown -r now
while true
do
    if
        input rebt
        if [ "$yesno" = "yes" ]
        then
            sudo shotdown -r now
    fi
done
