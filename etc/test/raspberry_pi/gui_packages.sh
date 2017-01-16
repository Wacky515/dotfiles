#!/bin/bash
source ./color_echo.sh
source ./result_echo.sh

# "Jessie Lite" 判別処理

# REV=`cat /proc/cmdline | /
# awk -v RS=" " -F= '/boardrev/ { print $2 }'`
# if [ "$REV" != "900092" ]

VER=`dpkg -l | grep xinit`
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

    if [ "$?" -eq 0 ]
    then
        ym_echo ">> Success install Japanese environment"
    else
        rb_echo ">> Fail install Japanese environment"
    fi
    echo ""

    # TightVNCViewer インストール
    ym_echo ">> Install \"TightVNCViewer\""
    sudo apt install -y tightvncserver

    if [ "$?" -eq 0 ]
    then
        ym_echo ">> Success install \"TightVNCViewer\""
    else
        rb_echo ">> Fail install \"TightVNCViewer\""
    fi
    echo ""

    # "man" コマンド日本語化
    ym_echo ">> Install japanese \"man\""
    sudo apt install manpages-ja manpages-ja-dev

    if [ "$?" -eq 0 ]
    then
        ym_echo ">> Success install \"man\""
    else
        rb_echo ">> Fail install \"man\""
    fi
    echo ""

    # # "Chromium" インストール  #{{{
    # ym_echo ">> Install \"Chromium\""
    # wget -qO - http://bintray.com/user/ \
    #     downloadSubjectPublicKey?username=bintray \
    #     | sudo apt-key add -
    # ym_echo ">> deb http://dl.bintray.com/kusti8/chromium-rpi jessie main" \
    #     | sudo tee -a /etc/apt/sources.list
    # sudo apt update
    # sudo apt install chromium-browser rpi-youtube -y
    # ginstall-ytdl
    #
    # if [ "$?" -eq 0 ]
    # then
    #     ym_echo ">> Success install \"Chromium\""
    # else
    #     rb_echo ">> Fail init install \"Chromium\""
    # fi
#}}}

    # # 端末 インストール  #{{{
    # sudo apt-get install -y gnome-terminal
#}}}

    # # パーティションツール インストール  #{{{
    # sudo apt-get install -y gparted
#}}}

else
    # "Jessie Lite" 時の処理
    rb_echo ">> This is Raspbian Jessie Lite"
fi
echo ""
