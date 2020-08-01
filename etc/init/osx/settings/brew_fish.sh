#!/usr/bin/env bash
# @(#) Install fish
# Created:     2018/05/03 10:54:13
# Last Change: 2020/08/01 21:17:56.

set -euo pipefail
export LC_ALL=C

## 関数
[ -f ~/.bash_function ] && source ~/.bash_function

readonly PROCESS="install fish"

gm_echo ">> Start ${PROCESS}"

if ! has "brew"; then
    echo info "Install Brew first"
    bash ~/dotfiles/etc/init/osx/settings/install_homebrew.sh
fi

if ! has "fish"; then
    brew install fish
    if [ ! grep -q "/usr/local/bin/fish" /etc/shells ]; then
        sudo bash -c "echo /usr/local/bin/fish | sudo tee -a /etc/shells"
    else
        gm_echo ">> Already install fish"
    fi
    chsh -s /usr/local/bin/fish
fi

# fish

if ! has "fisher"; then
    sudo chmod 777 ~/.config/fish
    curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

    fisher install 0rax/fish-bd
    fisher install z

    fish_update_completions
fi
fisher add oh-my-fish/theme-bobthefish

if ! has "peco"; then
    bash ~/dotfhles/etc/init/osx/settings/install_peco.sh
    fisher add oh-my-fish/plugin-peco
fi

result_echo $? "${PROCESS}"
