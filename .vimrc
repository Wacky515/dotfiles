scriptencoding utf-8
" test from raspi
" test from raspi 2nd
" test from Debian
" test from Xacti
" test from Xacti Windows

""" Leader篇 """

" <Space> を Leader に割当て
let mapleader = "\<Space>"

" <Space>+ "o": ファイルを開く
nnoremap <Leader>o :CtrlP<CR>

" <Space> + "w": ファイルを保存
nnoremap <Leader>w :w<CR>
"
" <Space> + <Space>: ビジュアルラインモードに切替え
nmap <Leader><Leader> V


""" 検索篇 """

" 検索ジャンプを画面中央に表示
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" インクリメンタルサーチ
" ※ 検索文字入力で即時検索開始
set incsearch

" 最後のヒットまで検索したら最初のヒットに戻る
set wrapscan

" 検索マッチテキストをハイライト
set hlsearch

" 大文字・小文字を区別しない
set ignorecase

" 検索文字に大文字がある場合は大文字・小文字を区別
set smartcase

" "\" や "?" を状況に合せ自動エスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

" grep検索の設定
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh


""" 編集篇 """

" ヤンクしたデータをクリップボードで使用＆選択範囲自動コピー
" ※ 使用できるかは環境による
" 参考: http://nanasi.jp/articles/howto/editing/clipboard.html
set clipboard=unnamed,autoselect

" 自動的に閉じ括弧を入力
" ※ あまりスマートではない・・・
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>

" "<" 、 ">" でインデントする時、"shiftwidth" の倍数に丸める
set shiftround

" 入力コマンド履歴の保存数
set history=1000

""" メイン表示篇 """

" 行番号の表示
set number

" シンタックスハイライト
syntax on

" 画面上のタブ幅
set tabstop=4

" 行頭で <Tab> を入力すると "shiftwidth" 分インデントし、それ以外のは "tabstop" 分インデントする
set smarttab

" 現在行と同じインデントを挿入
set autoindent

" ダブ文字をスペースに置き換える
set expandtab


" カーソル行の背景色変更
set cursorline
"
" 対になる括弧を強調
set showmatch

" 改行時に前行のインデントを継続
set autoindent
" 改行時に入力された行末尾に合わせ、次行インデントを増減
set smartindent

" 全角スペースの可視化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

""""""""""""""""""""""""""""""""""""""""""""""""""
" 不可視文字（タブ、空白、改行）の可視化
set list
" 不可視文字（タブ、空白、改行）を "Unicode" で表示
" set listchars=tab:≫-,trail:-,extends:≫,precedes:≪,nbsp:%,eol:?
set listchars=tab:>.,trail:_,eol:?,extends:>,precedes:<,nbsp:%

"全角スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
   
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif

" <http://inari.hatenablog.com/entry/2014/05/05/231307>
""""""""""""""""""""""""""""""""""""""""""""""""""

" スクロール送りを開始する前後の行数指定
set scrolloff=5

" ファイルを開いた時に最後のカーソル位置を復元する
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif

""" 外観テーマ篇 """
" 暗背景用の配色にする
" set background=dark


""" コンソール表示篇 """

" カーソルの行列表示
set ruler

" コマンドラインの行数
set cmdheight=3


""" ウィンドウ表示篇 """

" ウインドウタイトルにファイルのパス情報等を表示
set title

" <Shift> + <矢印>: ウィンドウサイズ変更
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

" ウィンドウ右下に入力中のコマンドを表示
set showcmd


""" マクロ ＆ キーアサイン篇 """

" 入力モード中 "jj" : <Esc>
inoremap jj <Esc>

" "v" + "v": 行末まで選択
vnoremap v $h

" <ESC> + <ESC>: ハイライト消去
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" "w!!" :スーパーユーザーとして保存（sudoが使える環境限定）
cmap w!! w !sudo tee > /dev/null %

" ":e" などでファイルを開く時、フォルダが存在しない場合は自動作成
function! s:mkdir(dir, force)
  if !isdirectory(a:dir) && (a:force ||
        \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction
autocmd MyAutoCmd BufWritePre * call s:mkdir(expand('<afile>:p:h'), v:cmdbang)


""" コマンドラインモード篇 """
"
" コマンドラインモードで <Tab> によるファイル名補完を有効にする
set wildmenu


""" Vimスクリプト 記述法 Memo """

""" OS固有の設定を持つ場合

""" Unix の場合
" if has('unix')
"         " Unix 用設定
" endif

""" Mac の場合
" if has('mac')
"         " Mac 用設定
" endif

" Unix と Mac 共通の設定の場合
" if has('unix') || has('mac')
"         " Unix と Mac の共通設定
" endif

""" Windlws の場合
" if has('win32') || has ('win64')
"         " Windows 32bit、 Windows 64bit 用設定
" endif
