#!/usr/bin/env bash
# @(#) __START__
# Created:     __DATE__
# Last Change: 2020/05/06 10:46:17

set -ueo pipefail
export LC_ALL=C

## 関数
[ -f ~/.bash_function ] && source ~/.bash_function

readonly         APPS="***"
readonly  ACTION_LOWC="install"
readonly  ACTION_PROP="Install"
readonly PROCESS_LOWC=${ACTION_LOWC}" "${APPS}
readonly PROCESS_PROP=${ACTION_PROP}" "${APPS}

gm_echo ">> Start ${PROCESS_LOWC}"

if ! has "brew"; then
    ym_echo info "Install Brew first"
    bash ~/dotfiles/etc/init/osx/settings/install_homebrew.sh
fi

gm_echo ">> Check ${APPS} installed or not"
if ! has ${APPS}; then
    gm_echo ">> ${ACTION_PROP}"
    brew install ${APPS}
else
    gm_echo ">> Already installed ${APPS}"
fi

result_echo $? "${PROCESS_LOWC}"
