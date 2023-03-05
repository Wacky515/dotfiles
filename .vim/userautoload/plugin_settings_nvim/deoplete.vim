scriptencoding utf-8
" Created:     2018/09/13 22:57:48
" Last Change: 2021/02/25 22:59:07.

" ------------------------------------------------------------------------------
"  マップキー
" ------------------------------------------------------------------------------
" TODO: "dein.toml" に移管した設定を戻したい  " {{{
" inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
" inoremap <expr><C-l> deoplete#complete_common_string()
" inoremap <expr><C-i> deoplete#complete_common_string()
" inoremap <expr><tab> pumvisible() ? "\<C-n>" :
"         \ neosnippet#expandable_or_jumpable() ?
"         \ "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"
" }}}

" ------------------------------------------------------------------------------
"  基本設定
" ------------------------------------------------------------------------------
" MEMO: .vimrc に遷移  " {{{
" TEMP: "roxma/nvim-yarp" と "roxma/vim-hug-neovim-rpc" を
" "dein_lazy.toml" でインストールできないので以下で代替
" call dein#add('roxma/nvim-yarp')
" call dein#add('roxma/vim-hug-neovim-rpc')
" }}}

" " 一つ目の候補を選択状態にする
" set completeopt+=noinsert

" TODO: "dein.toml" に移管した設定を戻したい  " {{{
" let g:deoplete#auto_complete_delay        = 0
" let g:deoplete#enable_at_startup          = 1

" let g:deoplete#auto_complete_start_length = 1
" let g:deoplete#enable_camel_case          = 0
" let g:deoplete#enable_ignore_case         = 0
" let g:deoplete#enable_refresh_always      = 0
" let g:deoplete#enable_smart_case          = 1
" let g:deoplete#file#enable_buffer_path    = 1
" let g:deoplete#max_list                   = 10000
" }}}

" call deoplete#custom#option({
" \ 'auto_complete_delay' : 0,
" \ 'refresh_always'      : v:true,
" \ 'smart_case'          : v:true,
" \ 'max_list'            : 10000,
" \ })
" \ 'auto_complete_start_length' : 1,

" ------------------------------------------------------------------------------
"  Jedi
" ------------------------------------------------------------------------------
let   g:deoplete#sources#jedi#server_timeout=100
let g:deoplete#sources#jedi#statement_length=100

" "jedi" の補完 OFF
    " "deoplete-jedi" で非同期処理してくれる
let g:jedi#completions_enabled = 0

if has("mac")
    let g:deoplete#sources#jedi#python_path = "/usr/local/bin/python3"
elseif has("unix")
    let g:deoplete#sources#jedi#python_path = "/usr/local/bin/python3"
endif
