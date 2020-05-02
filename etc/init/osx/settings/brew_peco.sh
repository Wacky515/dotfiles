#!/usr/bin/env bash
# @(#) Install Peco
# Created:     2019/11/05 15:20:15
# Last Change: 2020/05/02 23:10:16.

set -ueo pipefail
export LC_ALL=C

## 関数
[ -f ~/.bash_function ] && source ~/.bash_function

readonly PROCESS="install Peco"

gm_echo ">> ${PROCESS}"

if ! has "brew"; then
    echo info "Install Brew frst"
    bash ~/dotfiles/etc/init/osx/install_homebrew.sh
fi

if ! has "peco"; then
    brew install peco
else
    echo ">> Already installed Peco"
fi

result_echo $? "${PROCESS}"
