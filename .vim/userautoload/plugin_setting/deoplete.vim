scriptencoding utf-8
" Created:     2018/09/13 22:57:48
" Last Change: 2018/09/20 15:44:57.

" MEMO: "dein.toml" に移管
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#auto_complete_delay = 0
" let g:deoplete#auto_complete_start_length = 1
" let g:deoplete#enable_camel_case = 0
" let g:deoplete#enable_ignore_case = 0
" let g:deoplete#enable_refresh_always = 0
" let g:deoplete#enable_smart_case = 1
" let g:deoplete#file#enable_buffer_path = 1
" let g:deoplete#max_list = 10000

inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-l> deoplete#complete_common_string()
inoremap <expr><C-i> deoplete#complete_common_string()
