scriptencoding utf-8
" Last Change:2018/09/06 22:21:22.

" q: バッファを閉じる
autocmd FileType ref-* nnoremap <buffer> <silent> q :<C-u>close<CR>

" DEP: TODO: 動作しない  {{{
" let s:lynx = 'C:\Program Files (x86)\Lynx for Win32\lynx.exe'
" let s:cfg  = 'C:\Program Files (x86)\Lynx for Win32\lynx.cfg'
" let s:lynx = 'C:\Users\mm12167\vim81-kaoriya-win64\lynx.exe'
" let s:cfg  = 'C:\Users\mm12167\vim81-kaoriya-win64\lynx.cfg'
" if has("win32")
"     " let s:lynx = '~/Lynx_for_Win32/lynx.exe'
"     " let s:cfg  = '~/Lynx_for_Win32/lynx.cfg'
"     let s:lynx = '%homepath%\Lynx_for_Win32\lynx.exe'
"     let s:cfg  = '%homepath%\Lynx_for_Win32\lynx.cfg'
" endif
" let g:ref_source_webdict_cmd = s:lynx.' -cfg='.s:cfg.' -dump -nonumbers %s'

" "lynx" 文字化け対策の設定 <- 無意味
" let g:ref_refe_encoding = 'euc-jp'
" let g:ref_refe_encoding = 'utf-8'
"
" let s:lynx = 'C:/Users/mm12167/Lynx_for_Win32/lynx.exe'
" let s:cfg  = 'C:/Users/mm12167/Lynx_for_Win32/lynx.cfg'
"  }}}

let g:ref_source_webdict_cmd = 'lynx -dump -nonumbers %s'

" エンコード
    " "lynx" 文字化け対策の設定
" let g:ref_source_webdict_encoding = 'utf-8'
if has('win32') || has ('win64')
    let g:ref_source_webdict_encoding = 'shift-jis'
else
    let g:ref_source_webdict_encoding = 'utf-8'
endif

" 辞書サイトの設定
let g:ref_source_webdict_use_cache = 1

let g:ref_source_webdict_sites = {
\   'je': {
\     'url': 'http://dictionary.infoseek.ne.jp/jeword/%s',
\   },
\   'ej': {
\     'url': 'http://dictionary.infoseek.ne.jp/ejword/%s',
\   },
\   'alc': {
\     'url': 'https://eow.alc.co.jp/search?q=%s',
\   },
\   'wiki': {
\     'url': 'https://ja.wikipedia.org/wiki/%s',
\     'keyword_encoding': 'Shift-JIS',
\   },
\ }
" \     'url': 'http://eow.alc.co.jp/%s/UTF-8/',
" \     'url': 'https://eow.alc.co.jp/%s/UTF-8/',
" \     'url': 'http://ja.wikipedia.org/wiki/%s',

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

" 表示する行数
" MEMO: ヘルプにヒットしない、DEP: と思われる
" let g:ref_alc_start_linenumber = 39
