scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2021/02/22 10:51:32.

" !!!: 必ず先頭に記述
" "autocmd"（マクロ） の初期化
augroup MyAutoCmd
    autocmd!
augroup END

" TODO: ウィンドウサイズ記憶する
" ウィンドウ幅
set columns=360
" ウィンドウ高
set lines=180
" ウィンドウ位置
if has("gui")
    winpos 200 10
endif

" "Vim" 毎のrcファイル パス設定
let g:rc_dir = expand("~/dotfiles")

" rcファイル 読込み関数
function! s:source_rc(rc_file_name)
    let rc_file = expand(g:rc_dir . "/" . a:rc_file_name)
    if filereadable(rc_file)
        execute "source" rc_file
    endif
endfunction

" GUI 基本設定
call s:source_rc(".gvimrc")

" "NeoVim" 専用設定
if (has("unix") && !has("mac"))
    Guifont! Cica\ 16

elseif (has("unix") && has("mac"))
    if hostname()     == "ProSalad13-2018.local"
        Guifont! Cica:h18
    elseif hostname() == "saladserver.com"
        Guifont! Cica:h16
    elseif hostname() == "SaladBook.local"
        Guifont! Cica:h18
    else
        Guifont! Cica:h18
    endif

elseif (has("win32") || has("win64"))
    " Home setting
    if hostname()     == "SALADPRIMEMK-II"
        Guifont! Cica:h12
    elseif hostname() == "SALADCARBONX1"
        Guifont! Cica:h13

    " muRata setting
    elseif hostname() == "HBAMB748"
        Guifont! Cica:h14
    elseif hostname() == "HBAMB819"
        Guifont! Cica:h12
    elseif hostname() == "HBAPC511"
        Guifont! Cica:h16
    elseif hostname() == "HBALT071"
        Guifont! Cica:h16
    endif
    " colorscheme iceberg
endif
