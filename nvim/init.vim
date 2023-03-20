scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2023/03/19 14:53:27.

" !!!: 必ず先頭に記述
" "autocmd(マクロ)" の初期化
augroup MyAutoCmd
    autocmd!
augroup END

" "filetype" 初期化
filetype off
" 最終行でON
filetype plugin indent off

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
runtime! colors/*.vim
set runtimepath+=$HOME/.vim
runtime! userautoload/init_settings/*.vim

" ------------------------------------------------------------------------------
"  "Python" の "Path" 設定読込み  " {{{
    " MEMO: "init.vim" へ不可分
    " }}}
" ------------------------------------------------------------------------------
if has("vim_starting")
    if has("mac")
        if hostname() == "SaladBookAirM1"
            let g:python3_host_prog = "/opt/homebrew/bin/python3"
        else
            let g:python3_host_prog = "/usr/local/bin/python3"
        endif
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
"  "dein.vim" の設定  " {{{
    " !!!: ".vimrc" と統合しない
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

" "Plugin" をインストールするディレクトリを指定
let s:plugin_dir = expand("~/.config/nvim/dein/")

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

    " "Plugin" リスト "*.toml" を指定
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

    " 設定終了
    call dein#end()
    call dein#save_state()
endif

" 未インストールの"Plugin" があればインストール
if has("vim_starting") && dein#check_install()
    call dein#install()
endif

" "Plugin" の設定ファイル読込み
runtime! userautoload/plugin_settings_nvim/*.vim

" ------------------------------------------------------------------------------
"  最終処理
" ------------------------------------------------------------------------------
if !has("gui_runnig") && (has("mac") || has("win32") || has("win64"))
    " "colorscheme" 設定
        " !!!: "visual.vim" で無く、ここに記述
    colorscheme iceberg
    " コマンドライン(画面下部) 高さ
    set cmdheight=5
    " タブ文字 色設定
    highlight SpecialKey guibg=NONE guifg=DarkGreen
    " 改行文字 色設定
    highlight NonText    guibg=NONE guifg=DarkGreen
endif

" ------------------------------------------------------------------------------
" Syntax highlight 解説  " {{{
" ファイルタイプ系ハイライト"Plugin" を導入している場合
" "syntax on" は現在の "runtimepath" の設定で "Syntax"を生成
" "runtimepath" 初期化後の "syntax on" はあまり意味が無く
" "runtimepath" 設定後に "syntax on" すべき

" # 悪いパターン
" "runtimepath" 初期化処理
" set runtimepath=$VIMRUNTIME
" syntax on
" ファイルタイプ系ハイライト"Plugin"
" neoBundle 'kongo2002/fsharp-vim'

" # 良いパターン
" "runtimepath" 初期化処理
" set runtimepath=$VIMRUNTIME
" ファイルタイプ系ハイライト"Plugin"
" neoBundle 'kongo2002/fsharp-vim'
" syntax on
" }}}
" ------------------------------------------------------------------------------
if has("syntax")
  syntax on
endif

" MEMO:
    " 読込んだ"Plugin" 含めてファイルタイプの検出と
    " ファイルタイプ別に"Plugin" 、インデントを有効化
filetype plugin indent on
