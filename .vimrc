scriptencoding utf-8
" Last Change: 2018/04/04 11:41:03.

" !!!: 必ず先頭に記述
" "autocmd"（マクロ） の初期化
augroup MyAutoCmd
    autocmd!
augroup END

" "Python3" のパス設定
if has("nvim") && hostname() == "HBAMB748A"
    let g:python3_host_prog = "C:\\Python35\\python.exe"
elseif has("win32") || has("win64")
    let g:python3_host_prog = "C:\Python35\python.exe"
endif

" ---------------------------------------------------------------------------
" dein.vimの設定
" ---------------------------------------------------------------------------
if !&compatible
set nocompatible
endif

" "Vim" 起動完了時にインストール
augroup PluginInstall
autocmd!
autocmd VimEnter * if dein#check_install() | call dein#install() | endif
augroup END

" プラグインをインストールするディレクトリを指定
if !has("nvim")
let s:plugin_dir = expand("~/.cache/dein/")
elseif has("unix")
" TODO: Unix系のパス設定追加
let s:plugin_dir = expand("~/.config/nvim/.cache/dein/")
elseif has("win32") || has("win64")
if hostname() == "HBAMB748A"
    let s:plugin_dir = expand("C:\\Users\\MM12167\\AppData\\Local\\nvim\\.cache\\dein\\")
else
    " FTR:
    " let s:plugin_dir = expand("~/.cache/nvim/dein/")
    let s:plugin_dir = expand("~/AppData/Local/nvim/.cache/dein/")
endif
elseif exists("g:nyaovim_version")
let s:dein_cache_path = expand("~/.config/nyaovim/dein")
endif

" "dein.vim" をインストールするディレクトリをランタイムパスへ追加
if hostname() == "HBAMB748A"
let s:dein_dir = s:plugin_dir . "repos\\github.com\\Shougo\\dein.vim"
else
let s:dein_dir = s:plugin_dir . "repos/github.com/Shougo/dein.vim"
endif
execute "set runtimepath+=" . s:dein_dir

" "dein.vimが" なければ "git clone"
if !isdirectory(s:dein_dir)
call mkdir(s:dein_dir, "p")
silent execute printf("!git clone %s %s", "https://github.com/Shougo/dein.vim", s:dein_dir)
endif
" < http://yuheikagaya.hatenablog.jp/entry/2016/03/20/171907 >

" 設定開始
if dein#load_state(s:plugin_dir)
call dein#begin(s:plugin_dir)

" プラグインリスト "*.toml" を指定
if has("nvim") && hostname() == "HBAMB748A"
    let g:rc_dir      = expand("C:\\Users\\MM12167\\.vim\\rc")
    let s:toml        = g:rc_dir . "\\dein.toml"
    let s:lazy_toml   = g:rc_dir . "\\dein_lazy.toml"
    let s:python_toml = g:rc_dir . "\\dein_python.toml"
else
    let g:rc_dir      = expand("~/.vim/rc")
    let s:toml        = g:rc_dir . "/dein.toml"
    let s:lazy_toml   = g:rc_dir . "/dein_lazy.toml"
    let s:python_toml = g:rc_dir . "/dein_python.toml"
endif

" "*.toml" を読込み、キャッシュ
call dein#load_toml(s:toml,            {"lazy": 0})
call dein#load_toml(s:lazy_toml,       {"lazy": 1})
if has ("python3")
    call dein#load_toml(s:python_toml, {"lazy": 0})
endif

if exists('g:nyaovim_version')
    call dein#add('rhysd/nyaovim-markdown-preview')
    call dein#add('rhysd/nyaovim-mini-browser')
    " call dein#add('rhysd/nyaovim-popup-tooltip')
endif

" 設定終了
call dein#end()
call dein#save_state()
endif

" 未インストールのプラグインがあればインストール
if dein#check_install()
call dein#install()
endif

" MEMO:
" プラグインの追加・削除やtomlファイルの設定を変更した後は
" 適宜 "du: call dein#check_update()" や "dc: call dein#clear_state()" を実行する
" --------------------------------------------------------------------------------

" ---------------------------------------------------------------------------
" Init処理
" ---------------------------------------------------------------------------

" MEMO: 記述順番 変更しない！！！
" <Space> を "Leader" に割当て
let mapleader = "\<Space>"

" "Windows" 環境の設定ファイルの場所を、"Linux/Mac" 環境にあわせる
set runtimepath+=$HOME/.vim
" "Vim" の設定ファイル
runtime! userautoload/*.vim
" プラグインの設定ファイル
runtime! userautoload/plugin_setting/*.vim

" 読み込んだプラグインも含め、ファイルタイプの検出
" ファイルタイプ別プラグイン/インデントを有効化する
filetype plugin indent on
