scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2023/03/18 15:25:15.

" ------------------------------------------------------------------------------
"  基本設定
" ------------------------------------------------------------------------------
if has("unix")
    set laststatus=2
endif

let g:lightline = {
            \ 'colorscheme':      'wombat',
            \ 'separator':       {'left': "\ue0cc", 'right': "\ue0b2"},
            \ 'subseparator':    {'left': "\ue0cd", 'right': "\ue0b3"},
            \ 'mode_map':        {'c':    'NORMAL'},
            \ 'active': {
            \     'left': [
            \                    ['mode',     'paste'],
            \                    ['fugitive', 'filename'],
            \                    ['modified', 'ale']]},
            \ 'component':       {'lineinfo': ' %3l:%-2v',},
            \ 'component_function': {
            \     'mode':         'MyMode',
            \     'fugitive':     'MyFugitive',
            \     'filename':     'MyFilename',
            \     'modified':     'MyModified',
            \     'ale':          'MyAle',
            \     'fileencoding': 'MyFileencoding',
            \     'fileformat':   'MyFileformat',
            \     'filetype':     'MyFiletype',
            \     'readonly':     'MyReadonly',}
            \ }

function! MyMode()
    return winwidth(0) > 60 ? lightline#mode() : ''
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

function! MyFilename()
    return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
                \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
                \  &ft == 'unite' ? unite#get_status_string() :
                \  &ft == 'vimshell' ? vimshell#get_status_string() :
                \   '' != expand('%:t') ? expand('%:t') : '[No Name]') .
                \  ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyModified()
    return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ?
                \ '+' : &modifiable ? '' : '-'
endfunction

if dein#tap('ale') && !(has("unix") && !has("gui_running"))
    function! MyAle()
        let l:count           = ale#statusline#Count(bufnr(''))
        let l:errors          = l:count.error + l:count.style_error
        let l:warnings        = l:count.warning + l:count.style_warning
        return l:count.total == 0 ? '' : ':' . l:errors . ' :' . l:warnings
    endfunction
else
    function! MyAle()
        return ''
    endfunction
endif

augroup LightLineOnALE
    autocmd!
    autocmd User ALELint call lightline#update()
augroup END

function! MyFileencoding()
    return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyReadonly()
    return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? ' ' : ''
endfunction

function! LightLineFilename()
    return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
                \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
                \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction
