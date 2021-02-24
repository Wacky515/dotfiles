scriptencoding utf-8
" Created:     201*/**/** **:**:**
<<<<<<< HEAD
" Last Change: 2021/02/22 00:11:13.
=======
" Last Change: 2021/02/23 23:04:21.
>>>>>>> b79cf33351ec8bfea9ed8d4b2b0a55ebb60f80c6

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
if (has("unix") && has("mac"))
    " FIXME: 読込むとエラー
    " call s:source_rc("nvim/ginit.vim")
    set cmdheight=5
endif

if !exists("g:gui_oni")
    " NeoVim 専用設定
    colorscheme iceberg
endif

" ee: "TComment" 起動
nnoremap <silent> ee :<C-u>TComment<CR>
