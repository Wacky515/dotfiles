" Last Change: 2018/03/19 13:17:56.

let g:surround_{char2nr("a")} = "**\r**"

" nmap <Leader>" ysiw"
nmap <Leader>n" ysiw"
nmap <Leader>" ysiw"i<Space><Esc>wwwa<Space><Esc>W
nmap <Leader>f" ysiw"i<Space><Esc>Wwwl
nmap <Leader>b" ysiw"wwa<Space><Esc>l

" nmap <Leader>' ysiw'
nmap <Leader>' ysiw'i<Space><Esc>wwwa<Space><Esc>W
nmap <Leader>f' ysiw'i<Space><Esc>Wwwl
nmap <Leader>b' ysiw'wwa<Space><Esc>l

" nmap <Leader>` ysiw`
nmap <Leader>` ysiw`i<Space><Esc>wwwa<Space><Esc>W
nmap <Leader>f` ysiw`i<Space><Esc>Wwwl
nmap <Leader>b` ysiw`wwa<Space><Esc>l

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
xmap { S{
xmap } S}
xmap [ S[
xmap ] S]
xmap ( S(
xmap ) S)
xmap < S<
xmap > S>
xmap * S*

xmap <Leader>* S*gvS*
xmap <Leader>a Sa
