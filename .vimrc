scriptencoding utf-8

" --------------------------------------------------------------------------------
" dein.vimの設定
" --------------------------------------------------------------------------------

if !&compatible
    set nocompatible
endif

" Vim起動完了時にインストール
augroup PluginInstall
    autocmd!
    autocmd VimEnter * if dein#check_install() | call dein#install() | endif
augroup END

" プラグインをインストールするディレクトリ
let s:plugin_dir = expand('~/.cache/dein/')
" "dein.vim" をインストールするディレクトリをランタイムパスへ追加
let s:dein_dir = s:plugin_dir . 'repos/github.com/Shougo/dein.vim'
execute 'set runtimepath+=' . s:dein_dir

" dein.vimが入っていなければ "git clone"
if !isdirectory(s:dein_dir)
    call mkdir(s:dein_dir, 'p')
    silent execute printf('!git clone %s %s', 'https://github.com/Shougo/dein.vim', s:dein_dir)
endif
" < http://yuheikagaya.hatenablog.jp/entry/2016/03/20/171907 >

" 設定開始
if dein#load_state(s:plugin_dir)
    call dein#begin(s:plugin_dir)

    " プラグインリストの "*.toml" を指定
    let g:rc_dir    = expand('~/.vim/rc')
    let s:toml      = g:rc_dir . '/dein.toml'
    let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

    " "*.toml" を読込み、キャッシュ
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

" ----------------------------------------
" 以下から "Plugin" 個別の設定
" 切出せるなら切出す

""" syntastic """
" PEP8に準拠
" FIXME: エラーの為、一旦Kill
let g:syntastic_python_checkers = ['pyflakes', 'pep8']
" let g:syntastic_python_checkers = ['pyflakes']

""" vim_indent_guides """
" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1
" ----------------------------------------

" プラグインの追加・削除やtomlファイルの設定を変更した後は
" 適宜 "call dein#update()" や "call dein#clear_state()" を実行する
" --------------------------------------------------------------------------------


" --------------------------------------------------------------------------------
" Windows環境の設定ファイルの場所を、Mac/Linux環境にあわせる
" --------------------------------------------------------------------------------
" set runtimepath+=$HOME/.vim,$HOME/.vim/after
set runtimepath+=$HOME/.vim

" ".vimrc" と ".gvimrc" を分割配置
set runtimepath+=~/.vim/
runtime! userautoload/*.vim
"
" 読み込んだプラグインも含め、ファイルタイプの検出
" ファイルタイプ別プラグイン/インデントを有効化する
filetype plugin indent on

