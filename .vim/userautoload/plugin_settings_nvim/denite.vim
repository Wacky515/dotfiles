scriptencoding utf-8
" Created:     2018/03/19 09:19:36
" Last Change: 2019/07/01 22:34:29.

" REF: https://qiita.com/okamos/items/4e1665ecd416ef77df7c
" ---------------------------------------------------------------------------
" マップキー
" ---------------------------------------------------------------------------
nmap [denite] <Nop>
map D [denite]

" DB: 現在のバッファ一覧
nnoremap <silent> [denite]B :<C-u>Denite
            \ -direction=topleft
            \ -cursor-wrap=true
            \ buffer<CR>
" DF: 現在のバッファのディレクトリ下のファイル一覧
nnoremap <silent> [denite]F :<C-u>DeniteBufferDir
            \ -direction=topleft
            \ -cursor-wrap=true
            \ file file:new<CR>
" DR: レジスタ一覧
nnoremap <silent> [denite]R :<C-u>Denite
            \ -direction=topleft
            \ -cursor-wrap=true
            \ -buffer-name=register
            \ register<CR>
" DG: Grep
nnoremap <silent> [denite]G :<C-u>Denite -auto_preview grep<CR>
" DL: "Colorscheme" プレビュー
nnoremap <silent> [denite]L :<C-u>Denite
            \ -auto-preview
            \ colorscheme<CR>
" DM: 最近使用したファイル一覧
nnoremap <silent> [denite]M :<C-u>Denite
            \ -direction=topleft
            \ -cursor-wrap=true
            \ file_mru<CR>

" " DC: カーソルのハイライト
" nmap <silent> [denite]C :<C-u>Denite file_rec -highlight-mode-insert=Search<CR>

" NOTWORK:
" " DC: ブックマーク一覧
" nnoremap <silent> [denite]C :<C-u>Denite
"             \ -direction=topleft
"             \ -cursor-wrap=true
"             \ bookmark<CR>
" " DA: ブックマークに追加
" nnoremap <silent> [denite]A :<C-u>DeniteBookmarkAdd<CR>

" MEMO: ↓ *.toml に移管済み
" " <C-n>/<C-p>: 上下移動  " {{{
" call denite#custom#map('normal', '<C-n>', '<denite:move_to_next_line>')
" call denite#custom#map('normal', '<C-p>', '<denite:move_to_previous_line>')
" call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>')
" call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>')

" " <C-j>/<C-k>: 入力履歴移動
" call denite#custom#map('insert', '<C-j>', '<denite:assign_next_text>')
" call denite#custom#map('insert', '<C-k>', '<denite:assign_previous_text>')

" " <C-t>: "tabopen"
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
" }}}

" ---------------------------------------------------------------------------
" 基本設定
" ---------------------------------------------------------------------------
" MEMO: ↓ *.toml に移管済み
" " プロンプトを ">" にする
" call denite#custom#option('default', 'prompt', '>')

" カーソルのハイライト
hi CursorLine guifg=#E19972

" ---------------------------------------------------------------------------
" Diff設定
" ---------------------------------------------------------------------------
" TODO: 設定する

" ---------------------------------------------------------------------------
"  Grep設定
" ---------------------------------------------------------------------------
" MEMO: ↓ *.toml に移管済み
" " The Silver searcher  " {{{
" if executable('ag')
"     let s:ignore_globs = [
"                 \ '.git',
"                 \ '.svn',
"                 \ 'node_modules']
"
"     " 検索対象から以下を除外
"     call denite#custom#var(
"                 \ 'command',
"                 \ 'grep',
"                 \ 'file/rec',
"                 \ ['ag',
"                 \ '--follow',]
"                 \ + map(deepcopy(s:ignore_globs),
"                 \ { k, v -> '--ignore=' . v }) + [
"                 \ '',
"                 \ '--nocolor',
"                 \ '--nogroup',
"                 \ '-g'])
"
"     " "file_rec" 検索時に "FuzzyMatch" を有効にし
"     " 検索対象から指定のファイルを除外
"     call denite#custom#source(
"                 \ 'file/rec',
"                 \ 'matchers',
"                 \ ['matcher_fuzzy',
"                 \ 'matcher_project_files',
"                 \ 'matcher_ignore_globs'])
"
"     " 他ソース向けに "ignore_globs" 初期化
"     call denite#custom#filter(
"                 \ 'ignore_globs',
"                 \ 'matcher/ignore_globs',
"                 \ s:ignore_globs,
"                 \ ['*.make',
"                 \ '*.min.*'
"                 \ '*.o',
"                 \ '.git/',
"                 \ '.ropeproject/',
"                 \ '__pycache__/',
"                 \ 'build/',
"                 \ 'fonts/',
"                 \ 'images/',
"                 \ 'img/',
"                 \ 'venv/',
"                 \ 'ropeproject/'])
" endif
" }}}

" MEMO: ↓ *.toml に移管済み
" RipGrep  " {{{
" if executable('rg')
"     " 検索対象から以下を除外
"     call denite#custom#var(
"                \ 'command',
"                \ 'grep',
"                \ 'file_rec',
"                \ ['!.git',
"                \ '--files',
"                \ '--glob',
"                \ 'rg'])

"     let g:denite_source_grep_command = 'rg'
"     let g:denite_source_grep_default_opts = '-n --no-heading --color never'
"     let g:unite_source_grep_recursive_opt = ''
"     " Hit数制御
"     let g:unite_source_grep_max_candidates = 200
"     " "Windows" 設定
"     let g:unite_source_grep_encoding='utf-8'
" endif
" }}}

" MEMO: ↓ *.toml に移管済み
" FuzzyMatch "  {{{
    " "file_rec" 検索時に "FuzzyMatch" を有効にし
    " 検索対象から指定のファイルを除外
" if executable('matcher_fuzzy')
"     call denite#custom#source(
"                 \ 'file_rec',
"                 \ 'matchers',
"                 \ ['matcher_fuzzy',
"                 \ 'matcher_project_files',
"                 \ 'matcher_ignore_globs'])

      " 検索対象外のファイル指定
"     call denite#custom#filter(
"                 \ 'ignore_globs',
"                 \ 'matcher/ignore_globs',
"                 \ s:ignore_globs,
"                 \ ['*.make',
"                 \ '*.min.*'
"                 \ '*.o',
"                 \ '.git/',
"                 \ '.ropeproject/',
"                 \ '__pycache__/',
"                 \ 'build/', '
"                 \ 'fonts/',
"                 \ 'images/',
"                 \ 'img/',
"                 \ 'venv/',
"                 \ 'ropeproject/'])
" endif
" }}}

