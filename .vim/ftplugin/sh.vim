scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2023/03/12 08:19:13.

" ------------------------------------------------------------------------------
"  マップキー
" ------------------------------------------------------------------------------
" スクリプトを実行
nnoremap <F5> :<C-u>w <ENTER> :!./%;read <ENTER>

" REF:  " {{{
" noremap <F5> <Esc>:call RUN()<ENTER>
" function! RUN()
"   :w|!./%;read
" endfunction
" }}}
