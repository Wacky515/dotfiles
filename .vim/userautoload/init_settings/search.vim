scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2023/03/04 18:42:09.

" ------------------------------------------------------------------------------
"  マップキー
" ------------------------------------------------------------------------------
" 検索開始時 ジャンプしない
nnoremap * *Nzz

" 検索ジャンプ 画面中央表示
nnoremap n nzz
nnoremap N Nzz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
" nnoremap * *zz

" "/" で "very magic" 検索
nnoremap /  /\v

" カーソル下の単語を入力した文字で置換
" nnoremap <Leader>re :%s;\<<C-R><C-W>\>;g<Left><Left>;
nnoremap <Leader>re :%s;\<<C-R><C-W>\>;gc<Left><Left><Left>;

" 検索時に "\" や "?" のエスケープを簡素化
" TODO: 動作確認
cnoremap <expr> / getcmdtype() == "/" ? "\/" : "/"
cnoremap <expr> ? getcmdtype() == "?" ? "\?" : "?"

" ------------------------------------------------------------------------------
"  基本設定
" ------------------------------------------------------------------------------
" インクリメンタルサーチ
    " MEMO: 検索文字入力で即時検索開始
set incsearch

" 検索時に大文字・小文字を区別しない
set ignorecase
" 検索時に大文字がある場合は大文字・小文字を区別
set smartcase

" 最後のヒットまで検索したら最初のヒットに戻る
set wrapscan

" 検索マッチテキストをハイライト
set hlsearch
