#!/usr/bin/env bash
# @(#) Install Cica
# Created:     201*/**/** **:**:**
# Last Change: 2020/08/01 22:01:30.

set -ueo pipefail
export LC_ALL=C

## 関数
[ -f ~/.bash_function ] && source ~/.bash_function

readonly         APPS="Cica"
readonly  ACTION_LOWC="install"
readonly  ACTION_PROP="Install"
readonly PROCESS_LOWC=${ACTION_LOWC}" "${APPS}
readonly PROCESS_PROP=${ACTION_PROP}" "${APPS}

gm_echo ">> Start ${PROCESS_LOWC}"

if ! has "brew"; then
    echo info "Install Brew first"
    bash ~/dotfiles/etc/init/osx/settings/install_homebrew.sh
fi

if ! has "wget"; then
    echo info "Install wget"
    bash ~/dotfiles/etc/init/osx/settings/brew_wget.sh
fi

mkdir -p -m 777 ~/Downloads/.fonts/
cd ~/Downloads/.fonts/
wget https://github.com/miiton/Cica/releases/download/v5.0.2/Cica_v5.0.2_with_emoji.zip

unzip Cica_v5.0.2_with_emoji.zip

# sudo fc-cache -fv
fc-cache -fv

cd ~/Downloads/
rm -rf .fonts/

result_echo $? "${PROCESS_LOWC}"
