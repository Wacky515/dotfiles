scriptencoding utf-8
" Created:     2018/03/19 20:47:58
" Last Change: 2018/09/22 20:17:30.

" MEMO: "deoplete" に移管するので "dein.toml" に記述移管
" ---------------------------------------------------------------------------
" マップキー
" ---------------------------------------------------------------------------
" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><C-l> neocomplete#complete_common_string()
" inoremap <expr><C-i> neocomplete#complete_common_string()
" inoremap <expr><tab> pumvisible() ? "\<C-n>" :
"             \ neosnippet#expandable_or_jumpable() ?
"             \ "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"