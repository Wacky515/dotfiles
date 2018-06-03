#!/bin/bash
# @(#) Install HomeBrew
# Created:     2018/05/03 10:58:45
# Last Change: 2018/06/03 19:54:01.

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install HomeBrew"

gm_echo ">> ${PROCESS^}"
gm_echo ">> Check HomeBrew installed or not"

if has brew; then
    gm_echo ">> Already installed brew"
    bash ./brew_update.sh

else
    gm_echo ">> Start install brew"

    xcode-select --install
    xcode-select: note: install requested for command line developer tools

    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"k

    brew tap caskroom/cask
    brew tap
    brew tap cskroom/versions

    brew doctor

    brew install argon/mas/mas
    brew install rcmdnk/file/brew-file

    brew file install Brewfile
    # cp ./brewfile ~/.config
    cp ~/dotfiles/etc/init/osx/brewfile/Brewfile ~/.config
    brew file install Brewfile

    bash ./brew_update.sh
fi

warn "ここからエラー！！！"
brew file install Brewfile
cp ~/dotfiles/etc/init/osx/brewfile/Brewfile ~/.config
brew file install Brewfile

result_echo $? "${PROCESS}"
