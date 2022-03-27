scriptencoding utf-8
" Created:     2018/09/28 10:26:44
" Last Change: 2019/11/14 10:21:30.

syntax keyword txtComment //
" syntax keyword txtConstant 定数
" syntax match txtString /文字列/
" syntax match txtIdentifier /何これ/
" syntax match txtError /エラー/

highlight link txtComment Comment
" highlight link txtConstant Constant
" highlight link txtString String
" highlight link txtIdentifier Identifier
" highlight link txtError Error

let b:current_syntax = "UWS"
