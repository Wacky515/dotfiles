scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2021/02/27 22:39:02.
" FIXME: "Mac" で "ginit.vim" 読込むとエラー

" !!!: 必ず先頭に記述
" "autocmd"（マクロ） の初期化
augroup MyAutoCmd
    autocmd!
augroup END

colorscheme iceberg

" ---------------------------------------------------------------------------
" 基本設定
" ---------------------------------------------------------------------------
" "Vim" 毎のrcファイルパス設定
let g:rc_dir = expand("~/dotfiles")

" rcファイル読込み関数
function! s:source_rc(rc_file_name)
    let rc_file = expand(g:rc_dir . "/" . a:rc_file_name)
    if filereadable(rc_file)
        execute "source" rc_file
    endif
endfunction
call s:source_rc(".gvimrc")

" ----------------------------------------------------------------------
" フォント設定篇
" ----------------------------------------------------------------------
" MEMO: "Guifont" は使用できなくなった？
" FIXME: Pitch metrics エラーが解消できず
if has("mac") " {{{
    if hostname()     == "SaladBookAirM1"
        Guifont! Cica:h18
    elseif hostname() == "saladserver.com"
        Guifont! Cica:h16
    elseif hostname() == "SaladBook.local"
        Guifont! Cica:h18
    else
        Guifont! Cica:h18
    endif

elseif has("unix")
    Guifont! Cica\ 16

elseif (has("win32") || has("win64"))
    " Home setting
    if hostname()     == "SALADPRIMEMK-II"
        Guifont! Cica:h12
    elseif hostname() == "SALADCARBONX1"
        Guifont! Cica:h13

    " muRata setting
    elseif hostname() == "HBAMB1448"
        Guifont! Cica:h14
    elseif hostname() == "HBAMB748"
        Guifont! Cica:h14
    elseif hostname() == "HBAMB819"
        Guifont! Cica:h12
    elseif hostname() == "HBAPC511"
        Guifont! Cica:h16
    elseif hostname() == "HBALT071"
        Guifont! Cica:h16
    endif
endif
" }}}
