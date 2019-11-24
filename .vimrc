scriptencoding utf-8
" Created:     2016/07/31 **:**:**
<<<<<<< HEAD
" Last Change: 2019/11/06 15:21:47.

" NOT_WORK:
" " "Macvim" �� "Python3" ���ďo���iPython2�ƕ��p�s�̂��߁j " {{{
=======
" Last Change: 2019/11/24 21:00:40.

" NOT_WORK:
" " "Macvim" で "Python3" を呼出す（Python2と併用不可のため） " {{{
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
" if (has("mac") && has("kaoriya"))
"     if has("python3")
"     endif
" endif
" }}}

<<<<<<< HEAD
" MEMO: �K���擪�ɋL�q
" "autocmd" �i�}�N���j�̏�����
=======
" MEMO: 必ず先頭に記述
" "autocmd" （マクロ）の初期化
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
augroup MyAutoCmd
    autocmd!
augroup END

<<<<<<< HEAD
" "vimproc" �Ǎ��ݎ��A"*.dll" ����DL & �X�V
let g:vimproc#download_windows_dll = 1

" ---------------------------------------------------------------------------
" "Python" �ݒ�
" ---------------------------------------------------------------------------
if hostname()     == "saladserver.com"
    let g:python3_host_prog = "/usr/local/bin/python3"
elseif hostname() == "ProSalad133-2018.local"
=======
" "vimproc" 読込み時、"*.dll" 自動DL & 更新
let g:vimproc#download_windows_dll = 1

" ---------------------------------------------------------------------------
" "Python" 設定
" ---------------------------------------------------------------------------
if hostname()     == "saladserver.com"
    let g:python3_host_prog = "/usr/local/bin/python3"
elseif hostname() == "ProSalad13-2018.local"
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
    let g:python3_host_prog = "/usr/local/bin/Python3"
elseif hostname() == "SaladBook.local"
    let g:python3_host_prog = "/usr/local/bin/python3"
elseif hostname() == "HBAMB748"
    let g:python_host_prog  = "C:\\Python27\\python.exe"
    let g:python3_host_prog = "C:\\Python36\\python.exe"
<<<<<<< HEAD
    " MEMO: �� "Denite" �ŃG���[
    " let g:python3_host_prog = "C:\\tools\\miniconda3\\python.exe"
    if !has("nvim")
        " "HBAMB748" "Vim" �� "Unkwown option" �G���[
=======
    " MEMO: ↓ "Denite" でエラー
    " let g:python3_host_prog = "C:\\tools\\miniconda3\\python.exe"
    if !has("nvim")
        " "HBAMB748" "Vim" で "Unkwown option" エラー
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
        if has("gui_running")
            set pythonthreedll=C:\Python36\python36.dll
        else
            let g:python3_host_prog = "C:\\tools\\miniconda3\\python.exe"
        endif
    endif
elseif hostname() == "HBAMB819"
    let g:python_host_prog  = "C:\\Python27\\python.exe"
    let g:python3_host_prog = "C:\\Users\\mm12167\\AppData\\Local\\Programs\\Python\\Python36\\python.exe"
    if !has("nvim")
        if has("gui_running")
            set pythonthreedll=C:\Users\mm12167\AppData\Local\Programs\Python\Python36\python36.dll
        else
            let g:python3_host_prog = "C:\\tools\\Anaconda3\\python.exe"
        endif
    endif
elseif hostname() == "HBAMB748A"
    let g:python_host_prog  = "C:\\Python27\\python.exe"
    let g:python3_host_prog = "C:\\Python35\\python.exe"
elseif hostname() == "SALADCARBONX1"
    let g:python3_host_prog =
    \ "C:\\Users\\SkyDog\\AppData\\Local\\Programs\\Python\\Python37\\python.exe"
elseif hostname() == "ProSalad133.local"
    let g:python3_host_prog = "/usr/local/bin/Python3"
else
    if has("unix")
        " let g:python3_host_prog = "/usr/local/bin/Python3"
        let g:python3_host_prog = "/usr/bin/python3"
    elseif (has("win32") || has("win64"))
        let g:python3_host_prog = "C:\\Python35\\python.exe"
    endif
endif

" ---------------------------------------------------------------------------
<<<<<<< HEAD
" dein.vim�̐ݒ�
=======
" dein.vimの設定
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
" ---------------------------------------------------------------------------
if !&compatible
    set nocompatible
endif

<<<<<<< HEAD
" "Vim" �N���������ɃC���X�g�[��
=======
" "Vim" 起動完了時にインストール
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
augroup PluginInstall
    autocmd!
    autocmd VimEnter * if dein#check_install() | call dein#install() | endif
augroup END

<<<<<<< HEAD
" �v���O�C�����C���X�g�[������f�B���N�g�����w��
=======
" プラグインをインストールするディレクトリを指定
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
if !has("nvim")
    if !has("gui_running")
        let s:plugin_dir = expand("~/.cache/dein/")
    else
        let s:plugin_dir = expand("~/.config/gvim/dein/")
    endif
elseif exists("g:nyaovim_version")
    let s:plugin_dir     = expand("~/.config/nyaovim/dein")
elseif exists("g:gui_oni")
    let s:plugin_dir     = expand("~/.config/oni/dein")
elseif has("nvim")
    let s:plugin_dir     = expand("~/.config/nvim/dein/")
endif

<<<<<<< HEAD
" TODO: Unix�n�̃p�X�ݒ�ǉ�
" "dein.vim" ���C���X�g�[������f�B���N�g���������^�C���p�X�֒ǉ�
=======
" TODO: Unix系のパス設定追加
" "dein.vim" をインストールするディレクトリをランタイムパスへ追加
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
let s:dein_dir = s:plugin_dir . "repos/github.com/Shougo/dein.vim"

execute "set runtimepath+=" . s:dein_dir

<<<<<<< HEAD
" ���O�o��
let g:dein#install_log_filename = s:dein_dir . "/dein.log"

" "dein.vim" ���Ȃ���� "git clone"
=======
" ログ出力
let g:dein#install_log_filename = s:dein_dir . "/dein.log"

" "dein.vim" がなければ "git clone"
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
if !isdirectory(s:dein_dir)
    call mkdir(s:dein_dir, "p")
    silent execute printf("!git clone %s %s", "https://github.com/Shougo/dein.vim", s:dein_dir)
endif
" REF: < http://yuheikagaya.hatenablog.jp/entry/2016/03/20/171907 >

<<<<<<< HEAD
" �ݒ�J�n
if dein#load_state(s:plugin_dir)
    call dein#begin(s:plugin_dir)

    " �v���O�C�����X�g "*.toml" ���w��
=======
" 設定開始
if dein#load_state(s:plugin_dir)
    call dein#begin(s:plugin_dir)

    " プラグインリスト "*.toml" を指定
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
    if !has("nvim")
        let g:plugin_dir   = expand("~/.vim/vim_plugins")
        let s:toml         = g:plugin_dir . "/dein.toml"
        let s:lazy_toml    = g:plugin_dir . "/dein_lazy.toml"
        let s:python_toml  = g:plugin_dir . "/dein_python.toml"
    endif

    let g:plugin_dir_nvim  = expand("~/.vim/vim_plugins_nvim")
    let s:toml_nvim        = g:plugin_dir_nvim . "/dein_nvim.toml"
    let s:lazy_toml_nvim   = g:plugin_dir_nvim . "/dein_lazy_nvim.toml"
    let s:python_toml_nvim = g:plugin_dir_nvim . "/dein_python_nvim.toml"

<<<<<<< HEAD
    "*.toml" ��Ǎ��݁A�L���b�V��
=======
    "*.toml" を読込み、キャッシュ
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
    if !has("nvim")
        call dein#load_toml(s:toml,             {"lazy": 0})
        call dein#load_toml(s:lazy_toml,        {"lazy": 1})
    endif

    call dein#load_toml(s:toml_nvim,            {"lazy": 0})
    call dein#load_toml(s:lazy_toml_nvim,       {"lazy": 1})

    if has ("python3")
        call dein#load_toml(s:python_toml_nvim, {"lazy": 1})
    endif

    if !has("nvim")
        call dein#add("roxma/nvim-yarp")
        call dein#add("roxma/vim-hug-neovim-rpc")
    endif

    if exists("g:nyaovim_version")
        call dein#add("rhysd/nyaovim-markdown-preview")
        call dein#add("rhysd/nyaovim-popup-tooltip")
        call dein#add("rhysd/nyaovim-mini-browser")
    endif

<<<<<<< HEAD
    " �ݒ�I��
=======
    " 設定終了
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
    call dein#end()
    call dein#save_state()
endif

<<<<<<< HEAD
" ���C���X�g�[���̃v���O�C��������΃C���X�g�[��
=======
" 未インストールのプラグインがあればインストール
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
if has("vim_starting") && dein#check_install()
    call dein#install()
endif

" MEMO:
<<<<<<< HEAD
" �v���O�C���̒ǉ��E�폜��toml�t�@�C���̐ݒ��ύX�������
" �K�X "du: call dein#check_update()" �� "dc: call dein#clear_state()" �����s����
" --------------------------------------------------------------------------------

" ---------------------------------------------------------------------------
" Init����
" ---------------------------------------------------------------------------

" MEMO: �L�q���� �ύX���Ȃ��I�I�I
" <Space> �� "Leader" �Ɋ�����
let mapleader = "\<Space>"

" "Windows" ���̐ݒ�t�@�C���̏ꏊ���A"Linux/Mac" ���ɂ��킹��
set runtimepath+=$HOME/.vim
" "Vim" �̐ݒ�t�@�C��
runtime! userautoload/*.vim
" �v���O�C���̐ݒ�t�@�C��
=======
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
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
if !has("nvim")
    runtime! userautoload/plugin_settings/*.vim
    runtime! userautoload/plugin_settings_nvim/*.vim
else
    runtime! userautoload/plugin_settings_nvim/*.vim
endif

<<<<<<< HEAD
" �ǂݍ��񂾃v���O�C�����܂߁A�t�@�C���^�C�v�̌��o
" �t�@�C���^�C�v�ʃv���O�C��/�C���f���g��L��������
=======
" 読み込んだプラグインも含め、ファイルタイプの検出
" ファイルタイプ別プラグイン/インデントを有効化する
>>>>>>> 4fa438d838e85600434ecbf43c65ee2e2fc639db
filetype plugin indent on
