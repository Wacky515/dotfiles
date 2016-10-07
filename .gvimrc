scriptencoding utf-8

""" 外観テーマ篇 """

" カラースキーマの指定
" colorscheme desert
" colorscheme molokai
colorscheme hybrid
" colorscheme desert
" colorscheme jellybeans
" 暗背景用の配色にする
set background=dark
" 明背景用の配色にする
" set background=light

" シンタックスハイライト
syntax on
" ターミナルwo256色表示
set t_Co=256

" コマンドラインの行数
set cmdheight=5

" ウィンドウ 半透明化（LinuxはVimから設定できない）
if has("mac")
    set transparency=10
endif
if has("win32") || ("win64")
    :autocmd GUIEnter * set transparency=235
endif

" DONE: フォントの自動インストール化（初期化スクリプトに記述）
" ↑はPCローカルの設定をすることで代替した
" !!!: 順番を変えない
" フォントの設定
if has("mac")
    if hostname() == "PloSalad13.local"
        set guifont=Ricty_Diminished:h18
    elseif hostname() == "macserver"
        set guifont=Ricty_Diminished:h22
    else
        set guifont=Ricty_Diminished:h18
    endif
elseif has("unix")
    set guifont=DejaVu\ Sans\ Mono\ 13
elseif has("win32") || has("win64")
    if hostname() == "CAD0021"
        set guifont=Ricty_Diminished:h16
    else
        set guifont=Ricty_Diminished:h16
    endif
endif

" 選択行番号の色
highlight LineNr ctermfg=darkyellow
