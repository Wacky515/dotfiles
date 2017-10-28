scriptencoding utf-8

""" 外観テーマ篇 """

" カラースキーマの指定
colorscheme hybrid
" colorscheme molokai
" colorscheme desert
" colorscheme jellybeans

" 暗背景用の配色にする
set background=dark
" " 明背景用の配色にする
" set background=light

" シンタックスハイライト
syntax on
    " ファイルタイプ系ハイライトプラグインを導入している場合
    " syntax on" は現在のruntimepathに含まれている設定をもとにシンタックスを生成する
    " runtimepathを初期化するような処理をした後にsyntax onしてもあまり意味はなく
    " runtimepathをすべて設定し終えた後にsyntax onをするべき
        " 悪いパターン
            " runtimepathを初期化するような処理
            " set runtimepath=$VIMRUNTIME
            " syntax on
            " ファイルタイプ系ハイライトプラグイン
            " neoBundle 'kongo2002/fsharp-vim'
        " 良いパターン
            " runtimepathを初期化するような処理
            " set runtimepath=$VIMRUNTIME
            " ファイルタイプ系ハイライトプラグイン
            " neoBundle 'kongo2002/fsharp-vim'

syntax on
" ターミナルwo256色表示
set t_Co=256

" コマンドラインの行数
set cmdheight=5

" メッセージ 文字化け対策
if has("win32") || ("win64")
    source $VIMRUNTIME/delmenu.vim
    set langmenu=ja_jp.utf-8
    source $VIMRUNTIME/menu.vim
endif

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
    if hostname() == "ProSalad13.local"
        set guifont=Ricty_Diminished:h16
    elseif hostname() == "saladserver.com"
        set guifont=Osaka:h24
        " set guifont=Ricty_Diminished:h24
    else
        set guifont=Ricty_Diminished:h18
    endif

elseif has("unix")
    set guifont=DejaVu\ Sans\ Mono\ 13

elseif has("win32") || has("win64")
    if hostname() == "SaladCarbonX1"
        set guifont=Ricty_Diminished:h12
    elseif hostname() == "LAPTOP-DOA35GAR"
        set guifont=Ricty_Diminished:h12
    elseif hostname() == "hbalt071"
        set guifont=Myrica_M:h15
    elseif hostname() == "hbamb748"
        set guifont=Ricty_Diminished:h16
    elseif hostname() == "MECSI"
        set guifont=Ricty_Diminished:h15

    " Xacti setting
    elseif hostname() == "CAD0021"
        set guifont=Ricty_Diminished:h15
    elseif hostname() == "PC-SA4110204580"
        set guifont=Ricty_Diminished:h12
    elseif hostname() == "NOT0053"
        set guifont=Ricty_Diminished:h12

    else
        set guifont=Meiryo_UI:h18
    endif
endif

" 選択行番号の色
highlight LineNr ctermfg=darkyellow
