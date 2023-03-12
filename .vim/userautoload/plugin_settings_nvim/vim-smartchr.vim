scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2023/03/11 22:18:33.

" ------------------------------------------------------------------------------
"  マップキー
" ------------------------------------------------------------------------------
inoremap <expr> = smartchr#loop('=', ' = ', '==', ' == ', ' === ', '=> ')
inoremap <expr> + smartchr#loop('+', ' + ', '++')
inoremap <expr> - smartchr#loop('-', ' - ', '--', '---')
inoremap <expr> * smartchr#loop('*', ' * ', '**', '***')
inoremap <expr> / smartchr#loop('/', ' / ', '// ')
inoremap <expr> < smartchr#loop('<', '<<',  '<< ', ' << ', '<- ', ' < ')
inoremap <expr> > smartchr#loop('>', '>>',  '>> ', ' >> ', ' ->', ' > ')

" MEMO: lexima.vim と干渉
" inoremap <expr> [ smartchr#loop('[', '- [ ] ')
