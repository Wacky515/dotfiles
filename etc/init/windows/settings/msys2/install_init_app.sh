#!/usr/bin/env bash
# @(#) Install init apps in msys2
# Created:     2018/06/07 09:13:38
# Last Change: 2018/06/07 09:18:26.

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install init apps in msys2"

gm_echo ">> ${PROCESS^}"
# ym_echo ">> Start "

pacman -Sy pacman
pacman -Syu
pacman -Su

pacman -S man
pacman -S openssh
pacman -S tmux
pacman -S git
pacman -S zsh

result_echo $? "${PROCESS}"

