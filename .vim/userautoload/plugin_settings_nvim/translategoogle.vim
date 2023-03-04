scriptencoding utf-8
" Created:     2018/10/24 10:53:36
" Last Change: 2019/11/22 17:31:31.

" ------------------------------------------------------------------------------
"  マップキー
" ------------------------------------------------------------------------------
nmap ,jig :<C-u>TranslateGoogleCmd --sl=en --tl=ja<Space>
nmap ,eig :<C-u>TranslateGoogleCmd --sl=ja --tl=en<Space>

nnoremap <expr> ,jg ':TranslateGoogleCmd --sl=en --tl=ja ' . expand('<cword>') . ''
nnoremap <expr> ,eg ':TranslateGoogleCmd --sl=ja --tl=en ' . expand('<cword>') . ''
