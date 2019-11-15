#!/bin/bash
# @(#) Echo back result of execute.
# Created:     201*/**/** **:**:**
# Last Change: 2019/11/14 12:38:08.

# 実行したフォルダに "cd"
cd `dirname $0`

# ファイル自身の絶対パス 取得
path=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
source ${path}/color_echo.sh

function result_echo(){
    # TODO: 共通関数に切り出し
    if [ "$1" -eq 0 ]
    then
        ym_echo ">> Success $2"
    else
        rb_echo ">> Fail $2"
    fi
    echo ""
}
