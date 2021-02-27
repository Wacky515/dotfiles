scriptencoding utf-8
" Created:     2016/08/03 **:**:**
" Last Change: 2021/02/27 21:20:06.

" !!!: 必ず先頭に記述
" "autocmd"（マクロ） の初期化
augroup MyAutoCmd
    autocmd!
augroup END

" ----------------------------------------------------------------------
" 外観テーマ篇
" ----------------------------------------------------------------------
" カラースキーマの指定
" MEMO: 不具合のためこちらの記述に戻した
" MEMO: ~~"Dein" に移管済み~~
if !has("nvim")
    set termguicolors
    set background=dark
    au MyAutoCmd VimEnter * nested colorscheme iceberg
    au MyAutoCmd VimEnter * highlight Visual ctermbg=216
endif

" MEMO: "visual.vim" 内のこの記述のみ適用されない
    " "KaoriYa GVim" 用、削除しない！！！
" コマンドライン（画面下部） 高さ
set cmdheight=5

if (has("win32") || ("win64"))
    " メニューバー 表示
    set guioptions+=m
else
    " メニューバー 非表示
    set guioptions-=m
endif
" ツールバー 非表示
set guioptions-=T
" 水平スクロールバー 表示
set guioptions+=b

" ウィンドウ 半透明化（"Linux" は "NeoVim" から設定できない）
if has("unix") && !has("nvim")
    set transparency=10
elseif (has("win32") || ("win64"))
    :autocmd GUIEnter * set transparency=235
endif

" メッセージ 文字化け対策
if (has("win32") || ("win64"))
    source $VIMRUNTIME/delmenu.vim
    set langmenu=ja_jp.utf-8
    source $VIMRUNTIME/menu.vim
endif

" ファイルタイプ系ハイライトプラグインを導入している場合  " {{{
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
" }}}

" !!!: 以下からは記述場所を順番を変えない！！！
" ----------------------------------------------------------------------
" フォント設定篇
" ----------------------------------------------------------------------
" MEMO: "NeoVim" のフォント設定は "ginit.vim" に記述
if !has("nvim")
    if has("mac")
        if hostname()     == "SaladBookAirM1"
            set   guifont=Cica:h16
            set printfont=Cica:h16
        elseif hostname() == "saladserver.com"
            set   guifont=Cica:h18
            set printfont=Cica:h18
        elseif hostname() == "SaladBook.local"
            set   guifont=Cica:h16
            set printfont=Cica:h16
        else
            set   guifont=Cica:h16
            set printfont=Cica:h16
        endif

    elseif has("unix")
        set   guifont=Cica\ 16
        set printfont=Cica\ 16

    elseif (has("win32") || has("win64"))
        " Home setting
        if hostname()     == "SALADPRIMEMK-II"
            set   guifont=Cica:h12
            set printfont=Cica:h12
            " Windows Cica 専用設定 ("NeoVim" 版設定探す）
            set renderoptions=type:directx,renmode:5
        elseif hostname() == "SALADCARBONX1"
            set   guifont=Cica:h13
            set printfont=Cica:h13
            set renderoptions=type:directx,renmode:5
        elseif hostname() == "SALADSURFACEGO"
            set   guifont=Cica:h13
            set printfont=Cica:h13
            set renderoptions=type:directx,renmode:5

        " muRata setting
        elseif hostname() == "HBAMB1448"
            set   guifont=Cica:h15
            set printfont=Cica:h15
            set renderoptions=type:directx,renmode:5
        elseif hostname() == "HBAMB748"
            set   guifont=Cica:h15
            set printfont=Cica:h15
            set renderoptions=type:directx,renmode:5
        elseif hostname() == "HBAMB819"
            set   guifont=Cica:h12
            set printfont=Cica:h12
            set renderoptions=type:directx,renmode:5
        elseif hostname() == "HBAPC511"
            set   guifont=Cica:h13
            set printfont=Cica:h13
            set renderoptions=type:directx,renmode:5
        elseif hostname() == "HBAMB748A"
            set   guifont=Cica:h15
            set printfont=Cica:h15
            set renderoptions=type:directx,renmode:5
        elseif hostname() == "HBALT071"
            set   guifont=Cica:h11
            set printfont=Cica:h11
            set renderoptions=type:directx,renmode:5
        elseif hostname() == "MECSI"
            set   guifont=Cica:h11
            set printfont=Cica:h11
            set renderoptions=type:directx,renmode:5
        elseif hostname() == "LAPTOP-DOA35GAR"
            set   guifont=Cica:h11
            set printfont=Cica:h11
            set renderoptions=type:directx,renmode:5
        elseif hostname() == "SMM0761"
            set   guifont=Cica:h12
            set printfont=Cica:h12
            set renderoptions=type:directx,renmode:5
        elseif hostname() == "SMM1319"
            set   guifont=Cica:h12
            set printfont=Cica:h12
            set renderoptions=type:directx,renmode:5
        elseif hostname() == "SMM1380"
            set   guifont=Cica:h12
            set printfont=Cica:h12
            set renderoptions=type:directx,renmode:5
        elseif hostname() == "SMM1496"
            set   guifont=Cica:h12
            set printfont=Cica:h12
            set renderoptions=type:directx,renmode:5
        elseif hostname() == "mmctosmm"
            set   guifont=Cica:h14
            set printfont=Cica:h14
            set renderoptions=type:directx,renmode:5

        " Xacti setting  " {{{
        elseif hostname() == "CAD0021"
            set guifont=Ricty_Diminished:h16
        elseif hostname() == "PC-SA4110204580"
            set guifont=Ricty_Diminished:h12
        elseif hostname() == "NOT0053"
            set guifont=Ricty_Diminished:h12
        " }}}

        else
            set   guifont=Cica:h14
            set printfont=Cica:h14
            set renderoptions=type:directx,renmode:5
        endif
    endif
endif
