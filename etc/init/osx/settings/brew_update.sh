#!/usr/bin/env bash
# @(#) Update HomeBrew
# Created:     2018/05/21 **:**:**
# Last Change: 2020/05/02 23:14:31

set -ueo pipefail
export LC_ALL=C

## 関数
[ -f ~/.bash_function ] && source ~/.bash_function

readonly         APPS="HomeBrew"
readonly  ACTION_LOWC="update"
readonly  ACTION_PROP="Update"
readonly PROCESS_LOWC=${ACTION_LOWC}" "${APPS}
readonly PROCESS_PROP=${ACTION_PROP}" "${APPS}

gm_echo ">> Start ${PROCESS_LOWC}"

brew update && \
brew upgrade && \
brew cleanup && \
brew cask cleanup && \
brew doctor && \

result_echo $? "${PROCESS_LOWC}"
