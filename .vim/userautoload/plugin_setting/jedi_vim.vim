scriptencoding utf-8

" 補完時に "docstring" を表示しない
autocmd FileType python setlocal completeopt-=preview

" "neocomplete" と連携
autocmd FileType python setlocal omnifunc=jedi#completions
" vimの自動設定OFF
" 勝手に "completeopt+=preview" するのでOFF
let g:jedi#auto_vim_configuration = 0

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'

" 関数・メソッドの定義を表示しない
" (カーソルの移動が遅いと思う場合）
" let g:jedi#show_function_definition = 0

let g:jedi#auto_initialization = 1

" ショートカットキー
nnoremap [jedi] <Nop>
xnoremap [jedi] <Nop>
" TODO: キーを潰していないか確認
nmap <Leader>j [jedi]
xmap <Leader>j [jedi]

" !!!: <Ctrl>の代わりに<Leader>で発動するために一旦Kill
" !!!: "Linux" は<Ctrl><Space>dehokanが使えない
if has("unix")
    let g:jedi#completions_command = "<C-N>"
endif
" TODO: キーを潰していないか確認
" <Ctrl>g: 変数宣言へジャンプ
" let g:jedi#goto_assignments_command = "<C-g>"
" <Ctrl>d: 関数・クラスの定義へジャンプ
" let g:jedi#goto_definitions_command = "<C-d>"
" !!!: これだけは "K"
" FIXME: 効かない
" <Ctrl>k: Pydocを表示
" let g:jedi#documentation_command = "<C-k>"
" [jedi]r: 関数・クラスのリネーム
" let g:jedi#rename_command = "[jedi]r"
" [jedi]n: カーソル下の変数一覧
" let g:jedi#usages_command = "[jedi]n"

" 補完の最初を選択しない
let g:jedi#popup_select_first = 0
" "." で補完を開始しない
let g:jedi#popup_on_dot = 0
