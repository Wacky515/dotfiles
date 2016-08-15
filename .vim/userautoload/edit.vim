scriptencoding utf-8

""" 編集篇 """

" 複数行のインデント操作時に選択を解除せず連続操作できるようにする
vnoremap > >gv
vnoremap < <gv

"日本語の行連結は空白を入力しない
set formatoptions=Mm

" ヤンクしたデータをクリップボードで使用＆選択範囲自動コピー
" ※ 使用できるかは環境による
set clipboard=unnamed,autoselect
" < http://nanasi.jp/articles/howto/editing/clipboard.html >

" 自動的に閉じ括弧を入力
" <Enter> 押下で補完する
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
" これで良くなければ右記を試す < https://github.com/Townk/vim-autoclose >
" !!!: 旧版あまりスマートではない・・・"{{{
" imap { {}<LEFT>
" imap [ []<LEFT>
" imap ( ()<LEFT>
" imap （ （）<LEFT>"}}}
