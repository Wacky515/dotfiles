scriptencoding utf-8
" Created:     2018/03/30 12:15:44
" Last Change: 2019/11/29 17:16:01.

" --------------------------------------------------------------------------------
" マップキー
" --------------------------------------------------------------------------------
" プリフィクスキー
let g:ctrlp_map = '<nop>'
nnoremap <C-i> <Nop>

nnoremap <C-i>p :<C-u>CtrlP<CR>
nnoremap <C-i>a :<C-u>CtrlP<Space>
nnoremap <C-i>b :<C-u>CtrlPBuffer<CR>
nnoremap <C-i>d :<C-u>CtrlPDir<CR>
nnoremap <C-i>l :<C-u>CtrlPLine<CR>
nnoremap <C-i>m :<C-u>CtrlPMRUFiles<CR>
nnoremap <C-i>q :<C-u>CtrlPQuickfix<CR>
nnoremap <C-i>s :<C-u>CtrlPMixed<CR>
nnoremap <C-i>t :<C-u>CtrlPTag<CR>

" --------------------------------------------------------------------------------
" 基本設定
" --------------------------------------------------------------------------------
" キャッシュを使用して検索を高速化
let g:ctrlp_use_caching         = 1
" 終了時にキャッシュクリアしない
let g:ctrlp_clear_cache_on_exit = 0
" 検索の際に 200[ms] のディレイを入れる
    " 文字入力時の表示がピーキーなため
let g:ctrlp_lazy_update         = 200
" Guess vcs root dir
let g:ctrlp_working_path_mode   = 'ra'
" Open new file in current window
let g:ctrlp_open_new_file       = 'r'
let g:ctrlp_extensions          = ['tag', 'quickfix', 'dir', 'line', 'mixed']
let g:ctrlp_match_window        = 'top,order:ttb,min:1,max:18'

" 検索除外
let g:ctrlp_custom_ignore = {
    \ 'dir' : '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll|o)$',
    \ 'link': 'some_bad_symbolic_links',
    \ }

" ---------------------------------------------------------------------------
"  RipGrep 設定
" ---------------------------------------------------------------------------
if executable("rg")
  let g:ctrlp_user_command      = 'rg --files %s'
  let g:ctrlp_use_caching       = 0
  let g:ctrlp_working_path_mode = 'ra'
  let g:ctrlp_switch_buffer     = 'et'
  " let g:ctrlp_user_command = 'rg --files --color=never --glob %s ""'
  " let g:ctrlp_use_caching = 0
endif
