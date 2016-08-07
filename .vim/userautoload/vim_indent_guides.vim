scriptencoding utf-8

function! s:hooks.on_source(bundle)
    let g:indent_guides_guide_size = 1
    IndentGuidesEnable
endfunction
