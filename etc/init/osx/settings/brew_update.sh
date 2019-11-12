#!bin/bash
# @(#) Update HomeBrew
# Created:     2018/05/21 00:00:00
# Last Change: 2019/11/06 11:53:39.

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

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
