scriptencoding utf-8
" Created:     2021/12/25 19:05:37
" Last Change: 2022/03/26 20:54:32.

" ---------------------------------------------------------------------------
"  基本設定
" ---------------------------------------------------------------------------
set syntax=freebasic

set encoding=utf-8
set fileformat=dos
set fileformats=dos,unix
set fileencoding=sjis
set fileencodings=utf-8,sjis,cp932,iso-2022-jp,euc-jp

" タブの設定
setlocal smarttab
setlocal expandtab
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

syntax keyword txtComment '
" syntax keyword txtConstant 定数
" syntax match txtString /文字列/
" syntax match txtIdentifier /何これ/
" syntax match txtError /エラー/

highlight link txtComment Comment
" highlight link txtConstant Constant
" highlight link txtString String
" highlight link txtIdentifier Identifier
" highlight link txtError Error

syntax keyword xTodo TODO contained
syntax match xComment /%.*/ contains=xTodo
