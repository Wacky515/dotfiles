scriptencoding utf-8
" Last Change: 2018/03/17 22:22:06.

" 自動で初期化
let g:jedi#auto_initialization = 1

" 補完の最初を選択しない
let g:jedi#popup_select_first = 0

" "." で補完を開始
let g:jedi#popup_on_dot = 1
" "." で補完を開始しない " {{{
" let g:jedi#popup_on_dot = 0
" }}}

" 関数・メソッドの定義を表示
let g:jedi#show_call_sgnatures = 1
" 関数・メソッドの定義を表示しない " {{{
" (カーソルの移動が遅いと思う場合）
" let g:jedi#show_function_definition = 0
" }}}

" 補完時に "docstring" を表示しない
" 画面上部がガタガタ動く
autocmd FileType python setlocal completeopt-=preview

" "neocomplete" と連携
autocmd FileType python setlocal omnifunc=jedi#completions
" vimの自動設定OFF
" 勝手に "completeopt+=preview" するのでOFF
let g:jedi#auto_vim_configuration = 0

" 補完リストが消えるようにする
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'

" ショートカットキー
nnoremap [jedi] <Nop>
xnoremap [jedi] <Nop>
" TODO: キーを潰していないか確認
nmap <Leader>j [jedi]
xmap <Leader>j [jedi]

" !!!: "Linux" は<Ctrl><Space>で補完が使えない
if has("unix")
    let g:jedi#completions_command = "<C-N>"
endif