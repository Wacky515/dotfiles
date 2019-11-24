scriptencoding utf-8
" Created:     2016/08/03 **:**:**
<<<<<<< HEAD
" Last Change: 2019/11/17 15:45:56.
=======
" Last Change: 2019/11/20 16:35:55.
>>>>>>> ab56cac1b5bfb4aab2195a6347dcb44edcda61c7

" ----------------------------------------------------------------------
" 外観テーマ篇
" ----------------------------------------------------------------------
" MEMO: "Dein" に移管済み
    " カラースキーマの指定
    " 暗背景用の配色にする

" Kaoriya GVim用 削除しない！！！
" コマンドライン（"Vim" 画面下部）高さ
set cmdheight=5

" ツールバー消去
set guioptions-=T
" メニューバー非表示
set guioptions-=m

" ウィンドウ 半透明化（"Linux" は "Vim" から設定できない）
if has("mac")
    if !has("nvim")
        set transparency=10
    endif
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

" "NyaoVim" 用設定
if exists("g:nyaovim_version")
    let s:plugin_dir = expand("~/.config/nyaovim/dein")
    try
        if s:on_nyaovim || s:true_color_enabled
            colorscheme iceberg
            " colorscheme spring-night
            " let g:airline_theme = "spring_night"
        else
            colorscheme wallaby
            let g:airline_theme = "wombat"
        endif
    catch
        set background=dark
        colorscheme default
    endtry
endif

" REF: "Oni" 用設定
" if exists("g:gui_oni")
"     echo Setting for Oni
" endif

" !!!: 以下からは記述場所を順番を変えない！！！
" !!!: "NeoVim" のフォント設定は "ginit.vim" に記述！！
" フォントの設定
if !has("nvim")
    if has("unix")
        set   guifont=Cica\ 16
        set printfont=Cica\ 16
        " colorscheme iceberg

    elseif has("mac")
        if hostname()     == "ProSalad13-2018.local"
            set guifont=Cica:h20
            set printfont=Cica:h12
        elseif hostname() == "ProSalad13.local"
            set guifont=Cica:h16
            set printfont=Cica:h12
        elseif hostname() == "saladserver.com"
            set guifont=Cica:h28
            set printfont=Cica:h20
        elseif hostname() == "SaladBook.local"
            set guifont=Cica:h16
            set printfont=Cica:h12
        else
            set guifont=Cica:h16
            set printfont=Cica:h12
        endif
        " colorscheme iceberg

    elseif (has("win32") || has("win64"))
        " Home setting
        if hostname()     == "SALADCARBONX1"
            set   guifont=Cica:h13
            set printfont=Cica:h13
            " Windows Cica 専用設定 ("NeoVim" 版設定探す）
            set renderoptions=type:directx,renmode:5

            " muRata setting
        elseif hostname() == "HBAMB748"
            set   guifont=Cica:h15
            set printfont=Cica:h15
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
        elseif hostname() == "HBAMB819"
            set   guifont=Cica:h12
            set printfont=Cica:h12
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
                set renderoptions=type:directx,renmode:5
            endif
        endif
    endif
endif
