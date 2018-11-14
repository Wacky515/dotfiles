scriptencoding utf-8
" Last Change: 2018/07/17 10:31:42.

" 再帰的に処理
set tags=./tags;

" <F6>: "ctags" 作成
nnoremap <F6> :<C-u>!ctags -R<CR>
" <Ctrl>h: 垂直分割で "ctags" 表示
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
" <Ctrl>l: 水平分割で "ctags" 表示
nnoremap <C-l> :split<CR> :exe("tjump ".expand('<cword>'))<CR>

" ファイルを保存時に "ctags" 作成
autocmd BufWritePost * call system("ctags -R")
