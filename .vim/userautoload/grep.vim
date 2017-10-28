scriptencoding utf-8

" 外部grepの設定と除外するファイル
set grepprg=grep\ -rnIH\ --exclude-dir=.svn\ --exclude-dir=.git\ --exclude-dir=node_modules\ --exclude-dir=db\ --exclude-dir=tmp\ --exclude-dir=log\ --exclude-dir=vendor\ --exclude-dir=tags\ --exclude="*.min.js\

" <Leader>g: カーソル下を "vimgrep" 対象に挿入
nnoremap <expr> <Leader>g ':vimgrep /\<' . expand('<cword>') . '\>/j **/*.' . expand('%:e')
