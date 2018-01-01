#!/bin/bash
# @(#) Intall xsel
# $B%/%j%C%W%\!<%I6&M-(B

source ~/dotfiles/function/result_echo.sh

readonly PROCESS="install xsel"

ym_echo ">> ${PROCESS^}"
sudo apt -y install xsel
result_echo $? "${PROCESS}"
