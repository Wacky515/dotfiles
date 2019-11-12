#!/bin/bash
# @(#) yum update
# Created:     2018/05/10 18:24:34
# Last Change: 2018/05/10 18:30:07.

source ~/dotfiles/function/result_echo.sh
source ~/dotfiles/function/color_echo.sh

readonly PROCESS="yum update"

ym_echo ">> ${PROCESS^}"

sudo yum update && \
sudo yum -y autoremove && \
sudo yum -y clean all

result_echo $? "${PROCESS}"
