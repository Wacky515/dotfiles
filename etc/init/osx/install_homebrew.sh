#!/usr/bin/env bash
# @(#) Install HomeBrew
# Created:     2018/05/03 10:58:45
# Last Change: 2018/06/03 21:53:42.

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

# gm_echo ">> Check mas installed or not"
# brew install > /dev/null 2>&1
# if [ ! $? -eq 0 ]; then
#     gm_echo ">> Install mas"
    brew install argon/mas/mas
    # brew doctor
# else
#     gm_echo ">> Installed mas"
# fi

# gm_echo ">> Check brew-file installed or not"
# brew-file help > /dev/null 2>&1
# if [ ! $? -eq 0 ]; then
#     gm_echo ">> Install brew-file"
    brew install rcmdnk/file/brew-file
    brew file install Brewfile
    ln ~/dotfiles/etc/init/osx/brewfile/Brewfile ~/.config
    brew file install Brewfile
# else
#     gm_echo ">> Installed brew-file"
# fi

bash ./brew_update.sh

warn "ここからエラー！！！"

brew file install Brewfile
cp ~/dotfiles/etc/init/osx/brewfile/Brewfile ~/.config
brew file install Brewfile

result_echo $? "${PROCESS}"
