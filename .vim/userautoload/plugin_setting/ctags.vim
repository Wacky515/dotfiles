scriptencoding utf-8
" Last Change: 2018/03/30 14:15:13.

" 再帰的に処理
set tags=./tags;

" <F6> で "ctags" 作成
nnoremap <F6> :<C-u>!ctags -R<CR>

" ファイルを保存時に "ctags" 作成
autocmd BufWritePost * call system("ctags -R")
