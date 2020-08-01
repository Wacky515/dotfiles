#!/usr/bin/env bash
# @(#) Install iTerm2
# Created:     2020/05/06 11:00:11
# Last Change: 2020/08/01 21:24:38.

set -ueo pipefail
export LC_ALL=C

## 関数
[ -f ~/.bash_function ] && source ~/.bash_function

readonly         APPS="iTerm2"
readonly  ACTION_LOWC="install"
readonly  ACTION_PROP="Install"
readonly PROCESS_LOWC=${ACTION_LOWC}" "${APPS}
readonly PROCESS_PROP=${ACTION_PROP}" "${APPS}

gm_echo ">> Start ${PROCESS_LOWC}"

if ! has "brew"; then
    echo info ">> Install Brew first"
    bash ~/dotfiles/etc/init/osx/settings/install_homebrew.sh
fi
brew cask install iterm2

result_echo $? "${PROCESS_LOWC}"
