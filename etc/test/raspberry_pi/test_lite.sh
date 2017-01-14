#!/bin/sh
# "Lite" ではない時の処理
REV=`cat /proc/cmdline | \
awk -v RS=" " -F= '/boardrev/ { print $2 }'`
if [ "$REV" != "900092" ]
then
    echo "Install package for GUI"
    # TODO: no_lite
    # 日本語環境 インストール
    echo "Install Japanese environment"
    # sudo apt install -y fonts-ipafont
    # sudo apt install -y fonts-ipaexfont
    sudo apt install -y fonts-vlgothic
    sudo apt install -y ibus-mozc

    # TODO: no_lite
    # TightVNCViewer インストール
    echo "Install \"TightVNCViewer\""
    sudo apt install -y tightvncserver

    # TODO: no_lite
    # "man" コマンド日本語化
    echo "Install japanese \"man\""
    sudo apt install manpages-ja manpages-ja-dev

    # TODO: no_lite
    # "Chromium" インストール
    echo "Install \"Chromium\""
    wget -qO - http://bintray.com/user/ \
        downloadSubjectPublicKey?username=bintray \
        | sudo apt-key add -
    echo "deb http://dl.bintray.com/kusti8/chromium-rpi jessie main" \
        | sudo tee -a /etc/apt/sources.list
    sudo apt update
    sudo apt install chromium-browser rpi-youtube -y
    ginstall-ytdl

    if [ "$?" -eq 0 ]
    then
        echo "Success install \"Chromium\""
    else
        echo "fail init install \"Chromium\""
    fi
else
    echo "This is raspberry pi zero"
fi
echo ""
