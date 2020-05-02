#!/usr/bin/env bash
# @(#) Install VS Code
# Created:     2019/11/01 11:48:28
# Last Change: 2020/05/02 23:15:24

set -ueo pipefail
export LC_ALL=C

## 関数
[ -f ~/.bash_function ] && source ~/.bash_function

readonly PROCESS="install VS Code"

gm_echo ">> ${PROCESS^}"

if ! has "brew"; then
    echo info ">> Install Brew frst"
    bash ~/dotfiles/etc/init/osx/install_homebrew.sh
fi

if ! has "code"; then
    brew cask install visual-studio-code
else
    echo ">> Already VS Code"
fi

result_echo $? "${PROCESS}"
