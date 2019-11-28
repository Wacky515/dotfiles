#!/bin/bash
# @(#) Echo back result of execute.
# Created:     201*/**/** **:**:**
# Last Change: 2019/11/15 16:25:50.

# # 実行したフォルダに "cd"
# cd `dirname $0`

# # ファイル自身の絶対パス 取得
# path=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
# source ${path}/color_echo.sh

for f in ~/dotfiles/function/*.sh
do
    source ${f}
done

function result_echo(){
    if [ "$1" -eq 0 ]
    then
        gm_echo ">> Success $2"
    else
        rb_echo ">> Fail $2"
    fi
    echo ""
}
