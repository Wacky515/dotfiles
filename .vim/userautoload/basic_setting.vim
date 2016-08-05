scriptencoding utf-8

" マクロの初期化
" !!!: 必ず先頭に記述
augroup MyAutoCmd
    autocmd!
augroup END


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

" 検索時に大文字・小文字を区別しない
set ignorecase
" 検索時に大文字がある場合は大文字・小文字を区別
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


""" コンソール表示篇 """

" カーソルの行列表示
set ruler


""" メイン表示篇 """

" フォントの設定
" TODO: フォントのインストール
""" Windows の場合
if has('win32') || has ('win64') || ('mac')
    set guifont=Ricty_Diminished:h16
endif

" コマンドラインの行数
" DONE: Windows用gVim使用時は.gvimrcを編集する
if has('unix') || has('mac')
    set cmdheight=3
endif

" 行番号の表示
set number

" 自動インデント時の空白数
set shiftwidth=4
" タブ文字の幅
set tabstop=4
" ダブ文字を空白文字に置き換え
set expandtab
" 行頭は "shiftwidth" 分、それ以外は "tabstop" 分インデント
set smarttab

" 現在行と同じインデントを挿入
set autoindent
" 前行末尾に合わせ、次行インデントを増減
set smartindent
" "<" 、 ">" でインデントする時、"shiftwidth" の倍数に丸める
set shiftround

" カーソル行の背景色変更
set cursorline

" 対になる括弧を強調
set showmatch
" 対応括弧に "<" と ">" を追加
set matchpairs& matchpairs+=<:>

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


""" ウィンドウ表示篇 """

" 終了時にウィンドウサイズを記憶する
if has('unix') || has('mac')
    let g:save_window_file = '/vim/tmp/.vimwinpos'
endif
if has('win32') || has ('win64')
    let g:save_window_file = 'C:/Temp/.vimwinpos'
endif
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


""" コマンドラインモード篇 """
"
" コマンドラインモードで <Tab> によるファイル名補完を有効にする
set wildmenu


""" 基本設定篇 """

" 入力コマンド履歴の保存数
set history=1000

" 折り畳みの設定
:set foldmethod=marker

" FIXME: 動作せず(Mac OK!)
if has('unix') || has('mac')
    " ".swp" のディレクトリ変更
    set directory=~/.vim/tmp
    " "~" のディレクトリ変更
    set backupdir=~/.vim/tmp
    " ".un~" のディレクトリ変更
    set undodir=~/.vim/tmp
    " ".viminfo" のディレクトリ変更
    set viminfo+=n~/.vim/tmp/viminfo.txt
endif
" TODO: ↓ディレクトリ（.vim）を変更する
if has('win32') || has ('win64')
    " ".swp" のディレクトリ変更
    set directory=C:/Temp
    " "~" のディレクトリ変更
    set backupdir=C:/Temp
    " ".un~" のディレクトリ変更
    set undodir=C:/Temp
    " ".viminfo" のディレクトリ変更
    set viminfo+=nC:/Temp/viminfo.txt
endif


" モードラインの設定
" ※ ファイル毎のエディタ設定
:set modeline

" FIXME: ↓効かない
" !!!: 先頭行にも記述がある
" vimrc 即時反映
" augroup MyAutoCmd
"     autocmd!
" augroup END
if !has('gui_running') && !(has('win32') || has('win64'))
    " .vimrcの再読込時にも色が変化するようにする
    autocmd MyAutoCmd BufWritePost $MYVIMRC nested source $MYVIMRC
else
    " .vimrcの再読込時にも色が変化するようにする
    autocmd MyAutoCmd BufWritePost $MYVIMRC source $MYVIMRC |
                \if has('gui_running') | source $MYGVIMRC
    autocmd MyAutoCmd BufWritePost $MYGVIMRC if has('gui_running') | source $MYGVIMRC
endif


""" ステータス行篇 """

" ステータス行に現在のgitブランチを表示
" !!!: プラグインが必要
" set statusline+=%{fugitive#statusline()}


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

""" 環境固有の設定を持つ場合

" if ( has ('python') || has('python3') )
" 	" Python 用設定
" else
" 	" Python 以外の設定
" endif
