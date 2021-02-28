scriptencoding utf-8
" Created:     201*/**/** **:**:**
" Last Change: 2021/02/28 20:14:26.

" !!!: 必ず先頭に記述
" "autocmd"（マクロ） の初期化
augroup MyAutoCmd
    autocmd!
augroup END

" ---------------------------------------------------------------------------
" 設定ファイル 読込み
    " MEMO: "Plugin" 設定は後半に読込み
" ---------------------------------------------------------------------------
" "Windows" の設定ファイルの場所を、"Linux/Mac" 環境にあわせる
if (has("win32") || has("win64"))
    set runtimepath+=$HOME/.vim
endif

" MEMO:
" 記述順番 変更しない！！！
" "Leader" の設定のみ設定ファイル読込み直前に行う
" <Space> を "Leader" に割当て
let mapleader = "\<Space>"

" "Vim" の設定ファイル
runtime! colors/*.vim
runtime! userautoload/init_settings/*.vim

" "Python" の "Path" の設定を読込み
runtime! pythonpath.vim

" ---------------------------------------------------------------------------
" "dein.vim" の設定
    " MEMO: "NeoVim" と統合しない
" ---------------------------------------------------------------------------
" FIXME:
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
if !has("mac")
    " FIXME: "Mac" は読込むとエラー
    " MEMO:
    " Nvim 0.4.2 以降では、”UIEnter” autocommand があるため
    " "ginit.vim" が不要
    " ~~MEMO: 上記のためか自動で "ginit.vim" を読込まないため下記追加~~
    " MEMO: "colorscheme" だけが適用されていない模様
    " call s:source_rc("nvim/ginit.vim")
else
    " MEMO: "visual.vim" 内のこの記述のみ適用されない
    " TEST: 修正したので "Mac" でテスト
    " コマンドライン（"Vim" 画面下部）高さ
    " set cmdheight=5
endif

" ee: "TComment" 起動
nnoremap <silent> ee :<C-u>TComment<CR>

" MEMO:
" 読み込んだプラグインも含め、ファイルタイプの検出
" ファイルタイプ別プラグイン/インデントを有効化する
" filetype plugin indent on

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
