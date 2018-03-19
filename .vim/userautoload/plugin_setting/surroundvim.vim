scriptencoding utf-8
" Last Change: 2018/03/19 10:11:50.

let g:surround_{char2nr("a")} = "**\r**"
nm <Leader>" ysiw"
nm <Leader>' ysiw'
nm <Leader>` ysiw`
nm <Leader>{ ysiw{
nm <Leader>} ysiw}
nm <Leader>[ ysiw[
nm <Leader>] ysiw]
nm <Leader>( ysiw(
nm <Leader>) ysiw)
nm <Leader>< ysiw<
nm <Leader>> ysiw>
nm <Leader>* ysiw*
nm <Leader><Leader>* ysiw*wysiw*
nm <Leader>a ysiwa

xm " S"
xm ' S'
xm ` S`
xm { S{
xm } S}
xm [ S[
xm ] S]
xm ( S(
xm ) S)
xm < S<
xm > S>
xm * S*

xm <Leader>* S*gvS*
xm <Leader>a Sa
