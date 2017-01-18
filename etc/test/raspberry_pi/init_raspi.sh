#!/bin/bash

# TODO:
    # "source" の参照先 "/home/pi" を動的にする
    # インストール用スクリプトの共通・GUI・Liteフォルダ分け
# FIXME:
    # TightVNCServerVNC 自動起動
    # Wi-Fi 自動設定

# DONE  :#{{{
    # "Jessie" と "Jessie Lite" の処理 分ける
    # 切り出した関数 フォルダ作る
    # 実行結果 "echo" 関数 切り出し
    # 色付き "echo" 関数 切り出し
    # IP Addr 固定（アドレスを標準入力する）
    # Wi-Fi（自宅・会社Proxy） SSID Pass 設定
    # 時計合わせ
#}}}

source /home/pi/dotfiles/function/color_echo.sh
source /home/pi/dotfiles/function/result_echo.sh

# ファームとパッケージ アップデート
update_package(){
	# パッケージ アップデート
    ym_echo ">> Init package update"
    echo ""
	sudo apt update && \
	sudo apt -y upgrade && \
	sudo apt -y dist-upgrade && \

    # "Jessie Lite" ではない時の処理
    readonly VER=$(dpkg -l | grep xinit)
    if [ "$VER" != "" ]
    then
        # ファーム アップデート
        ym_echo ">> Execute \"rpi-update\""
        sudo rpi-update || \
        rb_echo ">> Fail \"rpi-update\""
    fi

    # アップデート 後処理
    # MEMO: "autoremove" だけは "apt-get" のまま
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
    result_echo $? "install \"zsh\""

	# "Vim" インストール
    ym_echo ">> Install \"Vim\""
	sudo apt install -y vim
	sudo apt install -y vim-gtk
    result_echo $? "install \"Vim\""

	# 仮想端末 インストール
	# sudo apt install -y byobu

    # "Jessie Lite" ではない時の処理
    sudo bash ./gui_packages.sh
}

# 独自設定
setup_dotfiles(){
    ym_echo ">> Init setting"
    echo ""

    # # 実行権限 付与  #{{{
    # ym_echo ">> Change mode"
    # sudo chmod +x ./*.sh
    # result_echo $? "change mode"
#}}}

    # "link.sh" 実施
    /home/pi/dotfiles/link.sh

    # 時計 "JST" に設定
    sudo bash ./setting_jst.sh

    # キーボード配列 変更
    sudo bash ./setting_keyboard.sh

    # SSH 有効化
    sudo bash ./setting_ssh.sh

    # "Jessie Lite" ではない時の処理
    sudo bash ./gui_setting.sh

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
readonly START_TIME=`date +%s`

# # 実行したフォルダに "cd"
# cd `dirname $0`

update_package
install_package
setup_dotfiles

readonly END_TIME=`date +%s`

readonly SS=`expr ${END_TIME} - ${START_TIME}`
readonly HH=`expr ${SS} / 3600`
readonly SS=`expr ${SS} % 3600`
readonly MM=`expr ${SS} / 60`
readonly SS=`expr ${SS} % 60`

ym_echo ">> Total time: ${HH}:${MM}:${SS}"

# "Jessie Lite" ではない時の処理
readonly VER=$(dpkg -l | grep xinit)
if [ "$VER" != "" ]
then
    # FIXME: "command not found"  になる
    ym_echo ">> Input password for VNC server"
    sudo /etc/init.d/vncboot start
fi

ym_echo ">> Please reboot(yes/no)"
while true
do
    read yesno
    if [ "$yesno" = "yes" ]
    then
        sudo shutdown -r now
    else [ "$yesno" = "no" ]
        break
    fi
done
