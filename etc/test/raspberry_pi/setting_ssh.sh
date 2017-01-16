#!/bin/bash
source ./color_echo.sh
source ./result_echo.sh

echo ">> Enable SSH"
touch /boot/ssh
## 有効化
# update-rc.d ssh enable && invoke-rc.d ssh start
## 無効化
# update-rc.d ssh disable && invoke-rc.d ssh stop

if [ "$?" -eq 0 ]
then
    echo "Success enable SSH"
else
    echo "Fail enable SSH"
fi
