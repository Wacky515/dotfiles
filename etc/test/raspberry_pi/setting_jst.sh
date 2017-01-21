#!/bin/bash
# @(#) Setting JST

source ~/dotfiles/function/result_echo.sh

readonly PROCESS="setting network time"

ym_echo ">> ${PROCESS^}"

sudo mv /etc/localtime /etc/localtime.bak
sudo ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
result_echo $? "${PROCESS}"
