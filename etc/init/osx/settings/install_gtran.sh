#!/bin/bash
# @(#) Install gtran
# Created:     2020/04/15 21:20:26
# Last Change: 2020/04/15 21:40:21.

set -ueo pipefail
export LC_ALL=C

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="install gtran"

gm_echo ">> ${PROCESS^}"

git clone https://github.com/skanehira/gtran.git
cd gtran
go install

result_echo $? "${PROCESS}"

# シェルの再起動
exec $SHELL -l
