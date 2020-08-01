#!/usr/bin/env bash
# @(#) Install wget
# Created:     2020/08/01 21:15:08
# Last Change: 2020/08/01 21:31:06.

set -euo pipefail
export LC_ALL=C

## 関数
[ -f ~/.bash_function ] && source ~/.bash_function

readonly         APPS="wget"
readonly  ACTION_LOWC="install"
readonly  ACTION_PROP="Install"
readonly PROCESS_LOWC=${ACTION_LOWC}" "${APPS}
readonly PROCESS_PROP=${ACTION_PROP}" "${APPS}

gm_echo ">> Start ${PROCESS_LOWC}"

if ! has "brew"; then
    echo info "Install Brew first"
    bash ~/dotfiles/etc/init/osx/settings/install_homebrew.sh
fi

brew install wget

result_echo $? "${PROCESS_LOWC}"
