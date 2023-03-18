scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2023/03/18 17:11:09.

" ------------------------------------------------------------------------------
"  基本設定
" ------------------------------------------------------------------------------
if has("gui_running") || has("nvim")
    " "GVim" 起動時 自動ON
    let g:indent_guides_enable_on_vim_startup = 1

    " インデントガイドを見やすいように変更
    let g:indent_guides_color_change_percent  = 30
    let g:indent_guides_guide_size            = 1
end
