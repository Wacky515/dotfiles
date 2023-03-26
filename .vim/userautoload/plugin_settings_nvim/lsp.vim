scriptencoding utf-8
" Created:     2019/06/24 11:32:20
" Last Change: 2023/03/23 09:47:04.

" ------------------------------------------------------------------------------
"  マップキー
" ------------------------------------------------------------------------------
" MEMO: まず "F6" 押下
" <Leader>d:  定義元ジャンプ
    " MEMO: デフォルト "ctags" の同機能を上書き
nmap <silent> <Leader>d  :<C-u>LspDefinition<CR>
" <Leader>ls: 定義元ジャンプ 水平分割
nmap <silent> <Leader>ls :<C-u>split  \| :LspDefinition<CR>
" <Leader>lv: 定義元ジャンプ 垂直分割
nmap <silent> <Leader>lv :<C-u>vsplit \| :LspDefinition<CR>
" <Leader>p:  カーソル位置の定義情報 ホバー表示
nmap <silent> <Leader>p  :<C-u>LspHover<CR>
" <Leader>k:  変数リネーム
nnoremap <LocalLeader>r  :<C-u>LspRename<CR>
" <Leader>R:  参照元ジャンプ
nmap <silent> <Leader>R  :<C-u>LspReferences<CR>
" <Leader>i:  全実装と "Interface" 表示
nmap <silent> <Leader>i  :<C-u>LspImplementation<CR>
" <Leader>f:  "Lint" を "QuickFix" 表示
nnoremap <LocalLeader>f  :<C-u>LspDocumentDiagnostics<CR>
" <Leader>s:  テキスト整形
nnoremap <LocalLeader>s  :<C-u>LspDocumentFormat<CR>
" ]e:         次のエラーへジャンプ
nnoremap <silent> ]e     :<C-u>LspNextError<CR>
" [e:         前のエラーへジャンプ
nnoremap <silent> [e     :<C-u>LspPreviousError<CR>
" ]d:         次の診断へジャンプ
nnoremap <silent> ]d     :<C-u>LspNextDiagnostic<CR>
" [d:         前の診断へジャンプ
nnoremap <silent> [d     :<C-u>LspPreviousDiagnostic<CR>

" ------------------------------------------------------------------------------
"  基本設定
" ------------------------------------------------------------------------------
" "vim-lsp" オプション設定
let g:lsp_signs_enabled           = 1
let g:lsp_diagnostics_enabled     = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_virtual_text_enabled    = 1
let g:lsp_signs_error             = {'text': ''}
let g:lsp_signs_warning           = {'text': ''}
let g:lsp_signs_information       = {'text': 'i'}
let g:lsp_signs_hint              = {'text': '?'}

" "Python" の "pyls" 起動
" MEMO: ```pip install python-language-server```
if executable("pyls")
    autocmd User lsp_setup call lsp#register_server({
                \ "name":             "pyls",
                \ "cmd":              {server_info->["pyls"]},
                \ "whitelist":        ["python"],
                \ 'workspace_config': s:pyls_config,
                \ })
endif

" "pyls" 設定
let s:pyls_config = {"pyls": {
                    \ "plugins": {
                    \ "pycodestyle":     {"enabled": v:true},
                    \ "pydocstyle":      {"enabled": v:false},
                    \ "pylint":          {"enabled": v:false},
                    \ "flake8":          {"enabled": v:true},
                    \ "jedi_definition": {"follow_imports":         v:true,
                                        \ "follow_builtin_imports": v:true,},
    \ }}}

" オムニ補完を利用する場合、定義の追加
set omnifunc=lsp#complete

" "Go" の "go-langserver" 起動
if executable("go-langserver")
    autocmd User lsp_setup call lsp#register_server({
                \ "name": "go-langserver",
                \ "cmd":  {server_info->["go-langserver",
                                        \ "-mode",
                                        \ "stdio"]},
                \ "whitelist": ["go"],
                \ })
endif
