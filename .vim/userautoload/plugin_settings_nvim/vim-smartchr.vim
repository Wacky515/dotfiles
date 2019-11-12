scriptencoding utf-8
" Last Change: 2018/05/03 11:09:42.

inoremap <expr> = smartchr#loop("=", "==", ' = ', ' == ', ' === ', '=>')
inoremap <expr> + smartchr#loop('+', '++', ' + ')
inoremap <expr> - smartchr#loop('-', '--', '---', ' - ')
inoremap <expr> / smartchr#loop('/', '// ', ' / ')
inoremap <expr> * smartchr#loop('*', '**', '***', ' * ')
inoremap <expr> < smartchr#loop('<', '<<', '<< ', ' << ', '<-', ' < ')
inoremap <expr> > smartchr#loop('>', '>>', '>> ', ' >> ', '->', ' > ')
inoremap <expr> [ smartchr#loop('[', '- [ ] ')
