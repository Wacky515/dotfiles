#!/bin/bash
source ./color_echo.sh
source ./result_echo.sh

# TODO:
    # "jessie" と "lite" の処理 分ける
    # 実行結果 "echo" 関数 切り出し

# DONE:
    # 色付き "echo" 関数 切り出し
    # IP Addr 固定（アドレスを標準入力する）
    # Wi-Fi（自宅・会社Proxy） SSID Pass 設定
    # 時計合わせ

# ファームとパッケージ アップデート
update_package(){
	# パッケージ アップデート
    ym_echo ">> Init package update"
    echo ""
	sudo apt update && \
	sudo apt -y upgrade && \
	sudo apt -y dist-upgrade && \

	# ファーム アップデート
    # "Jessie Lite" ではない時の処理
    VER=`dpkg -l | grep xinit`
    if [ "$VER" != "" ]
    then
        ym_echo ">> Execute \"rpi-update\""
        sudo rpi-update && \
    fi

    # アップデート 後処理
    # "autoremove" だけは "apt-get" のまま
	sudo apt-get -y autoremove && \

    ym_echo ">> Success init package update" || \
    rb_echo ">> Fail init package update"
    echo ""
}

# 各パッケージ インストール
install_package(){
    ym_echo ">> Init install packages"
    echo ""

    # "zsh" インストール
    ym_echo ">> Install \"zsh\""
    sudo apt install -y zsh
    result $? \"zsh\"

	# "Vim" インストール
    ym_echo ">> Install \"Vim\""
	sudo apt install -y vim
	sudo apt install -y vim-gtk
    result $? \"Vim\"

	# 仮想端末 インストール
	# sudo apt-get install -y byobu

    # "Jessie Lite" ではない時の処理
    sudo bash ./gui_packages.sh
}

# 独自設定
setup_dotfiles(){
    ym_echo ">> Init setting"
    echo ""

    # # 実行権限 付与  #{{{
    # ym_echo ">> Change mode"
    # sudo chmod +x *.sh # sudo chmod +x ./etc/test/raspberry_pi/*.sh
    # result $? change mode
#}}}

    # "link.sh" 実施
    bash pi/dotfiles/link.sh

    # 時計 "JST" に設定（デフォルトで "JST" になってるっぽい）
    # # sudo mv /etc/localtimetime.bak
    # # sudo ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
    # sudo bash ./setting_jst.sh

    # キーボード配列 変更
    sudo bash ./setting_keyboard.sh

    # SSH 有効化
    sudo bash ./setting_ssh.sh

    # "Jessie Lite" ではない時の処理
    sudo sh ./gui_setting.sh

    # IPアドレス 固定
    sudo bash ./fix_ipaddr.sh

    # パスワード 変更
    ym_echo ">> Change password for root"
    sudo passwd root

    # FIXME: NG
    ym_echo ">> Change password for pi"
    sudo passwd pi

    # ホスト名 変更（必ず最後に実施）
    sudo bash ./setting_hostname.sh
}

# Main routine
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

y_echo ">> Total time: ${HH}:${MM}:${SS}"

# "Jessie Lite" ではない時の処理
# REV=`cat /proc/cmdline | /
# awk -v RS=" " -F= '/boardrev/ { print $2 }'`
# if [ "$REV" != "900092" ]

VER=`dpkg -l | grep xinit`
if [ "$VER" != "" ]
then
    ym_echo ">> Input password for VNC server"
    sudo /etc/init.d/vncboot start
fi

ym_echo ">> Please reboot"
# sudo shotdown -r now
# TODO: select y/n in STDINPUT -> sudo shotdown -r now
while true
do
    read rebt
    if [ "$yesno" = "yes" ]
    then
        sudo shotdown -r now
    fi
done
