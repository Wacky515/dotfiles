scriptencoding utf-8
" Created:     2018/03/30 12:15:44
" Last Change: 2023/03/21 13:26:46.

" ------------------------------------------------------------------------------
"  マップキー
" ------------------------------------------------------------------------------
" プリフィクスキー
let g:ctrlp_map = '<nop>'
nnoremap <C-l> <Nop>

if (has("mac") && !has("gui_running"))
    nnoremap <C-l><C-l> :<C-u>FZF<CR>
else
    nnoremap <C-l><C-l> :<C-u>CtrlPMixed<CR>
endif

nnoremap <C-l>p     :<C-u>CtrlP<CR>
nnoremap <C-l>a     :<C-u>CtrlP<Space>
nnoremap <C-l>b     :<C-u>CtrlPBuffer<CR>
nnoremap <C-l>d     :<C-u>CtrlPDir<CR>
nnoremap <C-l>l     :<C-u>CtrlPLine<CR>
nnoremap <C-l>m     :<C-u>CtrlPMRUFiles<CR>
nnoremap <C-l>q     :<C-u>CtrlPQuickfix<CR>
nnoremap <C-l>t     :<C-u>CtrlPTag<CR>

" ------------------------------------------------------------------------------
"  基本設定
" ------------------------------------------------------------------------------
" Guess vcs root dir
let g:ctrlp_working_path_mode   = 'ra'

" 現在のウィンドウに新しいファイルを開く
let g:ctrlp_open_new_file       = 'r'

" マッチウィンドウの設定
let g:ctrlp_match_window        = 'top,order:ttb,min:1,max:18'

" 検索除外
let g:ctrlp_custom_ignore = {
    \ 'dir' : '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll|o)$',
    \ 'link': 'some_bad_symbolic_links',
    \ }

" キャッシュを使用して検索を高速化
let g:ctrlp_use_caching         = 1
" 終了時にキャッシュクリアしない
let g:ctrlp_clear_cache_on_exit = 0
" 検索の際に 200[ms] のディレイを入れる
    " 文字入力時の表示がピーキーなため
let g:ctrlp_lazy_update         = 200

" let g:ctrlp_extensions          = ['tag', 'quickfix', 'dir', 'line', 'mixed']

" ------------------------------------------------------------------------------
"  RipGrep 設定
" ------------------------------------------------------------------------------
if executable("rg")
    let g:ctrlp_user_command      = 'rg --files %s'
    let g:ctrlp_use_caching       = 0
    let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_switch_buffer     = 'et'
endif
