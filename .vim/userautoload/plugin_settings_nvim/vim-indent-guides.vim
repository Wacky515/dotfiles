scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2023/03/21 08:21:54.

" ------------------------------------------------------------------------------
"  基本設定
" ------------------------------------------------------------------------------
if !(has("mac") && has("nvim"))
    " 起動時 自動ON
    let g:indent_guides_enable_on_vim_startup = 1

    " インデントガイドを見やすいように変更
    let g:indent_guides_color_change_percent  = 30
    let g:indent_guides_guide_size            = 1
endif
