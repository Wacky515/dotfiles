scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2020/03/16 10:59:44.

" ------------------------------------------------------------------------------
"  マップキー
" ------------------------------------------------------------------------------
inoremap <expr> = smartchr#loop("=", ' = ', "==", ' == ', ' === ', '=> ')
inoremap <expr> + smartchr#loop('+', ' + ', '++')
inoremap <expr> - smartchr#loop('-', ' - ', '--', '---')
inoremap <expr> * smartchr#loop('*', ' * ', '**', '***')
inoremap <expr> / smartchr#loop('/', ' / ', '// ')
inoremap <expr> < smartchr#loop('<', '<<', '<< ', ' << ', '<- ', ' < ')
inoremap <expr> > smartchr#loop('>', '>>', '>> ', ' >> ', ' ->', ' > ')
inoremap <expr> [ smartchr#loop('[', '- [ ] ')
