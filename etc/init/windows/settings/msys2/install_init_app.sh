#!/usr/bin/env bash
# @(#) Install init apps in msys2
# Created:     2018/06/07 09:13:38
# Last Change: 2019/01/24 08:34:45.

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install init apps in Msys2"

gm_echo ">> ${PROCESS^}"
# ym_echo ">> Start "

pacman -Syuu --noconfirm

pacman -Sy pacman --noconfirm
pacman -Syu --noconfirm
pacman -Su --noconfirm

pacman -Sy man --noconfirm
pacman -Sy openssh --noconfirm
pacman -Sy tmux --noconfirm
pacman -Sy git --noconfirm
pacman -Sy zsh --noconfirm
pacman -Sy bc --noconfirm
pacman -Sy pcre --noconfirm
pacman -Sy pcre2 --noconfirm
pacman -Sy mingw64/mingw-w64-x86_64-pcre2 --noconfirm
pacman -Sy fish --noconfirm

pacman -Syu --noconfirm
pacman -Su --noconfirm

result_echo $? "${PROCESS}"

