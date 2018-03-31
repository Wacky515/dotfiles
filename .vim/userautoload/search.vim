scriptencoding utf-8

" インクリメンタルサーチ
" ※ 検索文字入力で即時検索開始
set incsearch

" 検索時に大文字・小文字を区別しない
set ignorecase
" 検索時に大文字がある場合は大文字・小文字を区別
set smartcase

" 最後のヒットまで検索したら最初のヒットに戻る
set wrapscan

" 検索マッチテキストをハイライト
set hlsearch

" 検索ジャンプを画面中央に表示
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" "/" でvery magic検索
nnoremap /  /\v

" 検索時に "\" や "?" のエスケープを簡素化
" TODO: 動作確認
cnoremap <expr> / getcmdtype() == "/" ? "\/" : "/"
cnoremap <expr> ? getcmdtype() == "?" ? "\?" : "?"

" <Ctrl>h: 垂直分割で "ctags" 表示
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
" <Ctrl>k: 水平分割で "ctags" 表示
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>

" unite-tagsの設定
autocmd BufEnter *
\   if empty(&buftype)
\|      nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord -immediately tag<CR>
\|  endif
