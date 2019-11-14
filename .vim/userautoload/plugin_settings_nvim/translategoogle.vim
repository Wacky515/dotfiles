scriptencoding utf-8
" Created:     2018/10/24 10:53:36
" Last Change: 2019/10/17 10:50:30.

nmap ,jig :<C-u>TranslateGoogleCmd --sl=en --tl=ja<Space>
nmap ,eig :<C-u>TranslateGoogleCmd --sl=ja --tl=en<Space>

nnoremap <expr> ,jg ':TranslateGoogleCmd --sl=en --tl=ja ' . expand('<cword>') . ''
nnoremap <expr> ,eg ':TranslateGoogleCmd --sl=ja --tl=en ' . expand('<cword>') . ''
