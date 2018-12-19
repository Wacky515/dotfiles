scriptencoding utf-8
" Created:     2018/09/13 12:19:02
" Last Change: 2018/09/13 12:31:47.

" <Leader>m: "vim-over" 起動
nnoremap <silent> <Leader>m :OverCommandLine<CR>

" sub: カーソル下をハイライト付きで置換
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>

" sup: コピーした文字列をハイライト付きで置換
nnoremap sup y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>
