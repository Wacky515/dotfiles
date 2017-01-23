#!/bin/bash
# @(#) Setting Wi-Fi SSID, passphrase

source ~/dotfiles/function/result_echo.sh

readonly PROCESS="setting Wi-Fi"
sudo cp /etc/wpa_supplicant/wpa_supplicant.conf \
    /etc/wpa_passphrase/wpa_supplicant.bak

ym_echo ">> ${PROCESS^}"
sudo ifdown wlan0

ym_echo ">> Input SSID"
read SSID

ym_echo ">> Input passphrase"
read -sp "Passphrase: " PASPH
echo ""

sudo sh -c "wpa_passphrase ${SSID} ${PASPH} >> \
    /etc/wpa_supplicant/wpa_supplicant.conf"

# grep "country=GB" /etc/wpa_supplicant/wpa_supplicant.conf
if sudo grep "country=GB" /etc/wpa_supplicant/wpa_supplicant.conf
then
    ym_echo ">> Change country"
        # exit
# else
        # sudo sed -i "country=JP" /etc/wpa_supplicant/wpa_supplicant.conf
        sudo sed -i.bak -e "s/country=GB/country=JP/g" \
            /etc/wpa_supplicant/wpa_supplicant.conf
fi

result_echo $? "${PROCESS}"
ym_echo ">> Reboot Wi-Fi device, please wait"
sudo ifup wlan0
result_echo $? "Success reboot Wi-Fi"
