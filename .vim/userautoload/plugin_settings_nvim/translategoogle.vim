scriptencoding utf-8
" Created:     2018/10/24 10:53:36
" Last Change: 2018/10/24 11:01:17.

nmap <Leader>gij :<C-u>TranslateGoogleCmd --sl=en --tl=ja<Space>
nmap <Leader>gie :<C-u>TranslateGoogleCmd --sl=ja --tl=en<Space>

nnoremap <expr> <Leader>gj ':TranslateGoogleCmd --sl=en --tl=ja ' . expand('<cword>') . ''
nnoremap <expr> <Leader>ge ':TranslateGoogleCmd --sl=ja --tl=en ' . expand('<cword>') . ''

