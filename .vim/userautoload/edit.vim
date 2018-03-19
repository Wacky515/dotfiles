scriptencoding utf-8
" Last Change: 2018/03/18 15:09:10.

""" 編集篇 """

" 保存時に行末の空白を削除
autocmd BufWritePre * :%s/\s\+$//ge

" 日本語の行連結は空白を入力しない
set formatoptions=Mm

" 複数行をインデント
    " 操作時に選択を解除しないようにする
vnoremap > >gv
vnoremap < <gv

" 全角英数字を半角にする
if !has("nvim")
    nnoremap <Leader>zh :HzjaConvert han_eisu<Enter>
    vnoremap <Leader>zh :HzjaConvert han_eisu<Enter>
endif

" スペルチェック機能を使う
if !has("nvim")
    set nospell
    " 日本語を除外
    set spelllang=en,cjk
    " 間違ったスペルに下線
    hi clear SpellBad
    hi SpellBad cterm=underline
    " 間違ったキャメルケースに下線と太字
    hi clear SpellCap
    hi SpellCap cterm=underline,bold
endif

" ヤンクしたデータをクリップボードで使用＆選択範囲自動コピー
" ※ 使用できるか環境による
if !has("nvim")
    set clipboard=unnamed,autoselect
" < http://nanasi.jp/articles/howto/editing/clipboard.html >
endif

" 自動的に閉じ括弧を入力
" 1. 閉じ括弧を補完
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap ' <Space>''<Space><Left><Left>
inoremap " <Space>""<Space><Left><Left>

" 2. <Enter> 押下で閉じ括弧を補完しない
inoremap {<Enter> {
inoremap [<Enter> [
inoremap (<Enter> (
inoremap '<Enter> '
inoremap "<Enter> "

" 3. . 押下で改行して閉じ括弧を補完（関数記記述用）
inoremap (. ()<Left><CR><ESC><S-o>
inoremap [. []<Left><CR><ESC><S-o>
inoremap {. {}<Left><CR><ESC><S-o>
inoremap '. ''''''<Left><Left><Left><CR><ESC><S-o>
inoremap ". """"""<Left><Left><Left><CR><ESC><S-o>
" これで動作が良くなければ下記を試す
    " < https://github.com/Townk/vim-autoclose >

" 挿入モードで日時を挿入
" フルセット
inoremap <expr> ,df strftime('%Y-%m-%d %H:%M')
" 年月日
inoremap <expr> ,dd strftime('%Y-%m-%d')
" 時間
inoremap <expr> ,dt strftime('%H:%M')

" 挿入モードで曜日を挿入
let weeks = [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ]
let wday = strftime("%w")
" 年月日曜日
inoremap <expr> ,ds strftime('%Y-%m-%d ').weeks[wday]
" 曜日のみ
inoremap <expr> ,dy strftime('').weeks[wday]
