scriptencoding utf-8
" Created:     2016/08/03 **:**:**
" Last Change: 2019/06/30 21:05:25.

" ----------------------------------------------------------------------
" 外観テーマ篇
" ----------------------------------------------------------------------
" カラースキーマの指定
" 暗背景用の配色にする
" MEMO: "Dein" に移管済み

" " 明背景用の配色にする " {{{
" set background=light
" }}}

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

if exists("g:nyaovim_version")
    " color iceberg
    let s:plugin_dir = expand("~/.config/nyaovim/dein")
    try
        if s:on_nyaovim || s:true_color_enabled
            colorscheme spring-night
            let g:airline_theme = 'spring_night'
        else
            colorscheme wallaby
            let g:airline_theme = 'wombat'
        endif
    endtry
endif

" !!!: 以下からは記述場所を順番を変えない！！！
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
    if hostname() == "ProSalad133.local"
        set guifont=Cica:h16
        set printfont=Cica:h12
    elseif hostname() == "ProSalad13.local"
        set guifont=Cica:h16
        set printfont=Cica:h12
    elseif hostname() == "saladserver.com"
        set guifont=Cica:h24
        set printfont=Cica:h20
    elseif hostname() == "SaladBook.com"
        set guifont=Cica:h16
        set printfont=Cica:h12
    else
        set guifont=Cica:h16
        set printfont=Cica:h12
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
            set termguicolors
        endif

    " muRata setting
    elseif hostname() == "HBAMB748"
        if !has("nvim")
            set guifont=Cica:h14
            set printfont=Cica:h12
            set rop=type:directx,renmode:5
        else
            set termguicolors
        endif
    elseif hostname() == "HBAMB748A"
        if !has("nvim")
            set guifont=Cica:h15
            set printfont=Cica:h13
            set rop=type:directx,renmode:5
        else
            Guifont! Cica:h15
        endif
    elseif hostname() == "HBALT071"
        if !has("nvim")
            set guifont=Cica:h11
            set printfont=Cica:h8
            set rop=type:directx,renmode:5
        else
            Guifont! Cica:h16
        endif
    elseif hostname() == "MECSI"
        if !has("nvim")
            set guifont=Cica:h11
            set printfont=Cica:h8
            set rop=type:directx,renmode:5
        else
            Guifont! Cica:h16
        endif
    elseif hostname() == "LAPTOP-DOA35GAR"
        if !has("nvim")
            set guifont=Cica:h11
            set printfont=Cica:h8
            set rop=type:directx,renmode:5
        else
            Guifont! Cica:h12
        endif
    elseif hostname() == "HBAMB819"
        if !has("nvim")
            set guifont=Cica:h12
            set printfont=Cica:h10
            set rop=type:directx,renmode:5
        else
            set termguicolors
        endif
    elseif hostname() == "SMM0761"
        if !has("nvim")
            set guifont=Cica:h12
            set printfont=Cica:h10
            set rop=type:directx,renmode:5
        else
            set termguicolors
        endif
    elseif hostname() == "SMM1319"
        if !has("nvim")
            set guifont=Cica:h12
            set printfont=Cica:h10
            set rop=type:directx,renmode:5
        else
            set termguicolors
        endif
    elseif hostname() == "SMM1380"
        if !has("nvim")
            set guifont=Cica:h12
            set printfont=Cica:h10
            set rop=type:directx,renmode:5
        else
            set termguicolors
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
            Guifont! Meiryo_UI:h18
        endif
    endif
endif

