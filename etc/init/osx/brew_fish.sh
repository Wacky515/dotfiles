#!/bin/bash
# @(#) Install fish
# Created:     2018/05/03 10:54:13
# Last Change: 2018/05/03 11:47:45.

source ~/dotfiles/function/result_echo.sh
source ~/dotfiles/function/color_echo.sh

ym_echo ">> Start install fish"
sh ~/dotfiles/etc/init/osx/install_homebrew.sh

brew install fish
ym_echo ">> Add /usr/local/bin/fish in /etc/shells"
sudo vi /etc/shells
chsh -s /usr/local/bin/fish

curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
fisher install z
fisher install 0rax/fish-bd
brew install peco
fisher oh-my-fish/plugin-peco

curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish

fish_update_completions
