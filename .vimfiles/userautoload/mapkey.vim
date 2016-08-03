scriptencoding utf-8

""" マクロ ＆ キーアサイン篇 """

" 入力モード中 "jj": <Esc>
inoremap jj <Esc>

" "v" + "v": 行末まで選択
vnoremap v $h

" <ESC> + <ESC>: ハイライト消去
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" vimrc、gvimrcを開く
nmap ,v :edit $MYVIMRC<CR>
nmap ,g :edit $MYGVIMRC<CR>
" vimrc、gvimrcを反映
nnoremap <silent> <Space>rv :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>
nnoremap <silent> <Space>rg :<C-u>source $MYGVIMRC<CR>

" "w!!" :スーパーユーザーとして保存（sudoが使える環境限定）
if has('unix') 
    cmap w!! w !sudo tee > /dev/null %
endif

" ":e" などでファイルを開く時、フォルダが存在しない場合は自動作成
function! s:mkdir(dir, force)
    if !isdirectory(a:dir) && (a:force ||
            \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
        call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
endfunction
if has('unix') || has('mac')
    autocmd MyAutoCmd BufWritePre * call s:mkdir(expand('<afile>:p:h'), v:cmdbang)
endif
