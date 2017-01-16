#!/bin/bash
source ./color_echo.sh
source ./result_echo.sh

echo ">> Setting hostname"
sudo mv /etc/hostname /etc/hostname.bak
sudo cp /etc/hosts /etc/hosts.bak
read newname
echo "$newname" > /etc/hostname
# echo "$newname" > /etc/hosts
sed -e "s/raspberrypi/"$newname"/g" /etc/hosts

if [ "$?" -eq 0 ]
then
    echo ">> Success setting hostname"
else
    echo ">> Fail setting hostname"
fi
