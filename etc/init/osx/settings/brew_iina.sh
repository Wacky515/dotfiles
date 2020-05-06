#!/usr/bin/env bash
# @(#) Install IINA
# Created:     2020/05/06 10:55:15
# Last Change: 2020/05/06 10:55:26.

set -ueo pipefail
export LC_ALL=C

## 関数
[ -f ~/.bash_function ] && source ~/.bash_function

readonly         APPS="IINA"
readonly  ACTION_LOWC="install"
readonly  ACTION_PROP="Install"
readonly PROCESS_LOWC=${ACTION_LOWC}" "${APPS}
readonly PROCESS_PROP=${ACTION_PROP}" "${APPS}

gm_echo ">> Start ${PROCESS_LOWC}"

if ! has "brew"; then
    echo info ">> Install Brew first"
    bash ~/dotfiles/etc/init/osx/install_homebrew.sh
fi
brew cask install iina

result_echo $? "${PROCESS_LOWC}"
