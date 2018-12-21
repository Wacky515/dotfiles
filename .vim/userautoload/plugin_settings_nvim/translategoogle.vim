scriptencoding utf-8
" Created:     2018/10/24 10:53:36
" Last Change: 2018/12/21 09:38:40.

nmap ,gij :<C-u>TranslateGoogleCmd --sl=en --tl=ja<Space>
nmap ,gie :<C-u>TranslateGoogleCmd --sl=ja --tl=en<Space>

nnoremap <expr> ,gj ':TranslateGoogleCmd --sl=en --tl=ja ' . expand('<cword>') . ''
nnoremap <expr> ,ge ':TranslateGoogleCmd --sl=ja --tl=en ' . expand('<cword>') . ''

