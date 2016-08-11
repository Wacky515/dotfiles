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
" ターミナルで256色表示
set t_Co=256

" TODO: .vimrcから移植したので動作確認
" コマンドラインの行数表示
set cmdheight=5

" ウィンドウ 半透明化（Linuxは設定がめんどくさいので保留）
if has("mac")
    set transparency=10
endif
if has("win32") || ("win64")
    :autocmd GUIEnter * set transparency=235
endif

" フォントの設定（Linuxは保留）
" TODO: フォントの自動インストール化（初期化スクリプトに記述）
""" Windows の場合
if has("mac")
    set guifont=Ricty_Diminished:h18
elseif has("win32") || has("win64")
    set guifont=Ricty_Diminished:h16
elseif has("unix")
    set guifont=DejaVu\ Sans\ Mono\ 13
endif

" 行番号の色
highlight LineNr ctermfg=darkyellow
