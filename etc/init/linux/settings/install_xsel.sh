#!/bin/bash
# @(#) Intall xsel
# �N���b�v�{�[�h���L

source ~/dotfiles/function/result_echo.sh

readonly PROCESS="install xsel"

ym_echo ">> ${PROCESS^}"
sudo apt -y install xsel
result_echo $? "${PROCESS}"
