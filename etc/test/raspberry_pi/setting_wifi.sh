#!/bin/bash
source ./color_echo.sh
source ./result_echo.sh

PROCESS="setting Wi-Fi"

ym_echo "${PROCESS^}"

echo "Input SSID"
read ssid

echo "Input passphrase"
read pasph

echo "SSID: $ssid Passphrase: $pasph"

sudo sh -c "wpa_passphrase $ssid $pasph >> \
    /etc/wpa_supplicant/wpa_supplicant.conf"
# sudo sh -c "wpa_passphrase $ssid $pasph >> test_wifi.txt"
result_echo $? $PROCESS
