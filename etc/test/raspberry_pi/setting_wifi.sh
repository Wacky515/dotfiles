#!/bin/bash
source /home/pi/dotfiles/function/color_echo.sh
source /home/pi/dotfiles/function/result_echo.sh

readonly PROCESS="setting Wi-Fi"

ym_echo ">> ${PROCESS^}"

ym_echo ">> Input SSID"
read SSID

ym_echo ">> Input passphrase"
read -sp "Passphrase: " PASPH
echo ""

echo "SSID: ${SSID}"

sudo sh -c "wpa_passphrase ${SSID} ${PASPH} >> \
    /etc/wpa_supplicant/wpa_supplicant.conf"

grep "country=GB" /etc/wpa_supplicant/wpa_supplicant.conf
if grep "country=GB" /etc/wpa_supplicant/wpa_supplicant.conf
then
        exit
else
        sed -i "country=JP" /etc/wpa_supplicant/wpa_supplicant.conf
fi

result_echo $? "${PROCESS}"
