scriptencoding utf-8

" スクリプトを実行
nnoremap <F5> :w <ENTER> :!./%;read <ENTER>

" ↓参考
" noremap <F5> <ESC>:call RUN()<ENTER>
" function! RUN()
"   :w|!./%;read
" endfunction
