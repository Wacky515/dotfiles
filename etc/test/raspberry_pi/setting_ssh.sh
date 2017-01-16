#!/bin/bash

# 実行したフォルダに "cd"
cd `dirname $0`

source ./dotfiles/function/color_echo.sh
source ./dotfiles/function/result_echo.sh

PROCESS="enable SSH"

ym_echo "${PROCESS^}"

## 有効化
# update-rc.d ssh enable && invoke-rc.d ssh start
## 無効化
# update-rc.d ssh disable && invoke-rc.d ssh stop
touch /boot/ssh
result_echo $? $PROCESS
