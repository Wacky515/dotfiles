#!/usr/bin/env bash
# @(#) Install VLC
# Created:     2020/05/06 10:42:50
# Last Change: 2020/05/06 10:52:09.

set -ueo pipefail
export LC_ALL=C

## 関数
[ -f ~/.bash_function ] && source ~/.bash_function

readonly         APPS="VLC"
readonly  ACTION_LOWC="install"
readonly  ACTION_PROP="Install"
readonly PROCESS_LOWC=${ACTION_LOWC}" "${APPS}
readonly PROCESS_PROP=${ACTION_PROP}" "${APPS}

gm_echo ">> Start ${PROCESS_LOWC}"

if ! has "brew"; then
    echo info ">> Install Brew first"
    bash ~/dotfiles/etc/init/osx/install_homebrew.sh
fi
brew cask install vlc

result_echo $? "${PROCESS_LOWC}"
