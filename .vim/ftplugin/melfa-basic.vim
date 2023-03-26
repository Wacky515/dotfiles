scriptencoding utf-8
" Created:     2021/12/25 19:05:37
" Last Change: 2023/03/23 09:34:05.

" ------------------------------------------------------------------------------
"  基本設定
" ------------------------------------------------------------------------------
set encoding=utf-8
set fileformat=dos
set fileencoding=sjis

setlocal smarttab
setlocal expandtab
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

" ------------------------------------------------------------------------------
"  Syntax highlight
" ------------------------------------------------------------------------------
" set syntax=freebasic

" 変数 白

syntax match   melfaHex         "&h\x\+\%([%L&U]\|UL\|LL\|ULL\)\=\>"
syntax match   melfaOctal       "&o\o\+\%([%L&U]\|UL\|LL\|ULL\)\=\>"
syntax match   melfaBinary      "&b[10]\+\%([%L&U]\|UL\|LL\|ULL\)\=\>"
syntax match   melfaInteger     "\<\d\+\%([%L&U]\|UL\|LL\|ULL\)\=\>"
syntax match   melfaFloat       "\<\d\+\.\d*\%([de][-+]\=\d*\)\=[f!#]\="
syntax match   melfaFloat       "\.\d\+\%([de][-+]\=\d*\)\=[f!#]\="
syntax match   melfaLocalVar    "\.\d\+\%([de][-+]\=\d*\)\=[f!#]\="
syntax match   melfaExternalVar "\.\d\+\%([de][-+]\=\d*\)\=[f!#]\="

" MEMO: /b: 単語の行頭を表す正規表現 使う
syntax keyword melfaDefine      Dim
syntax keyword melfaDefine      FPrm
syntax keyword melfaDefine      Plt

syntax match   melfaVarType     "\sM*\zsM"
syntax match   melfaVarType     "\sP*\zsP"
syntax match   melfaVarType     "\sJ*\zsJ"
syntax match   melfaVarType     "\sC*\zsC"
" FIXME: P_J_ の J_ マッチしてしまう
syntax match   melfaExtVarType  "M_"
syntax match   melfaExtVarType  "P_"
syntax match   melfaExtVarType  "J_"
syntax match   melfaExtVarType  "C_"

" syntax keyword melfaOperater    <
" syntax keyword melfaOperater    >
" syntax keyword melfaOperater    =

syntax keyword melfaRobotCtrl1  Mvs
syntax keyword melfaRobotCtrl2  Mov
syntax keyword melfaRobotCtrl3  Cnt
syntax keyword melfaRobotCtrl3  HOpen
syntax keyword melfaRobotCtrl3  HClose
syntax keyword melfaRobotCtrl4  Ovrd
syntax keyword melfaRobotCtrl4  Spd

syntax keyword melfaExternalSig M_In
syntax keyword melfaExternalSig M_In16
syntax keyword melfaExternalSig M_Out
syntax keyword melfaExternalSig M_Out16

syntax keyword melfaStop        End
syntax keyword melfaStop        Hlt

syntax keyword melfaRobotCtrl   Ovrd
syntax keyword melfaRobotCtrl   Fine
syntax keyword melfaRobotCtrl   Tool
syntax keyword melfaRobotCtrl   Open
syntax keyword melfaRobotCtrl   Close
syntax keyword melfaRobotCtrl   Input
syntax keyword melfaRobotCtrl   Print
syntax keyword melfaRobotCtrl   GoTo

syntax keyword melfaJump        CallP
syntax keyword melfaJump        Return
syntax region  melfaJump        start="\s\*"ms=e+0 end="\>"

syntax keyword melfaTimer       Dly

syntax keyword melfaProgramCtrl GoSub
syntax keyword melfaProgramCtrl If
syntax keyword melfaProgramCtrl Then
syntax keyword melfaProgramCtrl Else
syntax keyword melfaProgramCtrl EndIf
syntax keyword melfaProgramCtrl For
syntax keyword melfaProgramCtrl Next
syntax keyword melfaProgramCtrl And
syntax keyword melfaProgramCtrl Or
syntax keyword melfaProgramCtrl As

syntax region  melfaComment     start="'" end="$"

highlight link melfaHex         Constant
highlight link melfaOctal       Constant
highlight link melfaBinary      Constant
highlight link melfaInteger     Constant
highlight link melfaFloat       Constant
highlight link melfaLocalVar    Constant
highlight link melfaExternalVar Constant

highlight link melfaDefine      Define

highlight link melfaVarType     StatusLine
highlight link melfaExtVarType  Sneak

" highlight link melfaOperators   icebergNormalFlg

highlight link melfaRobotCtrl1  DiffChange
highlight link melfaRobotCtrl2  DiffDelete
highlight link melfaRobotCtrl3  DiffAdd
highlight link melfaRobotCtrl4  DiffAdd

highlight link melfaExternalSig DiffAdd

highlight link melfaStop        ToDo

highlight link melfaRobotCtrl   Title

highlight link melfaJump        DiffText

highlight link melfaTimer       Define

" NOTWORK: khighlight melfaProgramCtrlH     ctermfg=203 guifg=#00ff00
" highlight link melfaProgramCtrl melfaProgramCtrlH
highlight link melfaProgramCtrl Define

highlight link melfaComment     Comment

" ------------------------------------------------------------------------------
"  ユーザー定義補完
" ------------------------------------------------------------------------------
inoremap <F6> <C-R>=MyCmpl()<CR>
func! MyCmpl()
  call complete(col('.'), [
    \ {'word': 'foo', 'abbr': '1: foo', 'menu': 'hoge', 'info': 'FOO - HOGE'},
    \ {'word': 'bar', 'abbr': '2: bar', 'menu': 'piyo', 'info': 'BAR - PIYO'},
    \ {'word': 'baz', 'abbr': '3: baz', 'menu': 'fuga', 'info': 'BAZ - FUGA'}])
  return ''
endfunc
