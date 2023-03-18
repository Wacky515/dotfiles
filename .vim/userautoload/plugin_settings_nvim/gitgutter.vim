scriptencoding utf-8
" Create:      2023/03/12 05:11:53
" Last Change: 2023/03/18 16:18:33.

" ------------------------------------------------------------------------------
"  基本設定
" ------------------------------------------------------------------------------
" 起動時 ハイライト 有効
let g:gitgutter_highlight_lines = 1

" <Leader>g: Git 変更部ハイライト トグル
nnoremap <Leader>g :<C-u>GitGutterLineHighlightsToggle<CR>
