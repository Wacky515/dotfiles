scriptencoding utf-8
" Created:     2023/03/21 14:10:22
" Last Change: 2023/03/23 19:54:16.

" ------------------------------------------------------------------------------
"  基本設定
" ------------------------------------------------------------------------------
"  Diffモード 設定
 function! SetDiffMode()
    if &diff
        " 縦分割で表示
        set diffopt=vertical
        " 片方だけに存在する行を空ける
        set diffopt=filler
        " スペルチェック OFF
        setlocal nospell
        " 長い行を折返さない
        setlocal wrap<
    endif
endfunction
autocmd VimEnter,FilterWritePre * call SetDiffMode()

" MEMO: ".vimrc" に記載
" " 追加された行の色
" highlight DiffAdd             ctermfg=カラー番号 ctermbg=カラー番号
" " 削除された行の色
" highlight DiffDelete          ctermfg=カラー番号 ctermbg=カラー番号
" " 変更された行の色
" highlight DiffChange          ctermfg=カラー番号 ctermbg=カラー番号
" 変更があった文字列の色
" highlight DiffText cterm=bold ctermfg=カラー番号 ctermbg=カラー番号

" REF: https://howpon.com/22103
