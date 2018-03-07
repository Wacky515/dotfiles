scriptencoding utf-8

if has('win32')
    " パスのセパレータを変更("\" -> "/")
    " set shellslash
    " !!!: ↓は "search.vim" がバグる
    " スペースの入ったファイル名も扱えるようにする
    " set isfname+=32
endif
