scriptencoding utf-8
" Last Change: 2018/03/17 16:55:10.

highlight Pmenu ctermbg=4
highlight PmenuSel ctermbg=1
highlight PMenuSbar ctermbg=4

" "AutoComplPop" を無効化
" let g:acp_enableAtStartup = 0

" 起動時に有効化
let g:neocomplcache_enable_at_startup = 1

" 最初の補完候補を選択状態にする
let g:neocomplcache_enable_auto_select = 1

" 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case = 1

" "_" 区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1

" シンタックスをキャッシュするときの最小文字長
let g:neocomplcache_min_syntax_length = 3

" ポップアップメニューで表示される候補の数
let g:neocomplcache_max_list = 20

" 補完ウィンドウの設定
set completeopt=menuone

" "rsense" での自動補完機能を有効化
let g:rsenseUseOmniFunc = 1

" "auto-ctags" を使ってファイル保存時に "tags" ファイルを更新
let g:auto_ctags = 1

" 辞書の定義
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" <Ctrl>g: 前回行われた補完をキャンセルし補完した文字を消す
inoremap <expr><C-g>     neocomplcache#undo_completion()
" <Ctrl>l: 補完候補の中から共通する部分を補完
inoremap <expr><C-l>     neocomplcache#complete_common_string()
" <Tab>: 補完候補の選択
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" <CR>: ポップアップを閉じてインデントを保存
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction

" <Ctrl>h, <BS>: ポップアップを閉じて後ろの文字を削除
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" " 補完の設定 " {{{
" autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"     if !exists('g:neocomplete#force_omni_input_patterns')
"         let g:neocomplete#force_omni_input_patterns = {}
"     endif
"
" let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'
"
" if !exists('g:neocomplete#keyword_patterns')
"     let g:neocomplete#keyword_patterns = {}
" endif
"
" let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" }}}
