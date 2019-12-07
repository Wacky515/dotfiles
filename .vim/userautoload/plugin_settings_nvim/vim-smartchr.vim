scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2019/11/25 09:22:34.

" --------------------------------------------------------------------------------
" マップキー
" --------------------------------------------------------------------------------
inoremap <expr> = smartchr#loop("=", ' = ', "==", ' == ', ' === ', '=> ')
inoremap <expr> + smartchr#loop('+', ' + ', '++')
inoremap <expr> - smartchr#loop('-', ' - ', '--', '---')
inoremap <expr> * smartchr#loop('*', ' * ', '**', '***')
inoremap <expr> / smartchr#loop('/', ' / ', '// ')
inoremap <expr> < smartchr#loop('<', ' < ', '<<', '<< ', ' << ', '<- ')
inoremap <expr> > smartchr#loop('>', ' > ', '>>', '>> ', ' >> ', ' ->')
inoremap <expr> [ smartchr#loop('[', '- [ ] ')
