#!/bin/bash
echo "Input SSID"
read ssid

echo "Input passphrase"
read pasph

echo "SSID: $ssid Passphrase: $pasph"

sudo sh -c "wpa_passphrase $ssid $pasph >> \
    /etc/wpa_supplicant/wpa_supplicant.conf"
# sudo sh -c "wpa_passphrase $ssid $pasph >> test_wifi.txt"

if [ "$?" -eq 0 ]
then
    echo "Success setting Wi-Fi"
else
    echo "fail setting Wi-Fi"
fi
