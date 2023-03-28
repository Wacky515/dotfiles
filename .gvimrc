scriptencoding utf-8
" Created:     2023/03/04 16:27:00
" Last Change: 2023/03/28 20:58:30.

" ------------------------------------------------------------------------------
"  外観テーマ
" ------------------------------------------------------------------------------
" "colorscheme" の設定
"     " !!!: "visual.vim" では無く、ここに記述
set termguicolors
set background=dark
augroup MyAutoCmd
    autocmd VimEnter * nested colorscheme iceberg
    " タブ文字 色設定		  " < タブ文字見本
    " NOTWORK: "Mac | Windows NeoVim" では動作しない
    " MEMO:    "Mac | Windows GVim"   では動作する
    autocmd VimEnter * highlight SpecialKey guibg=NONE guifg=Red
    " 改行文字 色設定
    autocmd VimEnter * highlight NonText    guibg=NONE guifg=DarkGreen
    " 行番号 色設定
    " autocmd VimEnter * highlight LineNr     guibg=NONE guifg=DarkYellow
augroup END

" MEMO: "visual.vim" 内のこの記述のみ適用されない
    " !!!: "KaoriYa" 用、削除しない
" 画面下部コマンドライン 高さ
set cmdheight=5

" メニューバー 非表示
set guioptions-=m
" ツールバー 非表示
set guioptions-=T
" 水平スクロールバー 表示
set guioptions+=b

" ウィンドウ 半透明化
    " MEMO: "Linux" の "NeoVim" は設定できない
if has("unix") && !has("nvim")
    set transparency=10
elseif (has(("win32") || ("win64") && has("Kaoriya")))
    :autocmd GUIEnter * set transparency=235
endif

" メッセージ 文字化け対策
if (has("win32") || ("win64"))
    source $VIMRUNTIME/delmenu.vim
    set langmenu=ja_jp.utf-8
    source $VIMRUNTIME/menu.vim
endif

" !!!: 以下は記述場所・順番を変えない
" ------------------------------------------------------------------------------
"  端末毎フォント設定
" ------------------------------------------------------------------------------
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
            " Windows Cica 専用設定 ("NeoVim" 版設定探す)
            set renderoptions=type:directx,renmode:5
        elseif hostname() == "SALADCARBONX1"
            set   guifont=Cica:h12
            set printfont=Cica:h12
            set renderoptions=type:directx,renmode:5
        elseif hostname() == "SALADSURFACEGO"
            set   guifont=Cica:h13
            set printfont=Cica:h13
            set renderoptions=type:directx,renmode:5
        " muRata setting
        elseif hostname() == "HBAMB1448"
            set   guifont=Cica:h14
            set printfont=Cica:h14
            set renderoptions=type:directx,renmode:5
        elseif hostname() == "HBAMB819"
            set   guifont=Cica:h13
            set printfont=Cica:h13
            set renderoptions=type:directx,renmode:5
        elseif hostname() == "mmctosmm"
            set   guifont=Cica:h14
            set printfont=Cica:h14
            set renderoptions=type:directx,renmode:5
        else
            set   guifont=Cica:h14
            set printfont=Cica:h14
            set renderoptions=type:directx,renmode:5
        endif
    endif
endif
