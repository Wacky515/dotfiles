scriptencoding utf-8
" Last Change: 2018/03/19 14:38:48.

" VimFilerをデフォルトのファイラにする
    " ":e ." で起動
let g:vimfiler_as_default_explorer=1

" <Ctrl>o: 現在開いているバッファをIDE風に開く
nnoremap <C-o> :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>

" <Leader>fi: "VimFiler" を開く
nnoremap <silent> <Leader>fi :<C-u>VimFiler<CR>
