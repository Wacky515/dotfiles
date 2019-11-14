scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2019/10/29 09:37:19.

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

" 基本設定
call s:source_rc(".vimrc")

" NeoVim 専用設定
colorscheme iceberg

" ee: "TComment" 起動
nnoremap <silent> ee :<C-u>TComment<CR>
