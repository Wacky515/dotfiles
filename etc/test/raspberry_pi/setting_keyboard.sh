#!/bin/sh
echo "Setting keyboard layout"
sudo mv /etc/default/keyboard /etc/default/keyboard.bak
sudo cp ./dotfiles/etc/test/raspberry_pi/keyboard /etc/default/

if [ "$?" -eq 0 ]
then
    echo "Success setting keyboard layout"
else
    echo "Fail setting keyboard layout"
fi

