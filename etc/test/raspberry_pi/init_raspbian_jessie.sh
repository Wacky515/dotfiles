#!/bin/bash
# TODO:
    # "jessie" と "lite" の処理 分ける

# DONE:
    # IP Addr 固定（アドレスを標準入力する）
    # Wi-Fi（自宅・会社Proxy） SSID Pass 設定
    # 時計合わせ

# ファームとパッケージ アップデート
update_package(){
	# パッケージ アップデート
    echo "Init package update"
    echo ""
	sudo apt update && \
	sudo apt -y upgrade && \
	sudo apt -y dist-upgrade && \

	# ファーム アップデート
	sudo rpi-update && \

	sudo apt-get autoremove && \

    echo "Success init package update" || \
    echo "fail init package update"
    echo ""
}

# 各パッケージ インストール
install_package(){
    echo "Init install packages"
    echo ""

    # "zsh" インストール
    echo "Install \"zsh\""
    sudo apt install -y zsh

    if [ "$?" -eq 0 ]
    then
        echo "Success install \"zsh\""
    else
        echo "fail install \"zsh\""
    fi
    echo ""

	# "Vim" インストール
    echo "Install \"Vim\""
	sudo apt install -y vim
	sudo apt install -y vim-gtk

    if [ "$?" -eq 0 ]
    then
        echo "Success install \"Vim\""
    else
        echo "fail install \"Vim\""
    fi
    echo ""

	# 仮想端末 インストール
	# sudo apt-get install -y byobu

    # "Lite" ではない時の処理
    # sudo sh ./GUI_packages.sh
    sudo sh ./test_lite.sh
}

# 独自設定
setup_dotfiles(){
    # # 実行権限 付与
    # echo "Change mode"
    # sudo chmod +x *.sh
    # sudo chmod +x ./etc/test/raspberry_pi/*.sh

    # if [ "$?" -eq 0 ]
    # then
    #     echo "Success change mode"
    # else
    #     echo "fail change mode"
    # fi
    # echo ""

    # "link.sh" 実施
    sudo bash ~/dotfiles//link.sh

    # IPアドレス 固定
    sudo sh ./fix_ipaddr.sh

    # 時計 JSTに設定
    sudo mv /eltime.bak
    sudo ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

    # ホスト名 変更
    sudo sh ./setting_hostname.sh

    # キーボード配列 変更
    sudo sh ./setting_keyboard.sh

    # パスワード 変更
    echo "Input password for this pi(root)"
    sudo passwd

    echo "Input password for this pi"
    passwd

    # SSH 有効化
    sudo sh ./setting_ssh.sh

    # ".bashrc" ."zhrc" の設定
	# sudo cp ~/dotfiles/etc/test/raspberry_pi/.bashrc ~/.bashrc
	# sudo cp ~/dotfiles/etc/test/raspberry_pi/.zhrc ~/.zhrc

    # "Lite" ではない時の処理
    sudo sh ./GUI_setting.sh
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

# "Lite" ではない時の処理
REV=`cat /proc/cmdline | /
awk -v RS=" " -F= '/boardrev/ { print $2 }'`
if [ "$REV" != "900092" ]
    echo "Input password for VNC server"
    sudo /etc/init.d/vncboot start
fi

echo "Please reboot"
# sudo shotdown -r now
# TODO: select y/n in STDINPUT -> sudo shotdown -r now
while true
do
    input rebt
    if [ "$yesno" = "yes" ]
    then
        sudo shotdown -r now
    fi
done
