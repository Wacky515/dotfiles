scriptencoding utf-8

""" 編集篇 """

" 複数行のインデント操作時に選択を解除せず連続操作できるようにする
vnoremap > >gv
vnoremap < <gv

"日本語の行連結は空白を入力しない
set formatoptions=Mm
()
" ヤンクしたデータをクリップボードで使用＆選択範囲自動コピー
" ※ 使用できるかは環境による
set clipboard=unnamed,autoselect
" < http://nanasi.jp/articles/howto/editing/clipboard.html >

" 自動的に閉じ括弧を入力
" <Enter> 押下で補完する
inoremap {<Enter> {}<Left>
inoremap [<Enter> []<Left>
inoremap (<Enter> ()<Left>
inoremap '<Enter>  <Space>'' <Left><Left>
inoremap "<Enter> <Space>"" <Left><Left>
" . 押下で補完する(改行版)
inoremap {. {}<Left><CR><ESC><S-o>
inoremap {. {}<Left><CR><ESC><S-o>
inoremap [. []<Left><CR><ESC><S-o>
inoremap (. ()<Left><CR><ESC><S-o>
inoremap '.  '' <Left><Left><CR><ESC><S-o>
inoremap ".  "" <Left><Left><CR><ESC><S-o>
" これで動作が良くなければ右記を試す < https://github.com/Townk/vim-autoclose >
" !!!: 旧版あまりスマートではない・・・"{{{
" imap { {}<LEFT>
" imap [ []<LEFT>
" imap ( ()<LEFT>
" imap （ （）<LEFT>"}}}

" 全角英数字を半角にする
nnoremap <Leader>zh :HzjaConvert han_eisu
vnoremap <Leader>zh :HzjaConvert han_eisu

" 日時を挿入
inoremap <expr> ,df strftime('%Y-%m-%d %H:%M')
inoremap <expr> ,dd strftime('%Y-%m-%d')
inoremap <expr> ,dt strftime('%H:%M')

" 曜日を挿入
let weeks = [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ]
let wday = strftime("%w")
inoremap <expr> ,ds strftime('%Y-%m-%d ').weeks[wday]
