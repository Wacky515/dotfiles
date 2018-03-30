scriptencoding utf-8
" Last Change: 2018/03/30 14:07:07.

" <Leader>p: 編集中のファイルをブラウザで表示
" disable netrw's gx mapping.
let g:netrw_nogx = 1
nmap <Leader>p <Plug>(openbrowser-smart-search)
vmap <Leader>p <Plug>(openbrowser-smart-search)

" 編集中のファイルをブラウザで開く
" MEMO: このプラグインの機能ではない
if has("win32") || has("win64")
    nmap <Leader>br :<C-u>! start chrome.exe "%:p"<CR>
    vmap <Leader>br :<C-u>! start chrome.exe "%:p"<CR>
endif
