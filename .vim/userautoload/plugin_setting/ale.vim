scriptencoding utf-8
" Created:     2018/03/15 13:25:06
" Last Change: 2018/11/12 16:12:17.

" ---------------------------------------------------------------------------
"  マップキー
" ---------------------------------------------------------------------------
" F11: ALE修正
" nnoremap <C-a><C-f> :ALEFix<CR>
nnoremap <F11> :ALEFix<CR>

" <Ctrl>k: 次の修正
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" <Ctrl>j: 前の修正
nmap <silent> <C-j> <Plug>(ale_next_wrap)
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
" \
" let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok'] "  }}}}

let g:ale_statusline_format = [' %d', ' %d', ' ok']

" ALE実行タイミング
let g:ale_lint_on_text_changed = 1

let g:ale_linters = {
            \ 'markdown': ['markdownlint'],
            \ 'python': ['pylint'],
            \ 'go': ['golint'],
            \ 'java': ['javac'],
            \ 'c': ['clang'],
            \ 'php': ['phpcs', 'phpmd'],
            \ 'cpp': ['clang'],
            \ 'objc': ['clang'],
            \ 'objcpp': ['clang'],
            \ }

" 自動整形
let g:ale_fixers = {
            \ 'markdown': [
                \ {buffer, lines -> {'command': 'textlint
                \ -c ~/.config/textlintrc
                \ -o /dev/null --fix --no-color --quiet %t',
                \ 'read_temporary_file': 1}}
            \ ],
            \ 'python': ['autopep8', 'isort'],
            \ 'go': ['gofmt'],
            \ 'javascript': ['prettier'],
            \ 'php': ['phpcbf'],
            \ }

let g:ale_python_pylint_executable = 'pylint3'
let g:ale_php_phpcs_standard = 'psr2'
let g:ale_php_phpcbf_standard = 'psr2'
let g:ale_php_phpmd_ruleset = 'codesize,design,unusedcode,naming'
