#!/bin/bash
source /home/pi/dotfiles/function/color_echo.sh
source /home/pi/dotfiles/function/result_echo.sh

readonly PROCESS="setting Wi-Fi"

ym_echo ">> ${PROCESS^}"

ym_echo ">> Input SSID"
read ssid

ym_echo ">> Input passphrase"
read -sp pasph

# echo "SSID: ${ssid} Passphrase: ${pasph}"
echo "SSID: ${ssid}"

sudo sh -c "wpa_passphrase ${ssid} ${pasph} >> \
    /etc/wpa_supplicant/wpa_supplicant.conf"
# sudo sh -c "wpa_passphrase $ssid $pasph >> test_wifi.txt"
result_echo $? "${PROCESS}"
