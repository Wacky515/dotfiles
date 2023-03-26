scriptencoding utf-8
" Created:     2016/08/08 09:04:26
" Last Change: 2023/03/07 13:17:11.

" Vim内部で使われる文字エンコーディング  " {{{
    " viminfo 内テキスト等に適用
    " バッファ
    " expression 内の文字列
    " ファイル
    " レジスタ内テキスト
    " }}}
set encoding=utf-8

" 改行コード
set fileformat=unix

" ファイル読込み時の改行コードの自動判別
    " 左側優先
set fileformats=unix,dos,mac

" ファイル書込み時の文字コード
set fileencoding=utf-8

 " ファイル読込み時の文字コードの自動判別
    " 左側優先
set fileencodings=utf-8,sjis,cp932,iso-2022-jp,euc-jp

if (has("win32") || has("win64"))
    " 英語メニュー
    if has("gui_running")
        source $VIMRUNTIME/delmenu.vim
        set langmenu=none
        source $VIMRUNTIME/menu.vim
    endif

    " 英語メッセージ
    if has("multi_lang")
        language C
    endif
endif
