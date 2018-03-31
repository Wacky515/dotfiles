scriptencoding utf-8
" Last Change: 2018/03/27 20:54:43.

set fileformat=dos
set encoding=utf-8
" set encoding=sjis
" set encoding=cp932

" FIXME: 効かない
" スクリプトを実行
nnoremap <F5> :w <ENTER> :!./% <ENTER>
