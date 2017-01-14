#!bin/sh
echo "Setting network time"
sudo mv /etc/localtime /etc/localtime.bak
sudo ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

if [ "$?" -eq 0 ]
then
    echo "Success setting network time"
else
    echo "Fail setting network time"
fi
