scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2018/12/17 14:40:01.

" ブラウザの設定"
" MEMO: "open-browser.vim" を使うので不要
""" Mac の場合  "{{{
" if has("mac")
"     let g:previm_open_cmd = "open -a Safari"

"" Windows の場合
" FIXME: "vimproc" エラーになる
" elseif has("win64")
"     let g:previm_open_cmd = 'C:\\Program\ Files\ (x86)\\Google\\Chrome\\Application\\chrome.exe'
" elseif has("win32")
"     let g:previm_open_cmd = 'C:\\Program\ Files\\Google\\Chrome\\Application\\chrome.exe'
"     " let g:previm_open_cmd = "C:/Program Files/Google/Chrome/Application/chrome.exe"
"     " let g:previm_open_cmd = "C:\Program Files\Google\Chrome\Application\chrome.exe"
"     " let g:previm_open_cmd = ""
"     " let g:previm_open_cmd = "open -a Chrome"
" endif
" }}}

" <Leader>md: 編集中のファイルをブラウザで表示（Markdown用）
nnoremap <silent> <Leader>md :<C-u>PrevimOpen<CR>

" <Leader>j: Vimのカーソル移動とブラウザの下スクロールを連動
nmap <silent> <Leader>j <Plug>(ChromeAutoScrollDown)
" <Leader>js: 下スクロール連動を停止
nmap <Leader>js <Plug>(ChromeAutoScrollDownStop)
" <Leader>k: Vimのカーソル移動とブラウザの上スクロールを連動
nmap <silent> <Leader>k <Plug>(ChromeAutoScrollUp)
" <Leader>ks: 上スクロール連動を停止
nmap <Leader>ks <Plug>(ChromeAutoScrollUpStop)

" GitHub的な見た目
" let g:previm_disable_default_css = 1
" let g:previm_custom_css_path = "~/dotfiles/.vim/template/previm/markdown.css"

