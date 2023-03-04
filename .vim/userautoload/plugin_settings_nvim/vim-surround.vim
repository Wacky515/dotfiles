scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2021/03/10 14:35:38.

" ------------------------------------------------------------------------------
"  マップキー
" ------------------------------------------------------------------------------
" MEMO: [★,☆]=[",',`]

" <Leader>★:  "★" で "word" を前後にスペースありで囲む
nmap <Leader>"  ysiw"i<Space><Esc>f";a<Space><Esc>
nmap <Leader>'  ysiw'i<Space><Esc>f';a<Space><Esc>
nmap <Leader>`  ysiw`i<Space><Esc>f`;a<Space><Esc>

" <Leader>n★: "★" で "word" を前後にスペースなしで囲む
nmap <Leader>n" ysiw"
nmap <Leader>n' ysiw'
nmap <Leader>n` ysiw`

" <Leader>f★: "★" で "word" を前側にスペースありで囲む
nmap <Leader>f" ysiw"i<Space><Esc>
nmap <Leader>f' ysiw'i<Space><Esc>
nmap <Leader>f` ysiw`i<Space><Esc>

" <Leader>b★: "★" で "word" を後側にスペースありで囲む
nmap <Leader>b" ysiw"f"a<Space><Esc>
nmap <Leader>b' ysiw'f'a<Space><Esc>
nmap <Leader>b` ysiw`f`a<Space><Esc>

" ds★:        囲い文字 "★" を削除
" cs★☆:      囲い文字 "★" を "☆" に変更
" [c|d]i★:    "★" の中身を削除

" <Leader>はじめカッコ: "word" を前後にスペースありで囲む
nmap <Leader>( ysiw(
nmap <Leader>[ ysiw[
nmap <Leader>{ ysiw{

" <Leader>おわりカッコ: "word" を前後にスペースなしで囲む
nmap <Leader>) ysiw)
nmap <Leader>] ysiw]
nmap <Leader>} ysiw}

" KILL: 不等号は設定不可の模様
" nmap <Leader>< ysiw<
" nmap <Leader>> ysiw>

" [1-3]<Leader>*: "[1-3]*" で "word" を前後にスペースなしで囲む
nmap <Leader>* ysiw*
nmap <Leader><Leader>* ysiwa
nmap <Leader><Leader><Leader>* ysiw*wysiw*wysiw*

" MEMO: ★=[",',`,),],*]
" ビジュアルモードで "word" を選択し ★: "★" で選択範囲を前後にスペースなしで囲む
xmap " S"
xmap ' S'
xmap ` S`
xmap ) S)
xmap ] S]
xmap * S*

" MEMO: ★=[(,[]
" ビジュアルモードで "word" を選択し ★: "★" で選択範囲を前後にスペースありで囲む
xmap ( S(
xmap [ S[

" KILL: ビジュアルモードで段落移動できない
" xmap { S{
" xmap } S}

" KILL: ビジュアルモードでインデント調整できない
" xmap < S<
" xmap > S>

" ------------------------------------------------------------------------------
"  基本設定
" ------------------------------------------------------------------------------
" MEMO: g:surruound_{char2nr("<char>")}
"       "<char>" を記号の一つの様に使え、囲む物を定義できる
let g:surround_{char2nr("a")} = "**\r**"
