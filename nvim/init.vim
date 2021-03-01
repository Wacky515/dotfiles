
" Created:     201*/**/** **:**:**
" Last Change: 01-Mar-2021.

" !!!: 必ず先頭に記述
" "autocmd"（マクロ） の初期化
augroup MyAutoCmd
    autocmd!
augroup END

" ---------------------------------------------------------------------------
" 設定ファイル 読込み
    " MEMO:
    " 記述順番 変更しない！！！
    " "Plugin" 設定は後半に読込み
" ---------------------------------------------------------------------------
" "Windows" の設定ファイルの場所を、"Linux/Mac" 環境にあわせる
if (has("win32") || has("win64"))
    set runtimepath+=$HOME/.vim
endif

" ---------------------------------------------------------------------------
" "Python" の "Path" 設定読込み
    " MEMO:
    " ".vimrc" から不可分
    " PC追加時は ".vimrc" も追記
    " "Python3.6.*" でないと "Dark powed" できない 2021/02/21
" ---------------------------------------------------------------------------
if has("vim_starting")
    if has("mac")
        let g:python3_host_prog = "/usr/local/bin/python3"
        let g:python_host_prog  = "/usr/bin/python"

    elseif has("unix")
        let g:python3_host_prog = "/usr/bin/python3"
        let g:python_host_prog  = "/usr/bin/Python"

    elseif (has("win32") || has("win64"))
        if hostname()     == "HBAMB1448"
            let g:python3_host_prog =
                \ $HOME."/AppData/Local/Programs/Python/Python36/python.exe"
        elseif hostname() == "HBAMB819"
            let g:python3_host_prog =
                \ "C:\\Python36\\python.exe"
            let g:python_host_prog  =
                \ "C:\\tools\\miniconda3\\envs\\vim_mcon_env_py27\\python.exe"

        else
            let g:python3_host_prog =
                \ "C:\\tools\\miniconda3\\envs\\vim_mcon_env_py36\\python.exe"
            let g:python_host_prog  =
                \ "C:\\tools\\miniconda3\\envs\\vim_mcon_env_py27\\python.exe"
        endif
    endif
endif

" ---------------------------------------------------------------------------
" "pythonthreedll" 設定読込み
" ---------------------------------------------------------------------------
" "jedi-vim" で "Anaconda3" のライブラリを補完
if has("vim_starting")
    if (has("unix") && !has("mac"))
        set pythonthreedll  = $VIM."/python3/python35.dll"
        set pythonthreehome = $VIM."/python3/"

    endif
endif

" ---------------------------------------------------------------------------
" "Vim" 設定ファイルの読込み
    " MEMO: "Leader" のみ設定ファイル読込み直前に設定
" ---------------------------------------------------------------------------
" <Space> を "Leader" に割当て
let mapleader = "\<Space>"

runtime! colors/*.vim
runtime! userautoload/init_settings/*.vim

" ---------------------------------------------------------------------------
" "dein.vim" の設定
    " !!!: ".vimrc" と統合しない
" ---------------------------------------------------------------------------
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
if exists("g:nyaovim_version")
    let s:plugin_dir = expand("~/.config/nyaovim/dein")
elseif exists("g:gui_oni")
    let s:plugin_dir = expand("~/.config/oni/dein")
else
    let s:plugin_dir = expand("~/.config/nvim/dein/")
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

    if exists("g:nyaovim_version")
        call dein#add("rhysd/nyaovim-markdown-preview")
        call dein#add("rhysd/nyaovim-popup-tooltip")
        call dein#add("rhysd/nyaovim-mini-browser")
    endif

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

" ---------------------------------------------------------------------------
" Init最終処理
" ---------------------------------------------------------------------------
if has("mac")
    colorscheme iceberg
    " MEMO: "visual.vim" 内のこの記述のみ適用されない
    " コマンドライン（"Vim" 画面下部）高さ
    set cmdheight=5
    " source ~/.gvimrc
    " source ~/dotfiles/nvim/ginit.vim
endif

" シンタックスハイライト
" MEMO: "dein.vim" に関する設定の後にON
syntax on

" MEMO:
" 読み込んだプラグインも含め、ファイルタイプの検出
" ファイルタイプ別プラグイン/インデントを有効化する
filetype plugin indent on

" ---------------------------------------------------------------------------
" "NyaoVim" 設定篇
" ---------------------------------------------------------------------------
if exists("g:nyaovim_version")
    try
        if s:on_nyaovim || s:true_color_enabled
            colorscheme iceberg
            " colorscheme spring-night
            let g:airline_theme = "spring_night"
        else
            colorscheme iceberg
            " colorscheme wallaby
            let g:airline_theme = "spring_night"
            " let g:airline_theme = "wombat"
        endif
    catch
        set background=dark
        colorscheme iceberg
        " colorscheme default
    endtry
endif

" ---------------------------------------------------------------------------
" "Oni" 設定篇
" ---------------------------------------------------------------------------
" if exists("g:gui_oni")
"     echo Setting for Oni
" endif
