scriptencoding utf-8
" Created:     2018/03/19 20:47:58
" Last Change: 2018/12/14 16:55:43.

" ---------------------------------------------------------------------------
" マップキー
" ---------------------------------------------------------------------------
nnoremap [unite] <Nop>
nmap U [unite]

" UM: 最近使用したファイル一覧
nnoremap <silent> [unite]M :Unite file_mru<CR>
" nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
" UB: 現在のバッファ一覧
nnoremap <silent> [unite]B :<C-u>Unite buffer<CR>
" UF: 現在のバッファのディレクトリ一覧
nnoremap <silent> [unite]F :<C-u>UniteWithBufferDir
            \ -buffer-name=files file<CR>
" UT: バッファを新しいタブで開く
nnoremap <silent> [unite]T :<C-u>Unite tab<CR>
" UW: 最近使用したウィンドウ一覧
nnoremap <silent> [unite]W :<C-u>Unite window<CR>
" UC: ブックマーク一覧
nnoremap <silent> [unite]C :<C-u>Unite bookmark<CR>
" UA: ブックマークに追加
nnoremap <silent> [unite]A :<C-u>UniteBookmarkAdd<CR>
" UR: レジスタ一覧
nnoremap <silent> [unite]R :<C-u>Unite register<CR>
" UL: Colorscheme プレビュー
nnoremap <silent> [unite]L :<C-u>Unite
            \ -auto-preview
            \ colorscheme<CR>

" Uniteを開いている間のキーマッピング
if globpath(&rtp, 'plugin/unite.vim') != ''
    nnoremap sc :<C-u>Unite colorscheme font<Cr>
endif

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
    " <Esc>: 終了
    nmap <buffer> <Esc> <Plug>(unite_exit)
    " jj: ノーマルモードに移動
    imap <buffer> jj <Plug>(unite_insert_leave)
    " <Ctrl>w: バックスラッシュ削除
    imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
    " <Ctrl>h: 縦に分割して開く
    nnoremap <silent> <buffer> <expr> <C-h> unite#do_action('split')
    inoremap <silent> <buffer> <expr> <C-h> unite#do_action('split')
    " <Ctrl>v: 横に分割して開く
    nnoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
    inoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
    " <Ctrl>o: その場所に開く
    nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
    inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
endfunction

" ---------------------------------------------------------------------------
" 基本設定
" ---------------------------------------------------------------------------
" 挿入モードで開始
let g:unite_enable_start_insert = 1
" Uniteを縦分割で開始
let g:unite_enable_split_vertically = 1
" 最近開いたファイル履歴の保存数
let g:unite_source_file_mru_limit = 1000
"file_mruの表示フォーマットを指定
    "空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ""

" ---------------------------------------------------------------------------
" Diff設定
" ---------------------------------------------------------------------------
" MEMO: 使い方不明・・・
" FIXME: E117発生のためキル

" let diff_action = {
"             \ 'description' : 'diff',
"             \ 'is_selectable' : 1,
"             \ }

" function! diff_action.func(candidates)
"     if len(a:candidates) == 1
"         " カレントバッファとdiff
"         execute 'vert diffsplit ' . a:candidates[0].action__path
"     elseif len(a:candidates) == 2
"         " 選択されたファイルとdiff
"         execute 'tabnew ' . a:candidates[0].action__path
"         execute 'vert diffsplit ' . a:candidates[1].action__path
"     else
"         " 3-way以上は非対応
"         echo 'too many candidates!'
"     endif
" endfunction

" FIXME: ↓でE117発生
" " call unite#custom_action('file', 'diff', diff_action)

" unlet diff_action

" ---------------------------------------------------------------------------
"  RipGrep設定
" ---------------------------------------------------------------------------
if executable('rg')
    let g:unite_source_grep_command = 'rg'
    let g:unite_source_grep_default_opts = '-n --no-heading --color never'
    let g:unite_source_grep_recursive_opt = ''
    " Hit件数制御
    let g:unite_source_grep_max_candidates = 200
    " "Windows" 設定
    let g:unite_source_grep_encoding='utf-8'
endif

" ---------------------------------------------------------------------------
" unite-tagsの設定
" ---------------------------------------------------------------------------
" autocmd BufEnter *
"             \    if empty(&buftype)
"             \ |      nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord -immediately tag<CR>
"             \ |  endif

