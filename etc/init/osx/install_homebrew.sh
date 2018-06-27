#!/usr/bin/env bash
# @(#) Install HomeBrew
# Created:     2018/05/03 10:58:45
# Last Change: 2018/06/03 22:53:57.

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install HomeBrew"

gm_echo ">> ${PROCESS^}"
gm_echo ">> Check HomeBrew installed or not"

bash ./setting_install_any_apps.sh

if has brew; then
    gm_echo ">> Already installed brew"
    bash ./brew_update.sh

else
    gm_echo ">> Start install brew"

    xcode-select --install
    xcode-select: note: install requested for command line developer tools

    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

gm_echo ">> Check tap installed or not"
brew tap > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    gm_echo ">> Install tap"
    brew tap caskroom/cask
    brew tap cskroom/versions
    brew doctor
else
    gm_echo ">> Installed tap"
fi

brew install argon/mas/mas
brew install rcmdnk/file/brew-file
if [ ! -f ~/.config/brewfile/Brewfile ]; then
    sudo mkdir ~/.config/brewfile
    sudo ln -s ~/dotfiles/etc/init/osx/brewfile/Brewfile \
        ~/.config/brewfile
fi
# brew file install Brewfile
brew file install
bash ./brew_update.sh

result_echo $? "${PROCESS}"
