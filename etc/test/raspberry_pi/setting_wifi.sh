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

# echo "SSID: ${ssid} Passphrase: ${pasph}"
echo "SSID: ${SSID}"

# sudo sh -c "wpa_passphrase ${SSID} ${PASPH} >> \
#     /etc/wpa_supplicant/wpa_supplicant.conf"
# sudo sh -c "wpa_passphrase $ssid $pasph >> test_wifi.txt"
# sudo wpa_passphrase ${SSID} ${PASPH} >> \
#     /etc/wpa_supplicant/wpa_supplicant.conf
stty -echo
wpa_passphrase ${SSID} ${PASPH} | sudo tee -a \
    /etc/wpa_supplicant/wpa_supplicant.conf
stty echo
result_echo $? "${PROCESS}"
