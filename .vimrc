scriptencoding utf-8

" --------------------------------------------------------------------------------
" dein.vimの設定
" --------------------------------------------------------------------------------

if !&compatible
    set nocompatible
endif

" Proxyの設定
let g:dein#types#git#default_protocol = 'ssh'
" let g:dein#types#git#default_protocol = 'https'
" let g:dein#types#git#default_protocol = 'http'
" Vim起動完了時にインストール

augroup PluginInstall
    autocmd!
    autocmd VimEnter * if dein#check_install() | call dein#install() | endif
augroup END

" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " プラグインリストを収めた TOML ファイル
    " （予め TOML ファイルを用意しておく）
    let g:rc_dir    = expand('~/.vim/rc')
    let s:toml      = g:rc_dir . '/dein.toml'
    let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

    " TOML を読み込み、キャッシュしておく
    call dein#load_toml(s:toml,      {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

    " 設定終了
    call dein#end()
    call dein#save_state()
endif

" 未インストールがあればインストール
if dein#check_install()
    call dein#install()
endif

" 以下から "Plugin" 個別の設定
" 切出せるなら切出す

""" Jedi-vim """
" docstringは表示しない
autocmd FileType python setlocal completeopt-=preview

""" vim_indent_guides """
" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1

" プラグインの追加・削除やtomlファイルの設定を変更した後は
" 適宜 "call dein#update()" や "call dein#clear_state()" を実行する
" --------------------------------------------------------------------------------


" Windows環境の設定ファイルの場所を、Mac/Linux環境にあわせる
" set runtimepath+=$HOME/.vim,$HOME/.vim/after
set runtimepath+=$HOME/.vim

" ".vimrc" と ".gvimrc" を分割配置
set runtimepath+=~/.vim/
runtime! userautoload/*.vim
