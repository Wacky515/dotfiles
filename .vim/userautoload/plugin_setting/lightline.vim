scriptencoding utf-8
" Last Change: 2018/03/27 21:05:08.

" エディタウィンドウの末尾から2行目にステータスラインを常時表示
if has("unix")
    set laststatus=2
endif

" " 設定1 " {{{
"     " \ 'colorscheme': 'powerline',
" let g:lightline = {
"     \ 'colorscheme': 'jellybeans',
"     \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
"     \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
"     \ 'component': {
"     \ 'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
"     \ 'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',}
"     \ }
"
" " "Fugitive" と連携
" function! LightLineFugitive()
"   if exists("*fugitive#head")
"     let branch = fugitive#head()
"     return branch !=# '' ? '⭠ '.branch : ''
"   endif
"   return ''
" endfunction
" " }}}

" 設定2 " {{{
            " \ 'colorscheme': 'jellybeans',
            " \ 'colorscheme': 'powerline',
            " \ 'colorscheme': 'solarized',
            " \ 'colorscheme': 'landscape',
            " \ 'colorscheme': 'PaperColor',
            " \ 'colorscheme': 'seoul256',
            " \ 'colorscheme': 'Dracula',
            " \ 'colorscheme': 'one',
let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
            \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
            \ 'mode_map': {'c': 'NORMAL'},
            \ 'active': {
            \   'left': [ ['mode', 'paste'], ['fugitive', 'filename', 'cakephp', 'currenttag', 'anzu'] ]
            \ },
            \ 'component': {
            \   'lineinfo': ' %3l:%-2v',
            \ },
            \ 'component_function': {
            \   'modified': 'MyModified',
            \   'readonly': 'MyReadonly',
            \   'fugitive': 'MyFugitive',
            \   'filename': 'MyFilename',
            \   'fileformat': 'MyFileformat',
            \   'filetype': 'MyFiletype',
            \   'fileencoding': 'MyFileencoding',
            \   'mode': 'MyMode',
            \   'anzu': 'anzu#search_status',
            \   'currenttag': 'MyCurrentTag',
            \   'cakephp': 'MyCakephp',
            \ }
            \ }

function! MyModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
    return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? ' ' : ''
endfunction

function! MyFilename()
    return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
                \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
                \  &ft == 'unite' ? unite#get_status_string() :
                \  &ft == 'vimshell' ? vimshell#get_status_string() :
                \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
                \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
    try
        if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head') && strlen(fugitive#head())
            return ' ' . fugitive#head()
        endif
    catch
    endtry
    return ''
endfunction

function! MyFileformat()
    return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
    return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
    return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" function! MyCurrentTag()
"     return tagbar#currenttag('%s', '')
" endfunction

function! MyCakephp()
    return exists('*cake#buffer') ? cake#buffer('type') : ''
endfunction
" }}}
