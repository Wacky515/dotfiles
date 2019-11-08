#!/usr/bin/env bash
# @(#) Install init apps in msys2
# Created:     2018/06/07 09:13:38
# Last Change: 2019/11/08 10:29:30.

# MEMO: 単体で動作しない、"setting_pacmanY" から実行すること！！

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

do
    if has ${apps}; then
        pacman -Sy ${apps} --noconfirm
    fi
done

pacman -Syu --noconfirm
pacman -Su  --noconfirm

if has "fish"; then
    curl https://git.io/fisher \
         --create-dirs -sLo \
         ‾/.config/fish/functions/fisher.fish
fi

pip3 install powerline-status

result_echo $? "${PROCESS}"
