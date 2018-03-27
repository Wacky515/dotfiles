scriptencoding utf-8

let g:ale_linters = {
\   'python': ['pylint'],
\   'go': ['golint'],
\   'c': ['clang'],
\   'cpp': ['clang'],
\   'php': ['phpcs', 'phpmd'],
\   'objc': ['clang'],
\   'objcpp': ['clang'],
\   'java': ['javac'],
\}

let g:ale_fixers = {
\   'php': ['phpcbf'],
\   'go': ['gofmt'],
\}

let g:ale_python_pylint_executable = 'pylint3'
let g:ale_php_phpcs_standard = 'psr2'
let g:ale_php_phpcbf_standard = 'psr2'
let g:ale_php_phpmd_ruleset = 'codesize,design,unusedcode,naming'

nnoremap <C-a><C-f> :ALEFix<CR>
nnoremap <F11> :ALEFix<CR>
