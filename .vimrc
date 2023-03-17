scriptencoding utf-8
" Created:     2016/07/31 **:**:**
" Last Change: 2023/03/17 09:34:02.

" !!!: 必ず先頭に記述
" "autocmd(マクロ)" の初期化
augroup MyAutoCmd
    autocmd!
augroup END

" "filetype" 初期化
filetype off
" 最終行でON
filetype plugin indent off

" "vimproc" 読込み時、"*.dll" 自動DL & 更新
let g:vimproc#download_windows_dll = 1

" <Space> を "Leader" に設定
let mapleader = "\<Space>"

" ------------------------------------------------------------------------------
"  "Vim" 設定ファイルの読込み  " {{{
    " !!!: 記述順番 変更しない
    " MEMO:
        " "Leader" のみ設定ファイル読込み直前に設定
        " "Plugin" 設定は後半に読込み
        " }}}
" ------------------------------------------------------------------------------
" "MacVim" の "colors/*.vim" 設定
if (!has("mac") && !has("gui_running"))
    runtime! colors/*.vim
endif

" "Windows" の設定ファイルの場所を、"Mac/Linux" 環境にあわせる
if (has("win32") || has("win64"))
    set runtimepath+=$HOME/.vim
endif

runtime! userautoload/init_settings/*.vim

" ------------------------------------------------------------------------------
"  "Python" の "Path" 設定読込み  " {{{
    " MEMO: "init.vim" へ不可分
    " }}}
" ------------------------------------------------------------------------------
if has("vim_starting")
    if has("mac")
        let g:python3_host_prog = "/usr/local/bin/python3"
        let g:python_host_prog  = "/usr/bin/python"

    elseif has("unix")
        let g:python3_host_prog = "/usr/bin/python3"
        let g:python_host_prog  = "/usr/bin/Python"

    elseif (has("win32") || has("win64"))
        let g:python3_host_prog =
            \ "C:\\tools\\miniconda3\\envs\\vim_mcon_env_py36\\python.exe"
        let g:python_host_prog  =
            \ "C:\\tools\\miniconda3\\envs\\vim_mcon_env_py27\\python.exe"
    endif
endif

" ------------------------------------------------------------------------------
"  "pythonthreedll" 設定読込み  " {{{
    " MEMO:
        " "Vim" で "Dark powed" するための設定
        " "Python3.6.*" でないと "Dark powed" できない
        " "jedi-vim" で "Anaconda3" のライブラリを補完
        " }}}
" ------------------------------------------------------------------------------
if has("vim_starting")
    if has("mac")
        set pythonthreedll  =
            \ "/usr/local/Cellar/python@3.9/3.9.2/Frameworks/Python.framework/Versions/3.9/Python"
        set pythonthreehome =
            \ "/usr/local/Cellar/python@3.9/3.9.2/Frameworks/Python.framework/Versions/3.9/"

    elseif has("unix")
        set pythonthreedll  = $VIM."/python3/python35.dll"
        set pythonthreehome = $VIM."/python3/"

    elseif (has("win32") || has("win64"))
        " MEMO: 下記をスペース揃えしない事
        set pythonthreedll=$HOME./AppData/Local/Programs/Python/Python36/python36.dll
    endif
endif

" ------------------------------------------------------------------------------
"  "dein.vim" の設定  " {{{
    " MEMO: "NeoVim" は "init.vim" に記述
    " }}}
" ------------------------------------------------------------------------------
" "dein.vim" の更新チェック高速化設定
set runtimepath+=~/OneDrive/Vim/dein
runtime! dein_token.vim

if !&compatible
    set nocompatible
endif

" "Vim" 起動完了時にインストール
augroup PluginInstall
    autocmd!
    autocmd VimEnter * if dein#check_install() | call dein#install() | endif
augroup END

" プラグインをインストールするディレクトリを指定
if !has("gui_running")
    let s:plugin_dir = expand("~/.config/vim/dein/")
else
    let s:plugin_dir = expand("~/.config/gvim/dein/")
endif

" TODO: Unix系のパス設定追加
" "dein.vim" をインストールするディレクトリをランタイムパスへ追加
let s:dein_dir = s:plugin_dir . "repos/github.com/Shougo/dein.vim"
execute "set runtimepath+=" . s:dein_dir

" ログ出力
let g:dein#install_log_filename = s:dein_dir . "/dein.log"

" "dein.vim" がなければ "git clone"
if !isdirectory(s:dein_dir)
    call mkdir(s:dein_dir, "p")
    silent execute printf("!git clone %s %s", "https://github.com/Shougo/dein.vim", s:dein_dir)
endif
" REF: < http://yuheikagaya.hatenablog.jp/entry/2016/03/20/171907 >

" 設定開始
if dein#load_state(s:plugin_dir)
    call dein#begin(s:plugin_dir)

    " プラグインリスト "*.toml" を指定
    let g:plugin_dir_nvim  = expand("~/.vim/vim_plugins_nvim")
    let s:toml_nvim        = g:plugin_dir_nvim . "/dein_nvim.toml"
    let s:lazy_toml_nvim   = g:plugin_dir_nvim . "/dein_lazy_nvim.toml"
    let s:python_toml_nvim = g:plugin_dir_nvim . "/dein_python_nvim.toml"

    "*.toml" を読込み、キャッシュ
    call dein#load_toml(s:toml_nvim,            {"lazy": 0})
    call dein#load_toml(s:lazy_toml_nvim,       {"lazy": 1})

    if has("python3")
        call dein#load_toml(s:python_toml_nvim, {"lazy": 1})
    endif

    call dein#add("roxma/nvim-yarp")
    call dein#add("roxma/vim-hug-neovim-rpc")

    " 設定終了
    call dein#end()
    call dein#save_state()
endif

" 未インストールのプラグインがあればインストール
if has("vim_starting") && dein#check_install()
    call dein#install()
endif

" "Plugin" の設定ファイル読込み
runtime! userautoload/plugin_settings_nvim/*.vim

" ------------------------------------------------------------------------------
"  最終処理
" ------------------------------------------------------------------------------
" "colorscheme" 設定
if !has("gui_runnig") && (has("mac") || has("win32") || has("win64"))
    " !!!: "visual.vim" で無く、ここに記述
    colorscheme iceberg
    " コマンドライン(画面下部) 高さ
    set cmdheight=5
endif

" ------------------------------------------------------------------------------
" Syntax highlight 解説  " {{{
" ファイルタイプ系ハイライトプラグインを導入している場合
" "syntax on" は現在の "runtimepath" の設定で "Syntax"を生成
" "runtimepath" 初期化後の "syntax on" はあまり意味が無く
" "runtimepath" 設定後に "syntax on" すべき

" # 悪いパターン
" "runtimepath" 初期化処理
" set runtimepath=$VIMRUNTIME
" syntax on
" ファイルタイプ系ハイライトプラグイン
" neoBundle 'kongo2002/fsharp-vim'

" # 良いパターン
" "runtimepath" 初期化処理
" set runtimepath=$VIMRUNTIME
" ファイルタイプ系ハイライトプラグイン
" neoBundle 'kongo2002/fsharp-vim'
" syntax on
" }}}
" ------------------------------------------------------------------------------
if has("syntax")
  syntax on
endif

" MEMO:
    " 読込んだプラグイン含めてファイルタイプの検出と
    " ファイルタイプ別にプラグイン、インデントを有効化
filetype plugin indent on
