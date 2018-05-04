#!/bin/bash
# @(#) Install HomeBrew
# Created:     2018/05/03 10:58:45
# Last Change: 2018/05/03 12:43:27.

source ~/dotfiles/function/result_echo.sh
source ~/dotfiles/function/color_echo.sh

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
fi
