#!/usr/bin/env bash
# @(#) Install fish
# Created:     2018/05/03 10:54:13
# Last Change: 2019/11/05 15:23:53.

set -euo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install fish"

gm_echo ">> ${PROCESS^}"

if ! has "brew"; then
    echo info "Install Brew frst"
    bash ~/dotfiles/etc/init/osx/install_homebrew.sh
fi

if ! has "fish"; then
    brew install fish
    if [ ! grep -q "/usr/local/bin/fish" /etc/shells ]; then
        # sudo bash -c "echo /usr/local/bin/fish >> /etc/shells"
        sudo bash -c "echo /usr/local/bin/fish | sudo tee -a /etc/shells"
    else
        gm_echo ">> Already install fish"
    fi
    chsh -s /usr/local/bin/fish
fi

fish

if ! has "fisher"; then
    sudo chmod 777 ~/.config/fish
    # curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
    curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

    fisher install 0rax/fish-bd
    fisher install z

    # curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish

    fish_update_completions
fi

if ! has "peco"; then
    bash ~/dotfhles/etc/init/osx/settings/install_peco.sh
    fisher add oh-my-fish/plugin-peco
fi

result_echo $? "${PROCESS}"