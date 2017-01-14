#!/bin/sh
# "Lite" ではない時の処理
REV=`cat /proc/cmdline | /
awk -v RS=" " -F= '/boardrev/ { print $2 }'`
if [ "$REV" != "900092" ]
then
    echo "Setting packages for GUI"

    # "config.txt" 設定
    sudo cp ./dotfiles/etc/test/raspberry_pi/config.txt \
        /boot/config.txt

    # Wi-Fi 設定
    sudo sh ./dotfiles/etc/test/raspberry_pi/setting_wifi.sh

    # 仮想デスクトップ環境 設定
    sudo cp ./dotfiles/etc/test/raspberry_pi/lxpolkit.desktop \
        /etc/xdg/autostart/lxpolkit.desktop

    # Automatically start up VNC
    sudo cp ./dotfiles/etc/test/raspberry_pi/vncboot \
        /etc/init.d/vncboot
    sudo update-rc.d -f lightdm remove
    sudo update-rc.d vncboot defaults
else
    echo "This is raspberry pi zero"
    # "config.txt" 設定
    sudo cp ./dotfiles/etc/test/raspberry_pi/config_lite.txt \
        /boot/config.txt
fi
echo ""
