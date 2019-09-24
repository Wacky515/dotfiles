scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2019/07/02 12:32:06.
" MEMO: "VeoVim" が起動しない時は "dein" のディレクトリを消す

" !!!: 必ず先頭に記述
" "autocmd"（マクロ） の初期化
augroup MyAutoCmd
    autocmd!
augroup END

if has("linux")
    execute "source" "~/.vimrc"
    if !has("gui_running")
        execute "source" "~/.gvimrc"
    endif
elseif has("mac")
    execute "source" "~/.vimrc"
    if !has("gui_running")
        execute "source" "~/.gvimrc"
    endif
    " colorscheme iceberg
elseif (has("win32") || has("win64"))
    execute "source" "~/.vimrc"
    if !has("gui_running")
        execute "source" "~/.gvimrc"
    endif
    colorscheme iceberg
endif

" "Vim" 毎のrcファイルパス設定
let g:rc_dir = expand("~/dotfiles")

" rcファイル読込み関数
function! s:source_rc(rc_file_name)
    let rc_file = expand(g:rc_dir . "/" . a:rc_file_name)
    if filereadable(rc_file)
        execute "source" rc_file
    endif
endfunction

" 基本設定
call s:source_rc(".vimrc")

