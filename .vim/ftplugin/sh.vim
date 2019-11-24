scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2019/11/21 15:21:32.

" スクリプトを実行
nnoremap <F5> :w <ENTER> :!./%;read <ENTER>

" ↓参考
" noremap <F5> <Esc>:call RUN()<ENTER>
" function! RUN()
"   :w|!./%;read
" endfunction
