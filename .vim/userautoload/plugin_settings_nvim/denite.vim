scriptencoding utf-8
" Created:     2018/03/19 09:19:36
" Last Change: 2019/10/24 17:08:35.

" REF: https://qiita.com/okamos/items/4e1665ecd416ef77df7c
" ---------------------------------------------------------------------------
" マップキー
" ---------------------------------------------------------------------------
nmap [denite] <Nop>
map D [denite]

" MEMO:
" Ver.3 から "-cursor-wrap=true"、"-auto_preview" は廃止

" DB: 現在のバッファ一覧
nnoremap <silent> [denite]B :<C-u>Denite
            \ -direction=topleft
            \ buffer<CR>
            " \ -cursor-wrap=true
" DF: 現在のバッファのディレクトリ下のファイル一覧
nnoremap <silent> [denite]F :<C-u>DeniteBufferDir
            \ -direction=topleft
            \ file file:new<CR>
            " \ -cursor-wrap=true
" DR: レジスタ一覧
nnoremap <silent> [denite]R :<C-u>Denite
            \ -direction=topleft
            \ -buffer-name=register
            \ register<CR>
            " \ -cursor-wrap=true
" DG: Grep
nnoremap <silent> [denite]G :<C-u>Denite
            \ grep<CR>
            " \ -auto_preview
" DL: "Colorscheme" プレビュー
nnoremap <silent> [denite]L :<C-u>Denite
            \ colorscheme<CR>
            " \ -auto-preview
" DM: 最近使用したファイル一覧
nnoremap <silent> [denite]M :<C-u>Denite
            \ -direction=topleft
            \ file_mru<CR>
            " \ -cursor-wrap=true

" NOTWORK:
" " DH: カーソルのハイライト
" nmap <silent> [denite]H :<C-u>Denite
"            \ file_rec
"            \ -highlight-mode-insert=Search<CR>
" " DC: ブックマーク一覧
" nnoremap <silent> [denite]C :<C-u>Denite
"             \ -direction=topleft
"             \ bookmark<CR>
"             " \ -cursor-wrap=true
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
" カーソル ハイライト
hi CursorLine guifg=#E19972

" Ver.3.* 以降 新機能用設定
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
                \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> d
                \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
                \ denite#do_map('do_action', 'preview')
    " "Denite" を閉じる
    nnoremap <silent><buffer><expr> q
                \ denite#do_map('quit')
    " Filtering ウィンドウを開く
    nnoremap <silent><buffer><expr> i
                \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space>
                \ denite#do_map('toggle_select').'j'
endfunction

autocmd FileType denite-filter call s:denite_filter_my_setting()
function! s:denite_filter_my_setting() abort
    " 一つ上のディレクトリを開き直す
    inoremap <silent><buffer><expr> <BS>  denite#do_map('move_up_path')
    " "Denite" を閉じる
    inoremap <silent><buffer><expr> <C-c> denite#do_map('quit')
    nnoremap <silent><buffer><expr> <C-c> denite#do_map('quit')
endfunction

" MEMO: ↓ *.toml に移管済み
" プロンプト ">" にする
" call denite#custom#option('default', 'prompt', '>')

" ---------------------------------------------------------------------------
" Diff設定
" ---------------------------------------------------------------------------
" TODO: 設定する

" ---------------------------------------------------------------------------
" Grep設定
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
