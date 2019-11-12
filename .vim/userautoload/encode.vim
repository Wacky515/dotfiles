scriptencoding utf-8
" Created:     2016/08/08 09:04:26
" Last Change: 2019/10/28 14:30:18.

" if !(has("win32") || has("win64"))
    set encoding=utf-8
" endif

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

 " 読込み時の文字コードの自動判別
    " 左側優先
" set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileencodings=utf-8,sjis,cp932,iso-2022-jp,euc-jp

" 改行コードの自動判別
    " 左側優先
set fileformats=unix,dos,mac

" REF: 保存時の文字コード
" set fileencoding=utf-8
