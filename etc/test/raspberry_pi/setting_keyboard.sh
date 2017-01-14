#!/bin/bash
echo "Setting keyboard layout"
sudo mv /etc/default/keyboard /etc/default/keyboard.bak
sudo cp ./keyboard /etc/default/

if [ "$?" -eq 0 ]
then
    echo "Success setting keyboard layout"
else
    echo "Fail setting keyboard layout"
fi

