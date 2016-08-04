scriptencoding utf-8

" --------------------------------------------------------------------------------
" dein.vimの設定
" --------------------------------------------------------------------------------
" インストールディレクトリの指定
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ clone
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定読込み
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
    let g:rc_dir    = expand('~/.vim/rc')
    let s:toml      = g:rc_dir . '/dein.toml'
    let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
    call dein#load_toml(s:toml,      {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

" 未インストールものがあったらインストール
if dein#check_install()
    call dein#install()
endif
" <http://qiita.com/delphinus35/items/00ff2c0ba972c6e41542>
" --------------------------------------------------------------------------------


" Windows環境が設定ファイルの場所を、Mac OSX環境にあわせる
set runtimepath+=$HOME/.vim,$HOME/.vim/after

" .vimrc と .gvimrc を分割配置
set runtimepath+=~/.vim/
runtime! userautoload/*.vim
