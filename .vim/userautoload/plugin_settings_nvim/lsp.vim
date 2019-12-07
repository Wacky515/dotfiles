scriptencoding utf-8
" Created:     2019/06/24 11:32:20
" Last Change: 2019/10/17 16:42:28.

" ---------------------------------------------------------------------------
" マップキー
" ---------------------------------------------------------------------------
nmap <silent> <Leader>d :LspDefinition<CR>
nmap <silent> <Leader>p :LspHover<CR>
nmap <silent> <Leader>R :LspReferences<CR>
nmap <silent> <Leader>i :LspImplementation<CR>
nmap <silent> <Leader>ls :split \| :LspDefinition <CR>
nmap <silent> <Leader>lv :vsplit \| :LspDefinition <CR>

" ---------------------------------------------------------------------------
" 基本設定
" ---------------------------------------------------------------------------
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

if executable('go-langserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'go-langserver',
        \ 'cmd': {server_info->['go-langserver', '-mode', 'stdio']},
        \ 'whitelist': ['go'],
        \ })
endif
