#!/usr/bin/env bash
# @(#) Install init apps in msys2
# Created:     2018/06/07 09:13:38
# Last Change: 2019/11/07 09:39:35.

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

# pacman -Sy bc --noconfirm
# pacman -Sy fish --noconfirm
# pacman -Sy git --noconfirm
# pacman -Sy man --noconfirm
# pacman -Sy mingw64/mingw-w64-x86_64-pcre2 --noconfirm
# pacman -Sy openssh --noconfirm
# pacman -Sy pcre --noconfirm
# pacman -Sy pcre2 --noconfirm
# pacman -Sy tmux --noconfirm
# pacman -Sy zsh --noconfirm

# TEST:
apps=(bc \
      fish \
      git \
      man \
      mingw64/mingw-w64-x86_64-pcre2 \
      openssh \
      pcre \
      pcre2 \
      tmux \
      zsh)

do
    pacman -Sy ${apps} --noconfirm
done

pacman -Syu --noconfirm
pacman -Su  --noconfirm

# TEST:
# if type pip3 --version > /dev/null 3>&1 ; then
if ! has pip3; then
    pip3 install powerline-status
else
    echo ">> Not install Python"
fi

result_echo $? "${PROCESS}"
