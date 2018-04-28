scriptencoding utf-8
" Last Change: 2018/04/27 11:20:27.

inoremap <expr> = smartchr#loop("=", "==", ' = ', ' == ', ' === ', '=>')
inoremap <expr> + smartchr#loop('+', '++', ' + ')
inoremap <expr> - smartchr#loop('-', '--', '---', ' - ')
inoremap <expr> / smartchr#loop('/', '// ', ' / ')
inoremap <expr> * smartchr#loop('*', '**', '***', ' * ')
inoremap <expr> < smartchr#loop('<', ' << ', '<-', ' < ')
inoremap <expr> > smartchr#loop('>', ' >> ', '->', ' > ')
inoremap <expr> [ smartchr#loop('[', '- [ ] ')
