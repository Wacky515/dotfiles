scriptencoding utf-8
" Last Change:2018/07/21 19:38:18.

" q: バッファを閉じる
autocmd FileType ref-* nnoremap <buffer> <silent> q :<C-u>close<CR>

" TODO: 動作しない
let s:lynx = 'C:/Program Files (x86)/Lynx for Win32/lynx.exe'
let s:cfg  = 'C:/Program Files (x86)/Lynx for Win32/lynx.cfg'

" let g:ref_lynx_cmd = s:lynx.' -cfg='.s:cfg.' -dump -nonumbers %s'
let g:ref_source_webdict_cmd = s:lynx.' -cfg='.s:cfg.' -dump -nonumbers %s'

" 辞書サイトの設定
let g:ref_source_webdict_cmd = 'lynx -dump -nonumbers %s'
let g:ref_source_webdict_use_cache = 1

let g:ref_source_webdict_sites = {
\   'je': {
\     'url': 'http://dictionary.infoseek.ne.jp/jeword/%s',
\   },
\   'ej': {
\     'url': 'http://dictionary.infoseek.ne.jp/ejword/%s',
\   },
\   'alc': {
\     'url': 'http://eow.alc.co.jp/%s/UTF-8/',
\   },
\   'wiki': {
\     'url': 'http://ja.wikipedia.org/wiki/%s',
\   },
\ }

" FIXME: body empty になる
" 出力に対するフィルタ
    " 最初の数行を削除
" function! g:ref_source_webdict_sites.je.filter(output)
"     return join(split(a:output, "\n")[15 :], "\n")
" endfunction
"
" function! g:ref_source_webdict_sites.ej.filter(output)
"     return join(split(a:output, "\n")[15 :], "\n")
" endfunction
"
" function! g:ref_source_webdict_sites.alc.filter(output)
"       return join(split(a:output, "\n")[42 :], "\n")
" endfunction
"
" function! g:ref_source_webdict_sites.wiki.filter(output)
"     return join(split(a:output, "\n")[17 :], "\n")
" endfunction

" デフォルトサイトの設定
let g:ref_source_webdict_sites.default = 'ej'

nmap <Leader>dij :<C-u>Ref webdict je<Space>
nmap <Leader>die :<C-u>Ref webdict ej<Space>
nmap <Leader>dia :<C-u>Ref webdict alc<Space>
nmap <Leader>diw :<C-u>Ref webdict wiki<Space>

nnoremap <expr> <Leader>dj ':Ref webdict je ' . expand('<cword>') . ''
nnoremap <expr> <Leader>de ':Ref webdict ej ' . expand('<cword>') . ''
nnoremap <expr> <Leader>da ':Ref webdict alc ' . expand('<cword>') . ''
nnoremap <expr> <Leader>dw ':Ref webdict wiki ' . expand('<cword>') . ''

" DEP:
" ,ra: アルクの辞書起動
" nmap ,ra :<C-u>Ref alc<Space>

" 表示する行数
let g:ref_alc_start_linenumber = 39
