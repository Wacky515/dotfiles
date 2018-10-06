scriptencoding utf-8
" Created:     2018/03/15 13:25:06
" Last Change: 2018/10/05 12:39:54.

" ---------------------------------------------------------------------------
"  マップキー
" ---------------------------------------------------------------------------
" <Ctrl>k: 次の指摘へ移動
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" <Ctrl>j: 前の指摘へ移動
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" F11: ALE修正
" nnoremap <C-a><C-f> :ALEFix<CR>
nnoremap <F11> :ALEFix<CR>
" ---------------------------------------------------------------------------
"  基本設定
" ---------------------------------------------------------------------------
" 表示設定
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:airline#extensions#ale#open_lnum_symbol = '('
let g:airline#extensions#ale#close_lnum_symbol = ')'
let g:ale_echo_msg_format = '[%linter%]%code: %%s'
highlight link ALEErrorSign Tag
highlight link ALEWarningSign StorageClass
" "lightline" に記述
" let g:lightline = "  {{{{
"   \ 'active': {
"   \   'left': [
"       \ ['mode', 'paste'],
"       \ ['readonly', 'filename', 'modified', 'ale'],
"   \   ]
"   \ },
"   \ 'component_function': {
"   \ 'ale': 'ALEGetStatusLine'
"   \ }
" \ "  }}}}
" let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_statusline_format = [' %d', ' %d', ' ok']

" 保存時のみ実行
let g:ale_lint_on_text_changed = 0

let g:ale_linters = {
  \ 'python': ['pylint'],
  \ 'go': ['golint'],
  \ 'c': ['clang'],
  \ 'cpp': ['clang'],
  \ 'php': ['phpcs', 'phpmd'],
  \ 'objc': ['clang'],
  \ 'objcpp': ['clang'],
  \ 'java': ['javac'],
\ }

" 自動整形
let g:ale_fixers = {
      \ 'javascript': ['prettier'],
      \ 'python': ['autopep8', 'isort'],
      \ 'markdown': [
        \ {buffer, lines -> {'command': 'textlint
        \ -c ~/.config/textlintrc
        \ -o /dev/null --fix --no-color --quiet %t',
        \ 'read_temporary_file': 1}}
      \   ],
  \ 'php': ['phpcbf'],
  \ 'go': ['gofmt'],
\ }

let g:ale_python_pylint_executable = 'pylint3'
let g:ale_php_phpcs_standard = 'psr2'
let g:ale_php_phpcbf_standard = 'psr2'
let g:ale_php_phpmd_ruleset = 'codesize,design,unusedcode,naming'
