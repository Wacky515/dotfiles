scriptencoding utf-8

" "F6" で "ctags" 作成
nnoremap <f6> :!ctags -R<CR>

" ファイルを保存時に "ctags" 作成
autocmd BufWritePost* call system("ctags -R")

