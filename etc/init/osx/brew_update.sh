#!bin/bash
# @(#) Update HomeBrew
# Created:     2018/05/21 00:00:00
# Last Change: 2018/05/28 13:03:04.

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="update HomeBrew"
gm_echo ">> ${PROCESS^}"

bash brew update && \
brew upgrade && \
brew cleanup && \
brew cask cleanup && \
brew doctor && \
echo "Brew done $(hostname)" || echo "Error brew $(hostname)"
result_echo $? "${PROCESS}"
