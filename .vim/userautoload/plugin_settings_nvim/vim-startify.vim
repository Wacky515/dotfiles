scriptencoding utf-8
" Created:     2018/12/13 07:39:11
" Last Change: 2019/01/17 14:36:42.

" ---------------------------------------------------------------------------
"  マップキー
" ---------------------------------------------------------------------------
" ,st: ロゴ画面
nnoremap ,st :Startify<CR>

" ---------------------------------------------------------------------------
"  基本設定
" ---------------------------------------------------------------------------
let g:startify_files_number = 10
let g:startify_fortune_use_unicode = 1

if exists("g:nyaovim_version")
    autocmd VimEnter * execute "normal :tabnew\<CR>"
    autocmd VimEnter * execute "normal :Startify\<CR>"
endif

" " 最近使ったファイルの接頭アルファベットを指定
" let g:startify_custom_indices = ['f', 'g', 'h', 'r', 'i', 'o', 'b']

" 接頭記号を指定
let g:startify_list_order = [
            \ ['♻  最近使ったファイル:'],
            \ 'files',
            \ ['♲  最近使ったファイル(カレントディレクトリ配下):'],
            \ 'dir',
            \ ['⚑  セッション:'],
            \ 'sessions',
            \ ['☺  ブックマーク:'],
            \ 'bookmarks'
            \ ]

" ブックマーク
let g:startify_bookmarks = [
            \ "~/.vimrc",
            \ "~/.gvimrc",
            \ "~/dotfiles/nvim/init.vim",
            \ "~/dotfiles/nvim/ginit.vim",
            \ "~/dotfiles/nyaovimrc.html",
            \ "~/dotfiles/.vim/vim_plugins/dein.toml",
            \ "~/dotfiles/.vim/vim_plugins/dein_lazy.toml",
            \ "~/dotfiles/.vim/vim_plugins_nvim/dein_nvim.toml",
            \ "~/dotfiles/.vim/vim_plugins_nvim/dein_lazy_nvim.toml",
            \ "~/dotfiles/.vim/userautoload/plugin_settings_nvim/vim-startify.vim",
            \ "R:/E2M0/E2M-4/【秘】-E2M4-1/10.個人ファイル/Wakita/Docments/機械要素購入.md",
            \ "R:/E2M0/E2M-4/【秘】-E2M4-1/10.個人ファイル/Wakita/Docments/出張各種申請 Memo.md"
            \ ]

" アスキーアート 中央揃え
    " :h startifyを参照
function! s:filter_header(lines) abort
    let longest_line   = max(map(copy(a:lines), 'len(v:val)'))
    let centered_lines = map(copy(a:lines),
                \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
    return centered_lines
endfunction

" ヘッダ部分に表示する文字列を設定
    " "date" コマンドを実行し日付を設定  " {{{
    " MEMO: "Windows" は "date" がエラーになる
" if (has("win32") || has("win64"))
"     let g:startify_custom_header = 'startify#fortune#cowsay()'
" else
"     let g:startify_custom_header =
"                 \ map(split(system('date'), '\n'), '"   ". v:val') + ['','']
" endif
"}}}

let g:startify_custom_header = s:filter_header([
            \ '      ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁    ░▓▓▒         ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁',
            \ '     ▕                        ▁  ░░▓▓▒▒▒     ▁▔                        ▔▏',
            \ '    ▕ ▗▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚  ░░░▓▓▓▓▓▒▒▒  ▕ ▗▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▖▒▒',
            \ '    ▕ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒ ▓▓▓▓▓▓▓▓▓▒▒ ▕ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒',
            \ '    ▕ ▝▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚ ▒▓▓▓▓▓▓▓▓▓▓▓▒▒▒ ▝▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▀▘▒',
            \ '     ▕     ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒    ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▏',
            \ '      ▔▔▔▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒  ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒',
            \ '         ▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓    ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒',
            \ '         ▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓    ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒',
            \ '         ▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓   ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒',
            \ '         ▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓    ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒',
            \ '         ▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓▓▓▓    ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒',
            \ '         ▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓▓    ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▒▒',
            \ '         ▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓   ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▒▓▓▒▒▒',
            \ '        ░▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓   ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▒▒▒',
            \ '       ░░▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓    ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓▓▓▓▒▒▒',
            \ '     ░░░▓▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓    ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒',
            \ '   ░░░▓▓▓▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒    ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒',
            \ ' ░░░▓▓▓▓▓▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒  ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒▒▒',
            \ '▒▒▒▓▓▓▓▓▓▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒',
            \ ' ▒▒▒▓▓▓▓▓▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓████',
            \ '   ▒▒▒▓▓▓▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███',
            \ '     ▒▒▓▓▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▖▖▖▖▖▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███',
            \ '      ▒▒▒▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▚▚▚▚▚▘▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███',
            \ '       ▒▒▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒ ▚▚▚▚▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███',
            \ '        ▒▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓███',
            \ '         ▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▚▚▚▚▚▚▚▚▓▓▓▚▚▚▚▚▚▖▓▓▗▚▚▚▚▚▖██ ▗▚▚▚▚▚',
            \ '         ▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▓▓▓▚▚▚▚▘▓▓▓▓▓▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚',
            \ '         ▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▓▓▓▓▚▚▚▚▚▎▓▓▓▓▓▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚▚',
            \ '         ▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▒▓▓▓▓▚▚▚▚▚▎▓▓▓▓▓▚▚▚▚▓▓▓▓▞▚▚▚▚▚      ▚▚▚▚▚',
            \ '         ▏ ▚▚▚▚▚▚▚▚▚▚▚▚▚▒▒▓▓▓▓▓▚▚▚▚▚▘▓▓▓▓▓▚▚▚▚▚▓▓██▞▚▚▚▚▚     ▚▚▚▚▚',
            \ '         ▏ ▚▚▚▚▚▚▚▚▚▚▚▒▒▒▒▓▓▓▓▓▚▚▚▚▚▘▓▓▓▓▚▚▚▚▚▓███  ▚▚▚▚      ▚▚▚▚▚',
            \ '         ▏ ▚▚▚▚▚▚▚▚▚▒▒▒▒▒▒▒▓▓▓▚▚▚▚▞▞▓▓▓▓▓▚▚▚▚▓██   ▚▚▚▚▚     ▚▚▚▚▚',
            \ '         ▏ ▚▚▚▚▚▚▒▒▒▒    ▒▒▒▒▚▚▚▚▚▚▓▓▓▓▓▚▚▚▚▚██    ▚▚▚▚     ▚▚▚▚▚▚',
            \ '         ▔▁▀▒▒▒▒▒▒         ▒▒▚▚▚▚▚▚▚▚▓▓▓▚▚▚▚▚▚    ▚▚▚▚▚▚    ▚▚▚▚▚▚▚',
            \ '           ▔                  ▒▒▓▓▓▓▓▓▓▓███',
            \ '                               ▒▒▒▓▓▓▓███',
            \ '                                 ▒▒▒▓██▓',
            \ '                                   ▒█▓',
            \ ])


            " \ '                                   ....--((((.....',
            " \ '                             ``...(gNNNMMMMNNNNkrzuuw+..',
            " \ '                        ````...<?<?JYYYTUUUVWHWUUWWXmXuuzw+.',
            " \ '                   ..-. .-?! ````.._~~;<+?==OOwrzzuuuuU9XAwttz.',
            " \ '                ._:~(J7!`````..(<??!~__.. ..__??7CwzXzzzrrZUAz=?<.',
            " \ '              .+<+JC<_~....?!_ .J&QQQQHH{.XHQQmma+-.-?7OOOtl=zTs+;:-',
            " \ '            .lluv3;<_:(J!- JQQH@H@H@HH@H: XH@HH@H@HHHm&..?1zz?<;?O-~~_',
            " \ '          .wvwXIl=?+J^  .OHH@H@@H@@H@@@H: X@@@@@@H@@HH@MH>  ?1+<:~(1-..`',
            " \ '       `.JQRXSrrtzv! +Z ( ?H@@H@@@@@H@@H: X@@H@H@@H@@@H@MI wo .1-~..(l(,`',
            " \ '      `.XdMMXRwwv! dWMI dn ?WM@H@@H@@@@K: X@@@@@H@@H@H@HMI zMHm .1-..!MMp ',
            " \ '      (wMMMWW0Z! jWH@NC dMm (XM@@@@@@@@K: X@@@@@@@@@@@@H@R jHHHHn (i <,WMN `',
            " \ '     (wMM#XSXC`(dH@H@#{ d@@k+ OH@@@@@@@K: X@@@@@@@@@@@H@@R (W@HHMH& <.(,TMN,-',
            " \ '    -uMM@d0O> +WHH@@HH: X@@MHo ?H@@@@@@K: X@@@@@@@@@@@@@@K: d@@@HHHs ?,(+dMN/_',
            " \ '   .1MM@d01= jHH@@H@@K (W@@@@Hs ?WH@@g@K: Xg@g@@@@@@@@@@@H{ X@@H@@HNn ?/(ldMN--',
            " \ '   ;<uVT31C dHH@H@@H@R (W@@@@@Hk (XHgggR: Xgggggg@g@@@@@@H> d@H@H@@HMn (-?CC2<<.',
            " \ ' `-~($::;v`(WH@@H@@@MS (W@@@@@gHk+ OHggR: Xgggggggg@g@@@@Nl d@@@H@H@HNo 1<>>Jz?<',
            " \ '  ~~(~~~(: dH@@H@@H@M$ jH@@ggggggko ?WmR: dgggggggggggg@@NI dH@@@H@H@HH; I?=zkzz_',
            " \ '  ._r.._v jH@H@H@@@@MI zH@ggggggggHo ?WR: dmmmmggggggggg@HI dH@@@H@@H@MI jzttdtOl',
            " \ ' `..!...} dH@@H@@H@@MI dHg@gggggmgmHn _O: dmmmmmmmggggg@gHI JH@@H@@H@H@R (OrrZRrO',
            " \ ' ``, ``,~,XHH@@H@@@@NI dH@gg@ggmmmmmmR< ! dqqmmmmmgggggg@HI jH@@@@@H@HHN{ Zzzv#zv~',
            " \ ' ``(```( (W@H@H@@@@@NI dHggggggmmgmmqqk+. dqqmmmmmmggggggHI jH@@H@@@H@HNl XuuzHzu:',
            " \ ' ``(```( (WH@@H@@H@@NI dH@gggggmmmmmmm9>  ?UHqmmmmgggggggHI jH@@@H@H@@HNl VzuuKuu:',
            " \ ' ``(```(_(WH@H@@H@@@NI dH@gggggggmmmHU! - -_ZHmmmmmgggg@gHI jH@@@@@H@H@#{ kzwzKzv!',
            " \ ' ..,-...} X@H@H@@H@@MI dH@g@gggmmmmH$! w: w- zHmgggggggg@HI JH@H@@H@H@HK: OrrwSrZ',
            " \ '  ..t~~_I zH@H@H@@@@MI zH@ggggggggHC (dR: dk+ ?Wgggggggg@HI dH@@H@@H@HM$ J1zOdll>',
            " \ '  ~~j_~~(-(WH@H@H@H@M$ jH@@@g@ggg8> +XgR: XmHo ?UHgggg@@@NI dH@@@HH@H@H: C?+10=1!',
            " \ '  __(2::_I jHH@H@H@@MS jW@@@g@@H9: dWggR: XggHk (XHH@@g@@Nl d@@H@@HH@MC J<:<j>;<',
            " \ '   ;+JO&J+l wMH@@H@@@R (W@@@@gH6!.dHgggR: Xggggk+ OH@g@@@H> d@@H@@@HM0 ,<(+z3(~`',
            " \ '   (+MMNdcJ> vHHH@HH@K (W@@@@HC (XH@@g@K: X@ggg@Ho jH@@@@H{ d@@HHH@MD! !.{jM#~`',
            " \ '    ?vMMRdyvo OHH@@@HH: X@@M8> +W@@g@@@K: X@@@@@@Hs ?WM@@K: d@H@H@M$` `,<{m#!',
            " \ '     <vMMNdyOn ?HMHH@H> X@M9! dH@@@@@@@K: X@@@@@@@Nk (4M@R (W@@HMB= (!.^(MM!',
            " \ '      (OMMNZWwX, vMH@Nl dM6! dH@@@@@@@@K: X@@@@@@@@Mk+ vHS (WHHMY! < ,<dM#`',
            " \ '       (rMMMXSuwn (TMMI d3 (X@@@@@@@@@@H: X@@@@@@H@@HHo ?$ dHM9! J<_(/MMF',
            " \ '        .uVBWyuzuzo _70 ! jWH@H@HH@H@@@H: X@H@H@H@@H@@Ns ~ dY! J>::_(3d^.',
            " \ '          ?XuZHyuzrOO .  ?7TTUUWHHHMMMMH{ XMMMMHHHWB9YYT7r _ jOz1+jJ>~~`',
            " \ '            ?XzXSyrtlzvz . _((..........- .-.........-_` .JXwrttuZC><~',
            " \ '              ?OOOUGOz?>;<1i.._?7TUWWHHW{ XHHH99Y7<!- JwzwuuzwyUOlv!',
            " \ '                _1l=zTG+;:~~~_??<(......` .-....-+OOOOvwzuXkWUzrv!',
            " \ '                   ?<<;;?C+._..```` ...____~((<>??=ltOwXUUuuuZ^',
            " \ '                       ~~~_._?<<(.,1(..-JJJJJ+JG+xZUUOrwzZ7!',
            " \ '                              ````(WMMMMMMMMMMM$<+?1v<!`',
            " \ '                                 `        ``````',

