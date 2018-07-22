scriptencoding utf-8
" Last Change:2018/07/21 19:38:12.

if has("win32")
    " "Ref-vim" 設定 "set encoding" より上に書くこと
    let &termencoding = &encoding
endif

set encoding=utf-8
" set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileencodings=utf-8,sjis,iso-2022-jp,euc-jp
set fileformats=unix,dos,mac
