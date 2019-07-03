scriptencoding utf-8
" Created:     2016/07/31 **:**:**
" Last Change: 2019/07/03 09:31:41.

" NOT_WORK:
" " "Macvim" で "Python3" を呼出す（Python2と併用不可のため）
" if (has("mac") && has("kaoriya"))
"     if has('python3')
"     endif
" endif

let g:deoplete#enable_at_startup = 1

" MEMO: 必ず先頭に記述
" "autocmd" （マクロ）の初期化
augroup MyAutoCmd
    autocmd!
augroup END

" "vimproc" 読込み時、"*.dll" 自動DL & 更新
let g:vimproc#download_windows_dll = 1

" "Python" のパス設定
if hostname() == "ProSalad133.local"
    let g:python3_host_prog = "/usr/local/bin/Python3"
elseif hostname() == "SaladBook.local"
    let g:python3_host_prog = "/usr/local/bin/Python3"
elseif hostname() == "HBAMB748"
    let g:python_host_prog = "C:\\Python27\\python.exe"
    let g:python3_host_prog = "C:\\tools\\miniconda3\\python.exe"
    if !has("nvim")
        " "HBAMB748" "vim" で未知 "Unkwown option" エラー
        if has("gui_running")
            set pythonthreedll=C:\Python36\python36.dll
        else
            let g:python3_host_prog = "C:\\tools\\miniconda3\\python.exe"
        endif
    endif
elseif hostname() ==  "HBAMB748A"
    let g:python_host_prog = "C:\\Python27\\python.exe"
    let g:python3_host_prog = "C:\\Python35\\python.exe"
elseif hostname() ==  "HBAMB819"
    let g:python_host_prog = "C:\\Python27\\python.exe"
    let g:python3_host_prog = "C:\\Python35\\python.exe"
elseif hostname() == "SALADCARBONX1"
    let g:python3_host_prog =
    \ "C:\\Users\\SkyDog\\AppData\\Local\\Programs\\Python\\Python37\\python.exe"
else
    if has("unix")
        let g:python3_host_prog = "/usr/local/bin/Python3"
    elseif (has("win32") || has("win64"))
        let g:python3_host_prog = "C:\\Python35\\python.exe"
    endif
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
elseif exists("g:nyaovim_version")
    let s:plugin_dir = expand("~/.config/nyaovim/dein")
elseif exists("g:gui_oni")
    let s:plugin_dir = expand("~/.config/oni/dein")
elseif has("nvim")
    if has("unix")
        let s:plugin_dir = expand("~/.config/nvim/.cache/dein/")
    elseif (has("win32") || has("win64"))
        if hostname() == "HBAMB748"
            " let s:plugin_dir = expand("C:\\Users\\mm12167\\.config\\nvim\\.cache\\dein\\")
            let s:plugin_dir = expand("~\\.config\\nvim\\.cache\\dein\\")
        elseif hostname() ==  "HBAMB748A"
            let s:plugin_dir = expand("~\\.config\\nvim\\.cache\\dein\\")
        elseif hostname() ==  "HBAMB819"
            let s:plugin_dir = expand("~\\.config\\nvim\\.cache\\dein\\")
        else
            let s:plugin_dir = expand("~\\.config\\nvim\\.cache\\dein\\")
        endif
    endif
endif

" TODO: Unix系のパス設定追加
" "dein.vim" をインストールするディレクトリをランタイムパスへ追加
if !has("nvim")
    let s:dein_dir = s:plugin_dir . "repos/github.com/Shougo/dein.vim"
elseif has("nvim")
    if (has("win32") || has("win64"))
        let s:dein_dir = s:plugin_dir . "repos\\github.com\\Shougo\\dein.vim"
    else
        let s:dein_dir = s:plugin_dir . "repos/github.com/Shougo/dein.vim"
    endif
endif
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
    if !has("nvim")
        let g:plugin_dir           = expand("~/.vim/vim_plugins")
        let s:toml                 = g:plugin_dir . "/dein.toml"
        let s:lazy_toml            = g:plugin_dir . "/dein_lazy.toml"
        let s:python_toml          = g:plugin_dir . "/dein_python.toml"

        let g:plugin_dir_nvim      = expand("~/.vim/vim_plugins_nvim")
        let s:toml_nvim            = g:plugin_dir_nvim . "/dein_nvim.toml"
        let s:lazy_toml_nvim       = g:plugin_dir_nvim . "/dein_lazy_nvim.toml"
        let s:python_toml_nvim     = g:plugin_dir_nvim . "/dein_python_nvim.toml"

    elseif has("nvim")
        if has("unix")
            let g:plugin_dir_nvim  = expand("~/.vim/vim_plugins_nvim")
            let s:toml_nvim        = g:plugin_dir_nvim . "/dein_nvim.toml"
            let s:lazy_toml_nvim   = g:plugin_dir_nvim . "/dein_lazy_nvim.toml"
            let s:python_toml_nvim = g:plugin_dir_nvim . "/dein_python_nvim.toml"
        else
            let g:plugin_dir_nvim  = expand("~\\.vim\\vim_plugins_nvim")
            let s:toml_nvim        = g:plugin_dir_nvim . "\\dein_nvim.toml"
            let s:lazy_toml_nvim   = g:plugin_dir_nvim . "\\dein_lazy_nvim.toml"
            let s:python_toml_nvim = g:plugin_dir_nvim . "\\dein_python_nvim.toml"
        endif
    endif

    "*.toml" を読込み、キャッシュ
    if !has("nvim")
        call dein#load_toml(s:toml,                 {"lazy": 0})
        call dein#load_toml(s:lazy_toml,            {"lazy": 1})
        if has ("python3")
            call dein#load_toml(s:python_toml,      {"lazy": 1})
        endif
    endif
    call dein#load_toml(s:toml_nvim,                {"lazy": 0})
    call dein#load_toml(s:lazy_toml_nvim,           {"lazy": 1})
    if has ("python3")
        call dein#load_toml(s:python_toml_nvim,     {"lazy": 1})
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
if !has("nvim")
    runtime! userautoload/plugin_settings/*.vim
    runtime! userautoload/plugin_settings_nvim/*.vim
else
    runtime! userautoload/plugin_settings_nvim/*.vim
endif

" 読み込んだプラグインも含め、ファイルタイプの検出
" ファイルタイプ別プラグイン/インデントを有効化する
filetype plugin indent on

