#!/usr/bin/env bash
# @(#) Install Bash 4.*
# Created:     2019/11/05 15:38:58
# Last Change: 2020/05/06 10:47:26.

set -ueo pipefail
export LC_ALL=C

## 関数
[ -f ~/.bash_function ] && source ~/.bash_function

readonly         APPS="Bash 4.*"
readonly  ACTION_LOWC="install"
readonly  ACTION_PROP="Install"
readonly PROCESS_LOWC=${ACTION_LOWC}" "${APPS}
readonly PROCESS_PROP=${ACTION_PROP}" "${APPS}

gm_echo ">> Start ${PROCESS_LOWC}"

if [ `bash --version | grep '2007'` ] ; then
    if ! has "brew"; then
        echo info ">> Install Brew first"
        bash ~/dotfiles/etc/init/osx/install_homebrew.sh
    fi
    brew install bash
else
    echo ">> Already Bash 4.*"
fi

result_echo $? "${PROCESS_LOWC}"
