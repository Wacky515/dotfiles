#!/bin/bash
# @(#) Initialize OS X
# Created:     2018/05/03 10:58:45
# Last Change: 2018/05/27 15:44:18.

source ~/dotfiles/function/result_echo.sh
source ~/dotfiles/function/color_echo.sh

readonly PROCESS="init OSX"

ym_echo ">> ${PROCESS^}"
ym_echo ">> Start check HomeBrew install or not"

brew --version >/dev/null 2>&1

if [ $? = 0 ]
then
    brew update
    ym_echo ">> Already installed brew"

else
    ym_echo ">> Install brew"

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
    cp ./brewfile ~/.config
    brew file install Brewfile

    bash ./brew_update.sh
fi
result_echo $? "${PROCESS}"
