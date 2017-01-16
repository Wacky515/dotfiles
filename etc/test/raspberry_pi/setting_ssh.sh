#!/bin/bash
source /home/pi/dotfiles/function/color_echo.sh
source /home/pi/dotfiles/function/result_echo.sh

PROCESS="enable SSH"

ym_echo "${PROCESS^}"

## 有効化
# update-rc.d ssh enable && invoke-rc.d ssh start
## 無効化
# update-rc.d ssh disable && invoke-rc.d ssh stop
touch /boot/ssh
result_echo $? $PROCESS
