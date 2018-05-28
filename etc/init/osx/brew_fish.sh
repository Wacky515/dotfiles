#!/bin/bash
# @(#) Install fish
# Created:     2018/05/03 10:54:13
# Last Change: 2018/05/28 16:16:07.

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

brew install fish
# ym_echo ">> Add /usr/local/bin/fish in /etc/shells"
# sudo vi /etc/shells
sudo bash -c "echo /usr/local/bin/fish >> /etc/shells"
chsh -s /usr/local/bin/fish

curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
fisher install z
fisher install 0rax/fish-bd
brew install peco
fisher oh-my-fish/plugin-peco

curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish

fish_update_completions
result_echo $? "${PROCESS}"
