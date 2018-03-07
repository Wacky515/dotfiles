scriptencoding utf-8

if has("unix")
    " エディタウィンドウの末尾から2行目にステータスラインを常時表示
    set laststatus=2
endif

let g:lightline = {
    \ 'colorscheme': 'jellybeans',
    \ 'component': {
    \ 'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
    \ 'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',}
    \ }

" "fugitive（Gitラッパー）" との連携
" TODO: "fugitive" は古いので乗換え検討
function! LightLineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? '⭠ '.branch : ''
  endif
  return ''
endfunction
