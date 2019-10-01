#!/usr/bin/env bash
# @(#) Install fish
# Created:     2018/05/03 10:54:13
# Last Change: 2018/06/08 19:19:42.

set -euo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install fish"

gm_echo ">> ${PROCESS^}"
if ! has "brew"; then
    echo info "Install brew frst"
    bash ~/dotfiles/etc/init/osx/install_homebrew.sh
fi

if ! has "fish"; then
    brew install fish
    if [ ! grep -q "/usr/local/bin/fish" /etc/shells ]; then
        sudo bash -c "echo /usr/local/bin/fish >> /etc/shells"
    fi
    # sudo bash -c "echo /usr/local/bin/fish >> /etc/shells"
    # sort /etc/shells | uniq > /etc/shells
    chsh -s /usr/local/bin/fish
fi

# error "ここからエラー！！！"
# FAIL: Fisherman インストール
# Because locked ~/.config
# if [ ! -e "~/.config/fish/functions/fisher.fish" ]; then
fish
if ! has "fisher"; then
    # curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
    curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher

    fisher install z
    fisher install 0rax/fish-bd
    brew install peco
    fisher oh-my-fish/plugin-peco

    curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish

    fish_update_completions
fi

result_echo $? "${PROCESS}"
