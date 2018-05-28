#!/bin/bash
# @(#) Install HomeBrew
# Created:     2018/05/03 10:58:45
# Last Change: 2018/05/28 12:53:02.

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install HomeBrew"

gm_echo ">> ${PROCESS^}"
gm_echo ">> Check HomeBrew install or not"

# brew --version > /dev/null 2>&1

# if [ $? = 0 ]
if has brew; then
    brew update
    gm_echo ">> Already installed brew"

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
    cp ./brewfile ~/.config
    brew file install Brewfile

    bash ./brew_update.sh
fi
result_echo $? "${PROCESS}"
