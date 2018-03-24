scriptencoding utf-8
" Last Change: 2018/03/24 23:24:44.

let g:surround_{char2nr("a")} = "**\r**"

" FIXME: "}" <- の時カーソル位置がおかしい為キル
" nmap <Leader>" ysiw"
nmap <Leader>n" ysiw"
nmap <Leader>" ysiw"i<Space><Esc>f";a<Space><Esc>
nmap <Leader>f" ysiw"i<Space><Esc>
nmap <Leader>b" ysiw"f"a<Space><Esc>

" nmap <Leader>' ysiw'
nmap <Leader>n' ysiw'
nmap <Leader>' ysiw'i<Space><Esc>f';a<Space><Esc>
nmap <Leader>f' ysiw'i<Space><Esc>
nmap <Leader>b' ysiw'f'a<Space><Esc>

" nmap <Leader>` ysiw`
nmap <Leader>n` ysiw`
nmap <Leader>` ysiw`i<Space><Esc>f`;a<Space><Esc>
nmap <Leader>f` ysiw`i<Space><Esc>
nmap <Leader>b` ysiw`f`a<Space><Esc>

nmap <Leader>{ ysiw{
nmap <Leader>} ysiw}
nmap <Leader>[ ysiw[
nmap <Leader>] ysiw]
nmap <Leader>( ysiw(
nmap <Leader>) ysiw)
nmap <Leader>< ysiw<
nmap <Leader>> ysiw>
nmap <Leader>* ysiw*
" nmap <Leader><Leader>* ysiw*wysiw*
" nmap <Leader>a ysiwa
" nmap <Leader><Leader>* ysiwa
nmap 2<Leader>* ysiwa
nmap 3<Leader>* ysiw*wysiw*wysiw*

xmap " S"
xmap ' S'
xmap ` S`
" xmap { S{
" xmap } S}
xmap [ S[
xmap ] S]
xmap ( S(
xmap ) S)
xmap < S<
xmap > S>
xmap * S*

xmap <Leader>* S*gvS*
xmap <Leader>a Sa
