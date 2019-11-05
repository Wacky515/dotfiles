#!bin/bash
# @(#) Update HomeBrew
# Created:     2018/05/21 00:00:00
# Last Change: 2019/11/05 15:42:24.

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="update HomeBrew"
gm_echo ">> ${PROCESS^}"

brew update && \
brew upgrade && \
brew cleanup && \
brew cask cleanup && \
brew doctor && \
result_echo $? "${PROCESS}"
