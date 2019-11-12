#!/usr/bin/env bash
# @(#) Install init apps in msys2
# Created:     2018/06/07 09:13:38
# Last Change: 2019/11/12 14:48:37.
# MEMO: "setting_pacman.cmd" から実行のこと！！

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install init apps in Msys2"

gm_echo ">> Start ${PROCESS}"

pacman -Syuu      --noconfirm

pacman -Sy pacman --noconfirm
pacman -Syu       --noconfirm
pacman -Su        --noconfirm

apps=(bc \
      fish \
      git \
      man \
      mingw64/mingw-w64-x86_64-pcre2 \
      openssh \
      pcre \
      pcre2 \
      python \
      python3-pip \
      tmux \
      zsh)

for a in ${apps[@]}
do
    gm_echo ">> Check installed ${a} or not"
    if ! has ${a}; then
        gm_echo ">> Install ${a}"
        pacman -Sy ${apps} --noconfirm
    else
        gm_echo ">> Already installed ${a}"
    fi
done

pacman -Syu --noconfirm
pacman -Su  --noconfirm

# pip3 install powerline-status
pip install powerline-status

result_echo $? "${PROCESS}"
