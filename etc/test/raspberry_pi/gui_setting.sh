#!/bin/bash
source /home/pi/dotfiles/function/color_echo.sh
source /home/pi/dotfiles/function/result_echo.sh

# ファイル自身の絶対パス 取得
path=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
setting=${path}/setting

echo $path
echo $setting

# "Jessie Lite" 判別処理
VER=`dpkg -l | grep xinit`
if [ "$VER" != "" ]
then
    # "Jessie Lite" ではない時の処理
    ym_echo ">> Setting for GUI"

    # Wi-Fi 設定
    ./setting_wifi.sh

    # 仮想デスクトップ環境 設定
    sudo cp ${setting}/lxpolkit.desktop \
        /etc/xdg/autostart/lxpolkit.desktop

    # Automatically start up VNC
    sudo cp ${setting}/vncboot \
        /etc/init.d/vncboot
    sudo update-rc.d -f lightdm remove
    sudo update-rc.d vncboot defaults

    # "config.txt" 設定
    # sudo cp ./config.txt /boot/config.txt
    sudo cp ${setting}/config.txt \
        /boot/config.txt
else
    # "Jessie Lite" 時の処理
    rb_echo ">> This is Raspbian Jessie Lite"
    ym_echo "-> Skip GUI setting"

    # "config.txt" 設定
    # sudo cp ${setting}/config_lite.txt \
    sudo cp /home/pi/dotfiles/etc/test/raspberry_pi/setting/config_lite.txt \
        /boot/config.txt
    # sudo cp ./setting/config_lite.txt /boot/config.txt
fi
echo ""
