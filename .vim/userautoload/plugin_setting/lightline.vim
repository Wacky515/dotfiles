scriptencoding utf-8
" Last Change: 2018/03/17 22:23:32.

" エディタウィンドウの末尾から2行目にステータスラインを常時表示
if has("unix")
    set laststatus=2
endif

let g:lightline = {
    \ 'colorscheme': 'jellybeans',
    \ 'component': {
    \ 'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
    \ 'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',}
    \ }

" "Fugitive" と連携
" TODO: "Fugitive" は古いので乗換え検討
function! LightLineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? '⭠ '.branch : ''
  endif
  return ''
endfunction
