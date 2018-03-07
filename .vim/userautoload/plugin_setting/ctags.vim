scriptencoding utf-8

" 再帰的に処理
set tags=./tags;

" <F6> で "ctags" 作成
nnoremap <F6> :!ctags -R<CR>

" " ファイルを保存時に "ctags" 作成
" autocmd BufWritePost * call system("ctags -R")
