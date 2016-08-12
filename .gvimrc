scriptencoding utf-8

""" 外観テーマ篇 """

" カラースキーマの指定
colorscheme hybrid
" colorscheme desert
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

" ウィンドウ 半透明化（Linuxは設定がめんどくさいので保留）
if has("mac")
    set transparency=10
endif
if has("win32") || ("win64")
    :autocmd GUIEnter * set transparency=235
endif

" TODO: フォントの自動インストール化（初期化スクリプトに記述）
" !!!: 順番を変えない
" フォントの設定
if has("mac")
    set guifont=Ricty_Diminished:h18
elseif has("unix")
    set guifont=DejaVu\ Sans\ Mono\ 13
elseif has("win32") || has("win64")
    set guifont=Ricty_Diminished:h16
endif

" sentaku行番号の色
highlight LineNr ctermfg=darkyellow
