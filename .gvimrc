scriptencoding utf-8
" Last Change: 2018/03/30 11:20:36.

" ----------------------------------------------------------------------
" 外観テーマ篇
" ----------------------------------------------------------------------

" カラースキーマの指定
colorscheme hybrid
" colorscheme molokai " {{{
" colorscheme desert
" colorscheme jellybeans
" }}}

" 暗背景用の配色にする
set background=dark
" " 明背景用の配色にする " {{{
" set background=light
" }}}

" 選択行番号の色
highlight LineNr ctermfg=darkyellow

" コマンドライン（Vim画面下部）の行数
set cmdheight=5

" ターミナルwo256色表示
set t_Co=256

" ツールバー消去
set guioptions-=T
" メニューバー非表示
set guioptions-=m

" ウィンドウ 半透明化（LinuxはVimから設定できない）
if has("mac")
    set transparency=10
endif
if has("win32") || ("win64")
    :autocmd GUIEnter * set transparency=235
endif

" メッセージ 文字化け対策
if has("win32") || ("win64")
    source $VIMRUNTIME/delmenu.vim
    set langmenu=ja_jp.utf-8
    source $VIMRUNTIME/menu.vim
endif

" シンタックスハイライト
syntax on
    " ファイルタイプ系ハイライトプラグインを導入している場合 "{{{
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
            " syntax on
"}}}

" !!!: 以下からは記述場所を順番を変えない！！！
" フォントの設定
if has("linux")
    set guifont=DejaVu\ Sans\ Mono\ 13

elseif has("mac")
    if hostname() == "ProSalad13.local"
        set guifont=Ricty_Diminished:h16
    elseif hostname() == "ProSalad133.local"
        set guifont=Ricty_Diminished:h16
        " colorscheme iceberg
        colorscheme hybrid
    elseif hostname() == "saladserver.com"
        set guifont=Osaka:h24
    else
        set guifont=Osaka:h18
    endif

elseif has("win32") || has("win64")
    " Home setting
    if hostname() == "SALADCARBONX1"
        set guifont=Cica:h12
        colorscheme iceberg

    " muRata setting
    elseif hostname() == "hbalt071"
        set guifont=Myrica_M:h16
    elseif hostname() == "hbamb748"
        set guifont=Ricty_Diminished:h16
    elseif hostname() == "HBAMB748A"
        " set guifont=Ricty_Diminished:h16
        " set guifont=Consolas:h14
        set guifont=Inconsolata:h14
        colorscheme iceberg
    elseif hostname() == "MECSI"
        set guifont=Ricty_Diminished:h16

    elseif hostname() == "LAPTOP-DOA35GAR"
        set guifont=Ricty_Diminished:h12

    " Xacti setting " {{{
    elseif hostname() == "CAD0021"
        set guifont=Ricty_Diminished:h16
    elseif hostname() == "PC-SA4110204580"
        set guifont=Ricty_Diminished:h12
    elseif hostname() == "NOT0053"
        set guifont=Ricty_Diminished:h12
    " }}}
    else
        set guifont=Meiryo_UI:h18
    endif
endif
