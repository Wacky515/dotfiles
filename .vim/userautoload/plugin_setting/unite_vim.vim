scriptencoding utf-8

" 基本設定
" unite general settings
" 挿入モードで開始
let g:unite_enable_start_insert = 1
" 最近開いたファイル履歴の保存数
let g:unite_source_file_mru_limit = 1000

" 前置キー
" unite prefix key.
nnoremap [unite] <Nop>
nmap U [unite]
" nmap <Leader>u [unite]

" ショートカットキー
" 現在のバッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
" 現在のバッファのディレクトリ一覧
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite register<CR>
" ブックマーク一覧
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
" ブックマークに追加
nnoremap <silent> [unite]t :<C-u>Unite tab<CR>
" FIXME: 使用できない
" 最近使用したファイル一覧
" nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
nnoremap <silent> [unite]m :Unite file_mru<CR>
nnoremap <silent> [unite]w :<C-u>Unite window<CR>
"file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ''

" uniteを開いている間のキーマッピング
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
