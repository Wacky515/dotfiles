scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2018/12/27 17:07:51.

if has("gui_running")
    " Vim起動後自動的にON
    let g:indent_guides_enable_on_vim_startup = 1

    " インデントガイドを見やすいように変更
    let g:indent_guides_color_change_percent=30
    let g:indent_guides_guide_size=1
end

