scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2019/11/25 11:37:27.

" --------------------------------------------------------------------------------
" マップキー
" --------------------------------------------------------------------------------
" <Leader>fi: "VimFiler" を開く
nnoremap <silent> <Leader>fi :<C-u>VimFiler<CR>

" --------------------------------------------------------------------------------
" 基本設定
" --------------------------------------------------------------------------------
" VimFilerをデフォルトのファイラにする
    " ":e ." で起動
let g:vimfiler_as_default_explorer=1

" MEMO: NERDTreeに移行
" " <Leader>o: 現在開いているバッファをIDE風に開く
" nnoremap <silent> <Leader>o :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>
" " nnoremap <C-o> :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>
