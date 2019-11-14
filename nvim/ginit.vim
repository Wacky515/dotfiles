scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2019/10/28 13:41:16.

" !!!: 必ず先頭に記述
" "autocmd"（マクロ） の初期化
augroup MyAutoCmd
    autocmd!
augroup END

" "Vim" 毎のrcファイルパス設定
let g:rc_dir = expand("~/dotfiles")

" rcファイル読込み関数
function! s:source_rc(rc_file_name)
    let rc_file = expand(g:rc_dir . "/" . a:rc_file_name)
    if filereadable(rc_file)
        execute "source" rc_file
    endif
endfunction

" GUI基本設定
call s:source_rc(".gvimrc")

" NeoVim 専用設定
if has("unix")
    Guifont! Cica\ 16

elseif has("mac")
    if hostname()     == "ProSalad13-2018.local"
        Guifont! Cica:h16
    elseif hostname() == "saladserver.com"
        Guifont! Cica:h24
    elseif hostname() == "SaladBook.local"
        Guifont! Cica:h16
    else
        Guifont! Cica:h16
    endif

elseif (has("win32") || has("win64"))
    if hostname()     == "SALADCARBONX1"
        Guifont! Cica:h13
    elseif hostname() == "HBAMB748"
        Guifont! Cica:h14
    elseif hostname() == "HBAMB819"
        Guifont! Cica:h12
    elseif hostname() == "HBALT071"
        Guifont! Cica:h16
    endif
    colorscheme iceberg
endif

" TODO: ウインドウサイズ記憶する
" ウインドウ幅
set columns=180
" ウインドウ高
set lines=57
" ウインドウ位置
if has("gui")
    winpos  200  10
endif
