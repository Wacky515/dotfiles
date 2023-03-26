scriptencoding utf-8
" Created:     2023/03/21 11:59:52
" Last Change: 2023/03/21 14:15:29.

" ------------------------------------------------------------------------------
"  マップキー
" ------------------------------------------------------------------------------
:nnoremap <Leader>ff :FZF<CR>

" MEMO: "fzf" 準拠のCUI
" <Enter>押下でカレントディレクトリ以下を再帰的に検索
" <Leader>r: カーソル位置の単語を "RipGrep" 対象に挿入(結果表示: "UTF-8")
nnoremap <expr> <Leader>r ':<C-u>Rg ' . expand('<cword>') . ''
" ,r:        カーソル位置の単語を "RipGrep" 対象に挿入(結果表示: "Shift_JIS")
nnoremap <expr> ,r        ':<C-u>Rgs ' . expand('<cword>') . ''

" ------------------------------------------------------------------------------
"  RipGrep 設定
" ------------------------------------------------------------------------------
command! -bang -nargs=* Rg
        \ call fzf#vim#grep(
        \   'rg --hidden --column --line-number --no-heading
        \   --color=always --smart-case '.shellescape(<q-args>), 1,
        \   <bang>0 ? fzf#vim#with_preview('up:60%')
        \           : fzf#vim#with_preview('right:50%:hidden', '?'),
        \   <bang>0)

command! -bang -nargs=* Rgs
        \ call fzf#vim#grep(
        \   'rg --hidden --column --line-number --no-heading
        \   --color=always --smart-case --encoding Shift_JIS
        \   '.shellescape(<q-args>), 1,
        \   <bang>0 ? fzf#vim#with_preview('up:60%')
        \           : fzf#vim#with_preview('right:50%:hidden', '?'),
        \   <bang>0)
