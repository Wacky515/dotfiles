scriptencoding utf-8
" Created:     2023/03/07 13:39:56.
" Last Change: 09-Mar-2023.

" ------------------------------------------------------------------------------
"  Plugin
" ------------------------------------------------------------------------------
call jetpack#begin()
  " 初期動作
  Jetpack 'tani/vim-jetpack', { 'opt': 1 }
call jetpack#end()

" ------------------------------------------------------------------------------
"  基本設定
" ------------------------------------------------------------------------------
" ファイルの重複を無視
call add(g:jetpack_ignore_patterns, '/*.yaml')
call add(g:jetpack_ignore_patterns, '/*.json')
"
" :JetpackSync のコピー方法
if has("nvim")
    let g:jetpack_copy_method='copy'
endif

" "Plugin" のダウンロード方法
let g:jetpack_download_method='git'
