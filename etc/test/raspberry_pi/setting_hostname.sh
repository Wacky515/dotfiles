#!/bin/bash
echo "Setting hostname"
sudo cp /etc/hostname /etc/hostname.bak
read newname
"$newname" > /etc/hostname

if [ "$?" -eq 0 ]
then
    echo "Success setting hostname"
else
    echo "Fail setting hostname"
fi
