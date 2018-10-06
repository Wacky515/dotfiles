scriptencoding utf-8
" Created:     2018/03/19 09:19:36
" Last Change: 2018/09/23 14:07:51.

" MEMO: "dein.toml" に移管した設定を戻したい
" ---------------------------------------------------------------------------
" マップキー
" ---------------------------------------------------------------------------
nmap [denite] <Nop>
map D [denite]

" Dm: 最近使用したファイル一覧
nnoremap <silent> [denite]m :<C-u>Denite
            \ -direction=topleft
            \ -cursor-wrap=true
            \ file_mru<CR>
" Db: 現在のバッファ一覧
nnoremap <silent> [denite]b :<C-u>Denite
            \ -direction=topleft
            \ -cursor-wrap=true
            \ buffer<CR>
" Df: 現在のバッファのディレクトリ下のファイル一覧
nnoremap <silent> [denite]f :<C-u>DeniteBufferDir
            \ -direction=topleft
            \ -cursor-wrap=true
            \ file file:new<CR>
"ブックマーク一覧
nnoremap <silent> [denite]c :<C-u>Denite
            \ -direction=topleft
            \ -cursor-wrap=true
            \ bookmark<CR>
"ブックマークに追加
nnoremap <silent> [denite]a :<C-u>DeniteBookmarkAdd<CR>
" Dr: レジスタ一覧
nnoremap <silent> [denite]r :<C-u>Denite
            \ -direction=topleft
            \ -cursor-wrap=true
            \ -buffer-name=register
            \ register<CR>
" Dl: Colorscheme プレビュー
nnoremap <silent> [denite]l :<C-u>Denite
            \ -auto-preview
            \ colorscheme<CR>

" MEMO: "dein.toml" に移管
" CHECK: 戻した
" MEMO: ダメ
" " <C-n>/<C-p>: 上下移動  " {{{
" call denite#custom#map('normal', '<C-n>', '<denite:move_to_next_line>')
" call denite#custom#map('normal', '<C-p>', '<denite:move_to_previous_line>')
" call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>')
" call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>')

" " <C-j>/<C-k>: 入力履歴移動
" call denite#custom#map('insert', '<C-j>', '<denite:assign_next_text>')
" call denite#custom#map('insert', '<C-k>', '<denite:assign_previous_text>')

" call denite#custom#map('insert', "<C-t>", '<denite:do_action:tabopen>')
" " <C-v>: "vsplit"
" call denite#custom#map('insert', "<C-v>", '<denite:do_action:vsplit>')
" call denite#custom#map('normal', "v", '<denite:do_action:vsplit>')

" " jj :ノーマルモード
" call denite#custom#map('insert', 'jj', '<denite:enter_mode:normal>')
" " <C-s>: 水平画面分割して開く
" call denite#custom#map('insert', '<C-s>', '<denite:do_action:split>')
" " <C-i>: 垂直画面分割して開く
" call denite#custom#map('insert', '<C-i>', '<denite:do_action:vsplit>')
" " <C-o>: 新規タブで開く
" call denite#custom#map('insert', '<C-o>', '<denite:do_action:tabopen>')

" " "file_rec" 検索時に "FuzzyMatch" を有効にし、検索対象から指定のファイルを除外
" call denite#custom#source(
"             \ 'file_rec', 'matchers',
"             \ ['matcher_fuzzy', 'matcher_project_files', 'matcher_ignore_globs'])

" " 検索対象外のファイル指定
" call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
"             \ [ '.git/', 'build/', '.ropeproject/', '__pycache__/',
"             \ 'venv/', 'images/', 'img/', 'fonts/', 'img/', 'fonts/',
"             \ 'images/', '*.o', '*.make', '*.min.*'])
" " }}}

" ---------------------------------------------------------------------------
" 基本設定
" ---------------------------------------------------------------------------
" カーソルラインの設定
hi CursorLine guifg=#E19972

" MEMO: "dein.toml" に移管
" CHECK: 戻した
" MEMO: ダメ
" " プロンプトを ">" にする  " {{{
" call denite#custom#option('default', 'prompt', '>')

" " 起動位置をTopに変更
" call denite#custom#option('default', 'direction', 'top')
" " }}}

" ---------------------------------------------------------------------------
" diff 設定
" ---------------------------------------------------------------------------
" TODO: 設定する

" ---------------------------------------------------------------------------
"  RipGrep 設定
" ---------------------------------------------------------------------------
" TODO: 設定する
" MEMO: "dein.toml" に移管
" CHECK: 戻した
" MEMO: ダメ
" if executable('rg')
"   call denite#custom#var('file_rec', 'command',
"         \ ['rg', '--files', '--glob', '!.git'])
"   call denite#custom#var('grep', 'command', ['rg'])
" endif
