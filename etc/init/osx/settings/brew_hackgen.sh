#!/usr/bin/env bash
# @(#) Install HackGen
# Created:     2020/05/03 22:30:18
# Last Change: 2020/05/06 10:56:39.

set -ueo pipefail
export LC_ALL=C

## 関数
[ -f ~/.bash_function ] && source ~/.bash_function

readonly         APPS="HackGen"
readonly  ACTION_LOWC="install"
readonly  ACTION_PROP="Install"
readonly PROCESS_LOWC=${ACTION_LOWC}" "${APPS}
readonly PROCESS_PROP=${ACTION_PROP}" "${APPS}

gm_echo ">> Start ${PROCESS_LOWC}"

if ! has "brew"; then
    echo info ">> Install Brew first"
    bash ~/dotfiles/etc/init/osx/install_homebrew.sh
fi
brew tap homebrew/cask-fonts
brew cask install font-hackgen

result_echo $? "${PROCESS_LOWC}"
