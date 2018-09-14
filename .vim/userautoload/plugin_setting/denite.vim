scriptencoding utf-8
" Created:     2018/03/19 00:00:00
" Last Change: 2018/09/13 22:51:41.

" ---------------------------------------------------------------------------
" 基本設定
" ---------------------------------------------------------------------------
" unite general settings
" 挿入モードで開始
" REF: let g:unite_enable_start_insert = 1
" Uniteを縦分割で開始
" REF: let g:unite_enable_split_vertically = 1
" 最近開いたファイル履歴の保存数
" REF: let g:unite_source_file_mru_limit = 1000
"file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
" REF: let g:unite_source_file_mru_filename_format = ""

" ---------------------------------------------------------------------------
" ショートカットキー
" ---------------------------------------------------------------------------
nmap [denite] <Nop>
" map <C-j> [denite]
map D [denite]

" Ub: 現在のバッファ一覧
" REF: nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
" Uf: 現在のバッファのディレクトリ一覧
" REF: nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" Ur: レジスタ一覧
" REF: nnoremap <silent> [unite]r :<C-u>Unite register<CR>
" Uc: ブックマーク一覧
" REF: nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
" Ua: ブックマークに追加
" REF: nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
" Ut: バッファを新しいタブで開く
" REF: nnoremap <silent> [unite]t :<C-u>Unite tab<CR>
" Ul: Colorscheme プレビュー
" REF: nnoremap <silent> [unite]l :<C-u>Unite -auto-preview colorscheme<CR>
" Um: 最近使用したファイル一覧
" REF: nnoremap <silent> [unite]m :Unite file_mru<CR>
" Uw: 最近使用したウィンドウ一覧
" REF: nnoremap <silent> [unite]w :<C-u>Unite window<CR>
" D<C-P>: プロジェクト内のファイル検索
" REF: nmap <silent> [denite]<C-P> :<C-u>Denite file_rec -highlight-mode-insert=Search<CR>
" D<C-B>: バッファに展開中のファイル検索
" REF: nmap <silent> [denite]<C-B> :<C-u>Denite buffer -highlight-mode-insert=Search<CR>
" D<C-O>: ファイル内の関数/クラス等の検索
" REF: nmap <silent> [denite]<C-O> :<C-u>Denite outline -highlight-mode-insert=Search<CR>
" D<C-V>: "dotfiles" 配下をカレントにして "file_rec" 起動
" REF: nmap <silent> [denite]<C-V> :<C-u>call denite#start([{'name': 'file_rec', 'args': ['~/.dotfiles']}]) -highlight-mode-insert=Search=Search<CR>

" <C-N>/<C-P>: 上下移動
call denite#custom#map('normal', '<C-N>', '<denite:move_to_next_line>')
call denite#custom#map('normal', '<C-P>', '<denite:move_to_previous_line>')
call denite#custom#map('insert', '<C-N>', '<denite:move_to_next_line>')
call denite#custom#map('insert', '<C-P>', '<denite:move_to_previous_line>')

" <C-J>/<C-K>: 入力履歴移動
call denite#custom#map('insert', '<C-J>', '<denite:assign_next_text>')
call denite#custom#map('insert', '<C-K>', '<denite:assign_previous_text>')

" <C-S>: 水平画面分割して開く
call denite#custom#map('insert', '<C-S>', '<denite:do_action:split>')
" <C-I>: 垂直画面分割して開く
call denite#custom#map('insert', '<C-I>', '<denite:do_action:vsplit>')
" <C-O>: 新規タブで開く
call denite#custom#map('insert', '<C-O>', '<denite:do_action:tabopen>')

" "file_rec" 検索時に "FuzzyMatch" を有効にし、検索対象から指定のファイルを除外
call denite#custom#source(
    \ 'file_rec', 'matchers', ['matcher_fuzzy', 'matcher_project_files', 'matcher_ignore_globs'])

" 検索対象外のファイル指定
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
    \ [ '.git/', '.ropeproject/', '__pycache__/',
    \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

" ---------------------------------------------------------------------------
" diff 設定
" ---------------------------------------------------------------------------
" TODO: 設定する

" ---------------------------------------------------------------------------
"  RipGrep 設定
" ---------------------------------------------------------------------------
" TODO: 設定する
