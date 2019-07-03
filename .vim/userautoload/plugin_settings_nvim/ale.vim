scriptencoding utf-8
" Created:     2018/03/15 13:25:06
" Last Change: 2019/07/03 09:09:21.

" ---------------------------------------------------------------------------
"  マップキー
" ---------------------------------------------------------------------------
" F11: ALE修正
nnoremap <F11> :ALEFix<CR>

" <Ctrl>k: 次の修正
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" <Ctrl>j: 前の修正
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" ---------------------------------------------------------------------------
"  基本設定
" ---------------------------------------------------------------------------
" ALE実行タイミング
let g:ale_lint_on_text_changed = 1
" 左端のシンボルカラムを常に表示
let g:ale_sign_column_always = 1

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
let g:ale_statusline_format = [' %d', ' %d', ' OK']

" MEMO: Lintを別途インストール必要
let g:ale_linters = {
            \ 'text': ['textlint'],
            \ 'markdown': ['markdownlint', 'textlint'],
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
if has("gui_running")
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
                \ 'php': ['phpcbf']
                \ }
endif

let g:ale_python_pylint_executable = 'pylint3'
let g:ale_php_phpcs_standard = 'psr2'
let g:ale_php_phpcbf_standard = 'psr2'
let g:ale_php_phpmd_ruleset = 'codesize,design,unusedcode,naming'

" ロケーションリストの代わりにQuickFixを使用
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" エラーと警告の一覧ウィンドウ
let g:ale_open_list = 1

" エラーと警告がなくなっても開いたままにしない
let g:ale_keep_list_window_open = 0

" エラーメッセージのフォーマット
let g:ale_echo_msg_error_str = ''
let g:ale_echo_msg_warning_str = ''
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

