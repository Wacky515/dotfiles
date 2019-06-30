#!/bin/bash
# @(#) Setting enable install any app
# Created:     2018/06/22 22:32:18
# Last Change: 2018/06/03 18:01:18.

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

readonly PROCESS="setting enable install any apps"

gm_echo ">> ${PROCESS^}"

# "すべてのアプリケーションを許可" を復活
sudo spctl –master-disable

result_echo $? "${PROCESS}"
