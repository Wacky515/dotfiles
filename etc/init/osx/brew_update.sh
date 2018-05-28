#!bin/bash
# @(#) Update HomeBrew
# Created:     2018/05/21 00:00:00
# Last Change: 2018/05/28 14:08:43.

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="Update HomeBrew"
gm_echo ">> ${PROCESS}"

sudo chown -R $(whoami) \
    /usr/local \
    /usr/local/var/homebrew \
    /usr/local/var/homebrew/locks \
    /usr/local/lib/pkgonfig \
    /usr/local/lib/share/local \
    /usr/local/lib/share/man

bash brew update && \
brew upgrade && \
brew cleanup && \
brew cask cleanup && \
brew doctor && \
# echo "Brew done $(hostname)" || echo "Error brew $(hostname)"
result_echo $? "${PROCESS}"
