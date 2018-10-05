scriptencoding utf-8
" Last Change: 2018/10/05 09:04:44.

" エディタウィンドウの末尾から2行目にステータスラインを常時表示
if has("unix")
    set laststatus=2
endif

" TODO: "Cica" を使用しているマシンのみセパレータ有効化
" FIXME: 抽象化する
" if hostname() != "SALADCARBONX1" || "ProSalad133.local"
" if set guifont? != "Cica*"

" " 設定1 " {{{
" "     \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
" "     \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
"     " \ 'colorscheme': 'powerline',
" let g:lightline = {
"     \ 'colorscheme': 'jellybeans',
"     \ 'component': {
"     \ 'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
"     \ 'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',}
"     \ }

" " "Fugitive" と連携
" function! LightLineFugitive()
"   if exists("*fugitive#head")
"     let branch = fugitive#head()
"     return branch !=# '' ? '⭠ '.branch : ''
"   endif
"   return ''
" endfunction
" else
" " }}}

" 設定2
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
            \     'left': [
            \         ['mode', 'paste'],
            \         ['fugitive', 'filename',
            \             'cakephp','currenttag', 'anzu'],
            \         ['readonly', 'filename', 'modified', 'ale']
            \     ]
            \ },
            \ 'component': {
            \   'lineinfo': ' %3l:%-2v',
            \ },
            \ 'component_function': {
            \     'ale': 'ALEGetStatusLine',
            \     'modified': 'MyModified',
            \     'readonly': 'MyReadonly',
            \     'fugitive': 'MyFugitive',
            \     'filename': 'MyFilename',
            \     'fileformat': 'MyFileformat',
            \     'filetype': 'MyFiletype',
            \     'fileencoding': 'MyFileencoding',
            \     'mode': 'MyMode',
            \     'anzu': 'anzu#search_status',
            \     'currenttag': 'MyCurrentTag',
            \     'cakephp': 'MyCakephp',
            \     }
            \ }

function! MyModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ?
                \ '+' : &modifiable ? '' : '-'
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
        if &ft !~? 'vimfiler\|gundo'
                    \ && exists('*fugitive#head')
                    \ && strlen(fugitive#head())
            return ' ' . fugitive#head()
        endif
    catch
    endtry
    return ''
endfunction

function! MyFileformat()
     return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LightLineFilename()
    return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
                \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
                \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
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

function! s:ale_string(mode)
    if !exists('g:ale_buffer_info')
        return ''
    endif

    let l:buffer = bufnr('%')
    let [l:error_count, l:warning_count] = ale#statusline#Count(l:buffer)
    let [l:error_format, l:warning_format, l:no_errors] = g:ale_statusline_format

    if a:mode == 0 " Error
        return l:error_count ? printf(l:error_format, l:error_count) : ''
    elseif a:mode == 1 " Warning
        return l:warning_count ? printf(l:warning_format, l:warning_count) : ''
    endif

    return l:error_count == 0 && l:warning_count == 0 ? l:no_errors : ''
endfunction

augroup LightLineOnALE
    autocmd!
    autocmd User ALELint call lightline#update()
augroup END

" " 設定3 " {{{
" let g:lightline = {
"             \ 'colorscheme': 'jellybeans',
"             \ 'active': {
"             \   'left': [ [ 'mode', 'paste' ],
"             \             [ 'fugitive', 'filename' ] ]
"             \ },
"             \ 'component_function': {
"             \   'fugitive': 'LightLineFugitive',
"             \   'readonly': 'LightLineReadonly',
"             \   'modified': 'LightLineModified',
"             \   'filename': 'LightLineFilename',
"             \   'filetype': 'LightLineFiletype',
"             \   'fileformat': 'LightLineFileformat',
"             \ },
"             \ 'separator': { 'left': '', 'right': '' },
"             \ 'subseparator': { 'left': '', 'right': '' }
"             \ }
"
" function! LightLineModified()
"     if &filetype == "help"
"         return ""
"     elseif &modified
"         return "+"
"     elseif &modifiable
"         return ""
"     else
"         return ""
"     endif
" endfunction
"
" function! LightLineReadonly()
"     if &filetype == "help"
"         return ""
"     elseif &readonly
"         return ""
"     else
"         return ""
"     endif
" endfunction
"
" function! LightLineFugitive()
"     if exists("*fugitive#head")
"         let _ = fugitive#head()
"         return strlen(_) ? ''._ : ''
"     endif
"     return ''
" endfunction
"
" function! LightLineFilename()
"     return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
"                 \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
"                 \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
" endfunction
"
" function! LightLineFiletype()
"   return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
" endfunction
"
" function! LightLineFileformat()
"   return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
" endfunction
" endif
" " }}}
