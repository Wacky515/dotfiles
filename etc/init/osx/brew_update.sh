#!bin/bash
# @(#) Update HomeBrew
# Created:     2018/05/21 00:00:00
# Last Change: 2018/05/27 16:55:58.

source ~/dotfiles/function/result_echo.sh
source ~/dotfiles/function/color_echo.sh

readonly PROCESS="update HomeBrew"
ym_echo ">> ${PROCESS^}"

bash brew update && \
brew upgrade && \
brew cleanup && \
brew cask cleanup && \
brew doctor && \
echo "Brew done $(hostname)" || echo "Error brew $(hostname)"
result_echo $? "${PROCESS}"
