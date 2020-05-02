#!/usr/bin/env bash
# @(#) Install go
# Created:     2020/04/16 17:19:09
# Last Change: 2020/05/02 23:09:39.

set -ueo pipefail
export LC_ALL=C

## 関数
[ -f ~/.bash_function ] && source ~/.bash_function

readonly         APPS="go"
readonly  ACTION_LOWC="install"
readonly  ACTION_PROP="Install"
readonly PROCESS_LOWC=${ACTION_LOWC}" "${APPS}
readonly PROCESS_PROP=${ACTION_PROP}" "${APPS}

gm_echo ">> Start ${PROCESS_LOWC}"

if has "go"; then
    if ! has "brew"; then
        echo info ">> Install Brew frst"
        bash ~/dotfiles/etc/init/osx/install_homebrew.sh
    fi
    brew install go
else
    echo ">> Already installed go"
fi

result_echo $? "${PROCESS_LOWC}"
