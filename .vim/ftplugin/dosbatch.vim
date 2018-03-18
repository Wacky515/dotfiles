scriptencoding utf-8

set fileformat=dos
set encoding=utf-8
" set encoding=sjis
" set encoding=cp932

" FIXME: 効かない
" スクリプトを実行
nnoremap <F5> :w <ENTER> :!./% <ENTER>
