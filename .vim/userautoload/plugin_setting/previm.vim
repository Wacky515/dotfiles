"ブラウザの設定"
""" Mac の場合
if has("mac")
    let g:previm_open_cmd = 'open -a Safari'
else
    try
        let g:previm_open_cmd = 'open -a Chrome'
    catch
        let g:previm_open_cmd = 'open -a Firefox'
endif

" <Leader>md: 編集中のファイルをブラウザで表示
nnoremap <silent> <Leader>md :PrevimOpen<CR>

" <Leader>j: Vimのカーソル移動とブラウザの下スクロールを連動
nmap <silent> <Leader>j <Plug>(ChromeAutoScrollDown)
" <Leader>js: 下スクロール連動を停止
nmap <Leader>js <Plug>(ChromeAutoScrollDownStop)

" <Leader>k: Vimのカーソル移動とブラウザの上スクロールを連動
nmap <silent> <Leader>k <Plug>(ChromeAutoScrollUp)
" <Leader>ks: 上スクロール連動を停止
nmap <Leader>ks <Plug>(ChromeAutoScrollUpStop)

" <F5>: 編集中のファイルをブラウザで表示
" nmap <F5> :PrevimOpen<CR>
