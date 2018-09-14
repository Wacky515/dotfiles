scriptencoding utf-8
" Created:     2018/03/19 20:47:58
" Last Change: 2018/09/14 18:42:18.

inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-l> neocomplete#complete_common_string()
inoremap <expr><C-i> neocomplete#complete_common_string()
