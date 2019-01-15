scriptencoding utf-8
" Created:     2016/08/03 **:**:**
" Last Change: 2019/01/10 22:27:28.

" ----------------------------------------------------------------------
" 外観テーマ篇
" ----------------------------------------------------------------------
" MEMO: "Dein" に設定移譲
" カラースキーマの指定
" 暗背景用の配色にする
" " 明背景用の配色にする " {{{
" set background=light
" }}}
if exists("g:nyaovim_version")
    color iceberg
endif

" 選択行番号の色
highlight LineNr ctermfg=darkyellow

" コマンドライン（"Vim" 画面下部）の行数
set cmdheight=5

" ターミナル256色表示
set t_Co=256

" ツールバー消去
set guioptions-=T
" メニューバー非表示
set guioptions-=m

" ウィンドウ 半透明化（"Linux" は "Vim" から設定できない）
if has("mac")
    set transparency=10
endif
if (has("win32") || ("win64"))
    :autocmd GUIEnter * set transparency=235
endif

" メッセージ 文字化け対策
if (has("win32") || ("win64"))
    source $VIMRUNTIME/delmenu.vim
    set langmenu=ja_jp.utf-8
    source $VIMRUNTIME/menu.vim
endif

" シンタックスハイライト
" "dein.vim" に関する設定の後にON
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
" FIXME: "colorscheme" の設定が反映されない
" フォントの設定
if has("linux")
    if !has("nvim")
        set guifont=Cica:h16
        set printfont=Cica:h12
    else
        Guifont! DejaVu\ Sans\ Mono\ 13
    endif
        Guifont! Cica:h18

elseif has("mac")
    if hostname() == "ProSalad13.local"
        if !has("nvim")
            set guifont=Cica:h16
            " set guifont=Ricty_Diminished:h16
        else
            Guifont! Cica:h16
            " Guifont! Ricty_Diminished:h16
        endif
    elseif hostname() == "ProSalad133.local"
        if !has("nvim")
            set guifont=Cica:h16
            set printfont=Cica:h12
        else
            Guifont! Cica:h18
        endif
        " colorscheme iceberg
        " set background=dark
    elseif hostname() == "saladserver.com"
        if !has("nvim")
            set guifont=Cica:h24
            " set guifont=Osaka:h24
        else
            Guifont! Cica:h24
            " Guifont! Osaka:h24
        endif
        " colorscheme iceberg
        " set background=dark
    elseif hostname() == "SaladBook.com"
        if !has("nvim")
            set guifont=Cica:h24
        else
            Guifont! Cica:h24
        endif
    else
        if !has("nvim")
            set guifont=Cica:h18
        else
            Guifont! Cica:h18
        endif
    " colorscheme hybrid
    " set background=dark
    endif

elseif (has("win32") || has("win64"))
    " Home setting
    if hostname() == "SALADCARBONX1"
        if !has("nvim")
            set guifont=Cica:h11
            set printfont=Cica:h8
            " Windows Cica 専用設定 ("NeoVim" 版設定探す）
            set rop=type:directx,renmode:5
        else
            if !exists("g:nyaovim_version")
                Guifont! Cica:h11
            endif
            set termguicolors
            " TEMP: "dein" に移管する
            colorscheme iceberg
        endif
        " colorscheme iceberg
        " set background=dark

    " muRata setting
    elseif hostname() == "HBALT071"
        if !has("nvim")
            set guifont=Cica:h11
            set printfont=Cica:h8
            set rop=type:directx,renmode:5
        else
            Guifont! Cica:h16
        endif
        " colorscheme iceberg
        " set background=dark
    elseif hostname() == "HBAMB748"
        if !has("nvim")
            set guifont=Cica:h14
            set printfont=Cica:h12
            set rop=type:directx,renmode:5
        else
            if !exists("g:nyaovim_version")
                Guifont! Cica:h12
            endif
            set termguicolors
            " TEMP: "dein" に移管する
            colorscheme iceberg
        endif
        " colorscheme iceberg
        " set background=dark
    elseif hostname() == "HBAMB748A"
        if !has("nvim")
            set guifont=Cica:h15
            set printfont=Cica:h13
            set rop=type:directx,renmode:5
        else
            Guifont! Cica:h15
        endif
        " colorscheme hybrid
        " set background=dark
    elseif hostname() == "MECSI"
        if !has("nvim")
            set guifont=Cica:h11
            set printfont=Cica:h8
            set rop=type:directx,renmode:5
        else
            Guifont! Cica:h16
        endif
        " colorscheme iceberg
        " set background=dark
    elseif hostname() == "LAPTOP-DOA35GAR"
        if !has("nvim")
            set guifont=Cica:h11
            set printfont=Cica:h8
            set rop=type:directx,renmode:5
        else
            Guifont! Cica:h12
        endif
        " colorscheme iceberg
        " set background=dark
    elseif hostname() == "HBAMB819"
        if !has("nvim")
            set guifont=Cica:h12
            set printfont=Cica:h10
            set rop=type:directx,renmode:5
        else
            if !exists("g:nyaovim_version")
                Guifont! Cica:h12
            endif
            set termguicolors
            " TEMP: "dein" に移管する
            colorscheme iceberg
        endif
        " colorscheme hybrid
        " set background=dark

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
            Guifont! Meiryo_UI:h18
        endif
        " colorscheme hybrid
        " set background=dark
    endif
endif

