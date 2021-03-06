#!/usr/bin/env bash
# @(#) Install HomeBrew
# Created:     2018/05/03 10:58:45
# Last Change: 2020/05/02 23:23:46.

set -ueo pipefail
export LC_ALL=C

## 関数
[ -f ~/.bash_function ] && source ~/.bash_function

readonly         APPS="HomeBrew"
readonly     APPS_CMD="brew"
readonly  ACTION_LOWC="install"
readonly  ACTION_PROP="Install"
readonly PROCESS_LOWC=${ACTION_LOWC}" "${APPS}
readonly PROCESS_PROP=${ACTION_PROP}" "${APPS}

gm_echo ">> Start ${PROCESS_LOWC}"

gm_echo ">> Check ${APPS} installed or not"
if ! has ${APPS_CMD}; then
    gm_echo ">> Start ${PROCESS_LOWC}"

    xcode-select --install
    xcode-select: note: install requested for command line developer tools

    /usr/bin/ruby -e \
        "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    gm_echo ">> Already installed ${APPS}, Start update"
    bash ./brew_update.sh
fi

gm_echo ">> Check tap installed or not"
brew tap > /dev/null 2>&1
if [ ! $? -eq 0 ]; then
    gm_echo ">> Install tap"
    brew tap caskroom/cask
    brew tap cskroom/versions
    brew doctor
else
    gm_echo ">> Already installed tap"
fi

brew install argon/mas/mas
brew install rcmdnk/file/brew-file

if [ ! -f ~/.config/brewfile/Brewfile ]; then
    sudo mkdir -m 777 ~/.config/brewfile
    # sudo ln -s ~/dotfiles/etc/init/osx/brewfile/Brewfile \
    sudo ln -s ~/Library/Mobile Documents/com~apple~CloudDocs/Settings/BrewFile/Brewfile \
        ~/.config/brewfile
fi

case "$hostname" in
    "ProSalad13-2018.local" ) \
        cd /Users/wacky515/Library/Mobile Documents/com~apple~CloudDocs/Settings/BrewFile/macbook_pro
    brew tap Homebrew/bundle
    cd - ;;
    "SaladBook.local" ) \
        cd /Users/skydog/Library/Mobile Documents/com~apple~CloudDocs/Settings/BrewFile/macbook
    brew tap Homebrew/bundle
    cd - ;;
esac

# brew file install Brewfile
brew file install
bash ./brew_update.sh

result_echo $? "${PROCESS_LOWC}"
