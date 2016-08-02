scriptencoding utf-8

" マクロの初期化
" !!!: 必ず先頭に記述
augroup MyAutoCmd
  autocmd!
augroup END


""" Leader篇 """

" <Space> を "Leader" に割当て
let mapleader = "\<Space>"

" <Space> + "o": ファイルを開く
" !!!: プラグインが必要
" nnoremap <Leader>o :CtrlP<CR>

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

" 大文字・小文字を区別しない
set ignorecase
" 検索文字に大文字がある場合は大文字・小文字を区別
set smartcase

" 最後のヒットまで検索したら最初のヒットに戻る
set wrapscan

" 検索マッチテキストをハイライト
set hlsearch

" 検索時に "\" や "?" のエスケープを簡素化
" TODO: 動作確認
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

" grep検索の設定
" TODO: 動作確認
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh


""" 編集篇 """

" ヤンクしたデータをクリップボードで使用＆選択範囲自動コピー
" ※ 使用できるかは環境による
set clipboard=unnamed,autoselect
" < http://nanasi.jp/articles/howto/editing/clipboard.html >

" 自動的に閉じ括弧を入力
" !!!: あまりスマートではない・・・
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>

" 入力コマンド履歴の保存数
set history=1000


""" メイン表示篇 """

" 行番号の表示
set number

" シンタックスハイライト
syntax on

" 自動インデント時の空白数
set shiftwidth=4
" タブ文字の幅
set tabstop=4
" ダブ文字をスペースに置き換え
set expandtab
" 現在行と同じインデントを挿入
set autoindent
" "<" 、 ">" でインデントする時、"shiftwidth" の倍数に丸める
set shiftround
" 行頭は "shiftwidth" 分、それ以外は "tabstop" 分インデント
set smarttab

" カーソル行の背景色変更
set cursorline

" 対になる括弧を強調
set showmatch
" 対応括弧に "<" と ">" を追加
set matchpairs& matchpairs+=<:>

" 改行時に前行のインデントを継続
set autoindent
" 前行末尾に合わせ、次行インデントを増減
set smartindent

""""""""""""""""""""""""""""""""""""""""""""""""""
" !!!: 不可視文字の可視化は見難いのでkillしている
" 不可視文字（タブ、空白、改行）の可視化
" set list
" 不可視文字（タブ、空白、改行）を "Unicode" で表示
" set listchars=tab:≫-,trail:-,extends:≫,precedes:≪,nbsp:%,eol:?
" ↑ or ↓
" set listchars=tab:>.,trail:_,eol:?,extends:>,precedes:<,nbsp:%

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

" < http://inari.hatenablog.com/entry/2014/05/05/231307 >
""""""""""""""""""""""""""""""""""""""""""""""""""

" スクロール時の上・下端行数指定
set scrolloff=3

" ファイルを開いた時に最後のカーソル位置を復元する
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif


""" 外観テーマ篇 """

" カラースキーマの指定
colorscheme desert

" 行番号の色
highlight LineNr ctermfg=darkyellow

" 暗背景用の配色にする
" set background=dark

" フォントの設定
""" Windows の場合
if has('win32') || has ('win64')
    set guifont=Ricty_Diminished:h16
endif

" コマンドラインの行数
" DONE: Windows用gVim使用時は.gvimrcを編集する
if has('unix') || has('mac')
    set cmdheight=3
endif


""" コンソール表示篇 """

" カーソルの行列表示
set ruler


""" ウィンドウ表示篇 """

" 終了時にウィンドウサイズを記憶する
let g:save_window_file = expand('~/.vaimwinpos')
augroup SaveWindow
    autocmd!
    autocmd VimLeavePre * call s:save_window()
    function! s:save_window()
        let options = [
            \ 'set columns=' . &columns,
            \ 'set lines=' . &lines,
            \ 'winpos ' . getwinposx() . ' ' . getwinposy(),
            \ ]
        call writefile(options, g:save_window_file)
    endfunction
augroup END
if filereadable(g:save_window_file)
    execute 'source' g:save_window_file
endif

" ウインドウタイトルにファイルのパス情報等を表示
set title

" <Shift> + <矢印>: ウィンドウサイズ変更
" FIXME: Windows動作せず
" nnoremap <S-Left>  <C-w><<CR>
" nnoremap <S-Right> <C-w>><CR>
" nnoremap <S-Up>    <C-w>-<CR>
" nnoremap <S-Down>  <C-w>+<CR>

" ウィンドウ右下に入力中のコマンドを表示
set showcmd


""" マクロ ＆ キーアサイン篇 """

" 入力モード中 "jj": <Esc>
inoremap jj <Esc>

" "v" + "v": 行末まで選択
vnoremap v $h

" <ESC> + <ESC>: ハイライト消去
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" "w!!" :スーパーユーザーとして保存（sudoが使える環境限定）
if has('unix') || has('mac')
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


""" コマンドラインモード篇 """
"
" コマンドラインモードで <Tab> によるファイル名補完を有効にする
set wildmenu


""" 一般設定篇 """

if has('unix') || has('mac')
".swp" のディレクトリ変更
set directory=/tmp
" "~" のディレクトリ変更
set backupdir=/tmp
" ".un~" のディレクトリ変更
set undodir=/tmp
" ".viminfo" のディレクトリ変更
set viminfo+=n/tmp/viminfo.txt
endif

if has('win32') || has ('win64')
".swp" のディレクトリ変更
set directory=C:/Temp
" "~" のディレクトリ変更
set backupdir=C:/Temp
" ".un~" のディレクトリ変更
set undodir=C:/Temp
" ".viminfo" のディレクトリ変更
set viminfo+=nC:/Temp/viminfo.txt
endif

" .vimrc と .gvimrc を分割配置
set runtimepath+=~/.vimfiles/
runtime! userautoload/*.vim


""" ステータス行篇 """

" ステータス行に現在のgitブランチを表示
set statusline+=%{fugitive#statusline()}


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

""" Windows の場合
" if has('win32') || has ('win64')
"         " Windows 32bit、 Windows 64bit 用設定
" endif
