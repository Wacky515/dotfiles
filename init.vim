scriptencoding utf-8
" Last Change: 2018/03/19 15:18:14.

" !!!: 必ず先頭に記述
" "autocmd"（マクロ） の初期化
augroup MyAutoCmd
    autocmd!
augroup END

"Python3のパス設定
let g:python3_host_prog = "C:\Python35\python.exe"

" "Vim" 毎のrcファイルパス設定
if has("nvim")
    " let g:rc_dir = expand("~/.vim")
    let g:rc_dir = expand("C:\Users\mm12167\dotfiles")
    " let g:rc_dir = expand("C:/Users/mm12167/AppData/Local/nvim")
" else " {{{
"     let g:vim_home = expand("~/.vim")
"     let g:rc_dir = expand("~/.vim/rc")
      " }}}
endif

" rcファイル読込み関数
if has("nvim")
    function! s:source_rc(rc_file_name)
        let rc_file = expand(g:rc_dir . "/" . a:rc_file_name)
        if filereadable(rc_file)
            execute "source" rc_file
        endif
    endfunction

    " 基本設定
    " call s:source_rc(*".vim")
    call s:source_rc(".vimrc")
endif


" " --------------------------------------------------------------------------------
" " dein.vimの設定
" " --------------------------------------------------------------------------------
" if !&compatible " {{{
"     set nocompatible
" endif
"
" " Vim起動完了時にインストール
" augroup PluginInstall
"     autocmd!
"     autocmd VimEnter * if dein#check_install() | call dein#install() | endif
" augroup END
"
" " プラグインをインストールするディレクトリ
" " >>> HERE:
" " let s:plugin_dir = expand("~/.cache/dein/")
" let s:plugin_dir = expand("C:/Users/MM12167/AppData/Local/nvim/.cache/dein/")
" " <<<
" " "dein.vim" をインストールするディレクトリをランタイムパスへ追加
" let s:dein_dir = s:plugin_dir . "repos/github.com/Shougo/dein.vim"
" execute "set runtimepath+=" . s:dein_dir
"
" " dein.vimが入っていなければ "git clone"
" if !isdirectory(s:dein_dir)
"     call mkdir(s:dein_dir, "p")
"     silent execute printf("!git clone %s %s", "https://github.com/Shougo/dein.vim", s:dein_dir)
" endif
" " < http://yuheikagaya.hatenablog.jp/entry/2016/03/20/171907 >
"
" " 設定開始
" if dein#load_state(s:plugin_dir)
"     call dein#begin(s:plugin_dir)
"
"     " プラグインリスト "*.toml" を指定
"     " >>> HERE:
"     " let g:rc_dir    = expand("~/.vim/rc")
"     let g:rc_dir    = expand("C:\\Users\\mm12167\\dotfiles\\.vim\\rc")
"     " let s:toml      = g:rc_dir . "/dein.toml"
"     " let s:lazy_toml = g:rc_dir . "/dein_lazy.toml"
"     let s:toml      = g:rc_dir . "\\dein_nvim.toml"
"     let s:lazy_toml = g:rc_dir . "\\dein_lazy_nvim\.toml"
"     " <<<                                    \
"
"     " "*.toml" を読込み、キャッシュ
"     call dein#load_toml(s:toml,      {"lazy": 0})
"     call dein#load_toml(s:lazy_toml, {"lazy": 1})
"
"     " 設定終了
"     call dein#end()
"     call dein#save_state()
" endif
"
" " 未インストールがあればインストール
" if dein#check_install()
"     call dein#install()
" endif
"
" " MEMO:
" " プラグインの追加・削除やtomlファイルの設定を変更した後は
" " 適宜 "call dein#update()" や "call dein#clear_state()" を実行する
" " --------------------------------------------------------------------------------
" }}}
