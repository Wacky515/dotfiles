#!/bin/bash
# @(#) Check package exist
# Created:     2018/05/27 16:31:01
# Last Change: 2020/04/15 21:44:32.

# パッケージの存在確認
function has() {
    type "$1" > /dev/null 2>&1
}
