scriptencoding utf-8
" Last Change: 2018/03/31 20:44:43.

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
    if !has("nvim")
        set guifont=DejaVu\ Sans\ Mono\ 13
    else
        Guifont DejaVu\ Sans\ Mono\ 13
    endif

elseif has("mac")
    if hostname() == "ProSalad13.local"
        if !has("nvim")
            set guifont=Ricty_Diminished:h16
        else
            Guifont Ricty_Diminished:h16
        endif
    elseif hostname() == "ProSalad133.local"
        if !has("nvim")
            set guifont=Cica:h18
        else
            Guifont Consolas:h18
        endif
        colorscheme iceberg
    elseif hostname() == "saladserver.com"
        if !has("nvim")
            set guifont=Osaka:h24
        else
            Guifont Osaka:h24
        endif
    else
        if !has("nvim")
            set guifont=Osaka:h18
        else
            Guifont Osaka:h18
        endif
    endif

elseif has("win32") || has("win64")
    " Home setting
    if hostname() == "SALADCARBONX1"
        if !has("nvim")
            set guifont=Cica:h12
        " Windows Cica 専用設定
            set rop=type:directx,renmode:5
        else
            set guifont=Cica:h12
        endif
        colorscheme iceberg

    " muRata setting
    elseif hostname() == "hbalt071"
        if !has("nvim")
            set guifont=Cica:h16
            set rop=type:directx,renmode:5
        else
            set guifont=Cica:h16
        endif
    elseif hostname() == "hbamb748"
        if !has("nvim")
            set guifont=Cica:h16
            set rop=type:directx,renmode:5
        else
            set guifont=Cica:h16
        endif
    elseif hostname() == "HBAMB748A"
        if !has("nvim")
            set guifont=Cica:h14
            set rop=type:directx,renmode:5
        else
            set guifont=Cica:h14
        endif
        colorscheme iceberg
    elseif hostname() == "MECSI"
        if !has("nvim")
            set guifont=Cica:h16
            set rop=type:directx,renmode:5
        else
            set guifont=Cica:h16
        endif
    elseif hostname() == "LAPTOP-DOA35GAR"
        if !has("nvim")
            set guifont=Cica:h12
            set rop=type:directx,renmode:5
        else
            set guifont=Cica:h12
        endif

    " Xacti setting " {{{
    elseif hostname() == "CAD0021"
        set guifont=Ricty_Diminished:h16
    elseif hostname() == "PC-SA4110204580"
        set guifont=Ricty_Diminished:h12
    elseif hostname() == "NOT0053"
        set guifont=Ricty_Diminished:h12
    " }}}
    else
        if !has("nvim")
            set guifont=Meiryo_UI:h18
            set rop=type:directx,renmode:5
        else
            set guifont=Meiryo_UI:h18
        endif
    endif
endif
