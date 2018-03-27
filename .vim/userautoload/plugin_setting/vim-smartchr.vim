scriptencoding utf-8
" Last Change: 2018/03/17 09:55:18.

inoremap <expr> = smartchr#loop("=", "==", ' = ', ' == ', ' === ', '=>')
inoremap <expr> + smartchr#loop('+', ' + ', '++')
inoremap <expr> - smartchr#loop('-', ' - ', '--')
inoremap <expr> / smartchr#loop('/', ' / ', '// ')
inoremap <expr> * smartchr#loop('*', ' * ')
inoremap <expr> < smartchr#loop('<', '<-', ' < ', ' << ')
inoremap <expr> > smartchr#loop('>', '->', ' > ', ' >> ')
