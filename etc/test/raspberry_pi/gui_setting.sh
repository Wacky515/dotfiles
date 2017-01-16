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
    ym_echo ">> Setting packages for GUI"

    # Wi-Fi 設定
    sudo sh ./setting_wifi.sh

    # 仮想デスクトップ環境 設定
    sudo cp ./lxpolkit.desktop /etc/xdg/autostart/lxpolkit.desktop

    # Automatically start up VNC
    sudo cp ./vncboot /etc/init.d/vncboot
    sudo update-rc.d -f lightdm remove
    sudo update-rc.d vncboot defaults

    # "config.txt" 設定
    sudo cp ./config.txt /boot/config.txt
else
    # "Jessie Lite" 時の処理
    rb_echo ">> This is Raspbian Jessie Lite"

    # "config.txt" 設定
    sudo cp ./config_lite.txt /boot/config.txt
fi
echo ""
