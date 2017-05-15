" <Leader>p: 編集中のファイルをブラウザで表示
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap <Leader>p <Plug>(openbrowser-smart-search)
vmap <Leader>p <Plug>(openbrowser-smart-search)

" 編集中のファイルをブラウザで開く
" MEMO: このプラグインの機能ではない
if has("win32") || has("win64")
    nmap <Leader>b :! start chrome.exe "%:p"<CR>
    vmap <Leader>b :! start chrome.exe "%:p"<CR>
endif
