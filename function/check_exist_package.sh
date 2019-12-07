#!/bin/bash
# @(#) Check package exist
# Created:     2018/05/27 16:31:01
# Last Change: 2019/11/14 12:33:29.

# パッケージの存在確認
function has() {
    type "$1" > /dev/null 2>&1
}
