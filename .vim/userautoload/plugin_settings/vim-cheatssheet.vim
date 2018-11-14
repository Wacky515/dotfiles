scriptencoding utf-8
" Created:     2018/08/16 14:48:53
" Last Change: 2018/08/25 17:46:57.

" チートシートの定義
let g:cheatsheet#cheat_file = '~/dotfiles/.vim/cheatsheet.md'

" 縦分割で表示
let g:cheatsheet#vsplit = 1

" <F7>: チートシート表示
nnoremap <F7> :Cheat<CR>
