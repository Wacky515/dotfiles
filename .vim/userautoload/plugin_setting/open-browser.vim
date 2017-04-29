" <Leader>p: 編集中のファイルをブラウザで表示
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap <Leader>p <Plug>(openbrowser-smart-search)
vmap <Leader>p <Plug>(openbrowser-smart-search)
