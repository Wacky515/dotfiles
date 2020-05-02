#!/usr/bin/env bash
# @(#) Install Python3.*
# Created:     2019/11/06 12:37:08
# Last Change: 2020/05/02 23:12:14.

set -ueo pipefail
export LC_ALL=C

## 関数
[ -f ~/.bash_function ] && source ~/.bash_function

readonly         APPS="python"
readonly  ACTION_LOWC="install"
readonly  ACTION_PROP="Install"
readonly PROCESS_LOWC=${ACTION_LOWC}" "${APPS}
readonly PROCESS_PROP=${ACTION_PROP}" "${APPS}

gm_echo ">> Start ${PROCESS_LOWC}"

if ! has "brew"; then
    ym_echo info "Install Brew frst"
    bash ~/dotfiles/etc/init/osx/settings/install_homebrew.sh
fi

gm_echo ">> Check ${APPS} installed or not"
if ! has ${APPS}; then
    brew install ${APPS}
else
    gm_echo ">> Already installed ${APPS} 3"
fi

result_echo $? "${PROCESS_LOWC}"
