scriptencoding utf-8
" Last Change: 2018/04/10 12:45:05.

if has("gui_running")
    " Vim起動後自動的にON
    let g:indent_guides_enable_on_vim_startup = 1

    " インデントガイドを見やすいように変更
    let g:indent_guides_color_change_percent=30
    let g:indent_guides_guide_size=1
end
