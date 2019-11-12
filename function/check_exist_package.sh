#!/bin/bash
# @(#) Check package exist
# Created:     2018/05/27 16:31:01
# Last Change: 2018/05/27 16:32:05.

# パッケージの存在確認
has() {
    type "$1" > /dev/null 2>&1
}
