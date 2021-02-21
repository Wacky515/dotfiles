#!/bin/bash
# @(#) Setting SSH communication

source ~/dotfiles/function/result_echo.sh

readonly PROCESS="enable SSH"

ym_echo ">> ${PROCESS^}"

## 有効化
# update-rc.d ssh enable && invoke-rc.d ssh start
## 無効化
# update-rc.d ssh disable && invoke-rc.d ssh stop
sudo touch /boot/ssh
result_echo $? "${PROCESS}"
