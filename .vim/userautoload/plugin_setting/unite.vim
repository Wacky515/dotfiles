scriptencoding utf-8
" Last Change: 2018/08/26 11:54:48.

" 基本設定
" unite general settings
" 挿入モードで開始
let g:unite_enable_start_insert = 1
" Uniteを縦分割で開始
let g:unite_enable_split_vertically = 1
" 最近開いたファイル履歴の保存数
let g:unite_source_file_mru_limit = 1000

" ショートカットキー
nnoremap [unite] <Nop>
nmap U [unite]
" nmap <Leader>u [unite]

" Ub: 現在のバッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
" Uf: 現在のバッファのディレクトリ一覧
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" Ur: レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite register<CR>
" Uc: ブックマーク一覧
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
" Ua: ブックマークに追加
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
" Ut: バッファを新しいタブで開く
nnoremap <silent> [unite]t :<C-u>Unite tab<CR>
" Ul: Colorscheme プレビュー
nnoremap <silent> [unite]l :<C-u>Unite -auto-preview colorscheme<CR>
" Um: 最近使用したファイル一覧
nnoremap <silent> [unite]m :Unite file_mru<CR>
" Uw: 最近使用したウィンドウ一覧
nnoremap <silent> [unite]w :<C-u>Unite window<CR>
"file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ""

" Uniteを開いている間のキーマッピング
if globpath(&rtp, 'plugin/unite.vim') != ''
  nnoremap sc :<C-u>Unite colorscheme font<Cr>
endif

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
	" <Esc>: 終了
	nmap <buffer> <ESC> <Plug>(unite_exit)
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
" diff 設定
" ---------------------------------------------------------------------------
" MEMO: 使い方不明・・・

let diff_action = {
      \   'description' : 'diff',
      \   'is_selectable' : 1,
      \ }

function! diff_action.func(candidates)
  if len(a:candidates) == 1
    " カレントバッファとdiff
    execute 'vert diffsplit ' . a:candidates[0].action__path
  elseif len(a:candidates) == 2
    " 選択されたファイルとdiff
    execute 'tabnew ' . a:candidates[0].action__path
    execute 'vert diffsplit ' . a:candidates[1].action__path
  else
    " 3-way以上は非対応
    echo 'too many candidates!'
  endif
endfunction

call unite#custom_action('file', 'diff', diff_action)

unlet diff_action

" ---------------------------------------------------------------------------
"  RipGrep 設定
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
