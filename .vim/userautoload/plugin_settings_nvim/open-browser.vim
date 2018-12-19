scriptencoding utf-8

" Last Change: 2018/12/17 14:41:24.

" <Leader>p: カーソル下を "Google検索"
" disable netrw's gx mapping.
let g:netrw_nogx = 1
nmap <Leader>p <Plug>(openbrowser-smart-search)
vmap <Leader>p <Plug>(openbrowser-smart-search)

if has("win64")
    let g:previm_open_cmd =
                \ 'C:\\Program\ Files\ (x86)\\Google\\Chrome\\Application\\chrome.exe'
elseif has("win32")
    let g:previm_open_cmd =
                \ 'C:\\Program\ Files\\Google\\Chrome\\Application\\chrome.exe'
endif

" 編集中のファイルをブラウザで表示（汎用）
" MEMO: このプラグインの機能ではない
if has("win32") || has("win64")
    nmap <Leader>br :<C-u>! start chrome.exe "%:p"<CR>
    vmap <Leader>br :<C-u>! start chrome.exe "%:p"<CR>
endif

