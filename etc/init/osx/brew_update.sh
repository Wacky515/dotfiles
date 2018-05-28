#!bin/bash
# @(#) Update HomeBrew
# Created:     2018/05/21 00:00:00
# Last Change: 2018/05/28 13:53:07.

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="update HomeBrew"
gm_echo ">> ${PROCESS}"

sudo chown -R $(whoami) /usr/local/var/homebrew

bash brew update && \
brew upgrade && \
brew cleanup && \
brew cask cleanup && \
brew doctor && \
# echo "Brew done $(hostname)" || echo "Error brew $(hostname)"
result_echo $? "${PROCESS}"
