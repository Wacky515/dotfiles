scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2023/03/10 11:12:31.

" ------------------------------------------------------------------------------
"  マップキー
" ------------------------------------------------------------------------------
" [*|#]: 検索開始時 ジャンプしない
nnoremap * *N
nnoremap # #N

" 検索ジャンプを中央表示
nnoremap n nzz
nnoremap N Nzz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" <Esc><Esc>: 検索ハイライト消去
if has("mac")
    nmap <silent> <C-[><C-[> :<C-u>nohlsearch<CR>
else
    nmap <silent> <Esc><Esc> :<C-u>nohlsearch<CR>
endif

" /: "very magic" 検索
nnoremap /  /\v

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
