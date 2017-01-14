#!bin/bash
echo "Setting network time"
# 以下のエラー 発生
# mv: `/eltime.bak' の後に宛先のファイルオペランドがありません
# Try 'mv --help' for more information.
# sudo mv /etc/localtime /etc/localtime.bak
sudo mv /etc/localtime /etc/localtime~
# sudo cp /etc/localtime /etc/localtime.bak
sudo ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

if [ "$?" -eq 0 ]
then
    echo "Success setting network time"
else
    echo "Fail setting network time"
fi
