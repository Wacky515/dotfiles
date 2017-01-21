#!/bin/bash
# @(#) Install packages for GUI

# TODO:

# DONE:
    # "TightVNCServer" 自動起動 できていない

source ~/dotfiles/function/result_echo.sh

# "Jessie Lite" 判別処理
readonly VER=$(dpkg -l | grep xinit)
if [ "$VER" != "" ]
then
    # "Jessie Lite" ではない時の処理
    ym_echo ">> Install packages for GUI"

    # 日本語環境 インストール
    ym_echo ">> Install Japanese environment"
    # sudo apt install -y fonts-ipafont
    # sudo apt install -y fonts-ipaexfont
    sudo apt install -y fonts-vlgothic
    sudo apt install -y ibus-mozc
    result_echo $? "install Japanese environment"

    # TightVNCViewer インストール
    ym_echo ">> Install \"TightVNCViewer\""
    sudo apt install -y tightvncserver
    result_echo $? "install TightVNCViewer"

    # "man" コマンド日本語化
    ym_echo ">> Install japanese \"man\""
    sudo apt install manpages-ja manpages-ja-dev
    result_echo $? "install japanese \"man\""

    # # 端末 インストール  #{{{
    # sudo apt-get install -y gnome-terminal
#}}}

    # # パーティションツール インストール  #{{{
    # sudo apt-get install -y gparted
#}}}

else
    # "Jessie Lite" 時の処理
    rb_echo ">> This is Raspbian Jessie Lite"
    ym_echo "-> Skip Install packages for GUI"
fi
echo ""
