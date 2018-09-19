scriptencoding utf-8
" Created:     2018/09/13 22:57:48
" Last Change: 2018/09/19 10:55:35.

" let g:deoplete#enable_at_startup = 1
" let g:deoplete#auto_complete_delay = 0

inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-l> deoplete#complete_common_string()
inoremap <expr><C-i> deoplete#complete_common_string()
