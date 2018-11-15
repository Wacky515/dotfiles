scriptencoding utf-8
" Created:     2016/07/31 00:00:00
" Last Change: 2018/11/15 09:25:22.

" MEMO: �K���擪�ɋL�q
" "autocmd"�i�}�N���j �̏�����
augroup MyAutoCmd
    autocmd!
augroup END

" "Python3" �̃p�X�ݒ�
if hostname() == "ProSalad133.local"
    let g:python3_host_prog = "/usr/local/bin/Python3"
elseif hostname() == "HBAMB748A"
    let g:python3_host_prog = "C:\\Python35\\python.exe"
elseif hostname() == "HBAMB819"
    let g:python3_host_prog = "C:\\Python35\\python.exe"
elseif hostname() == "SALADCARBONX1"
    let g:python3_host_prog = "C:\\Users\\SkyDog\\AppData\\Local\\Programs\\Python\\Python35\\python.exe"
else
    let g:python3_host_prog = "C:\\Python35\\python.exe"
endif
" if has("nvim") && hostname() == "ProSalad133.local"  " {{{
"     let g:python3_host_prog = "/usr/local/bin/Python3"
" elseif has("nvim") && hostname() == "HBAMB748A"
"     let g:python3_host_prog = "C:\\Python35\\python.exe"
" elseif has("nvim") && hostname() == "SALADCARBONX1"
"     let g:python3_host_prog = "C:\\Users\\SkyDog\\AppData\\Local\\Programs\\Python\\Python35\\python.exe"
" elseif has("win32") || has("win64")
"     if hostname() == "SALADCARBONX1"
"         let g:python3_host_prog = "C:\\Users\\SkyDog\\AppData\\Local\\Programs\\Python\\Python35\\python.exe"
"     elseif
"         let g:python3_host_prog = "C:\\Python35\\python.exe"
"     endif
" endif
" }}}

" ---------------------------------------------------------------------------
" dein.vim�̐ݒ�
" ---------------------------------------------------------------------------
if ((has("win32") || has("win64")) && !has("kaoriya"))

    " TODO:  " {{{
    " Windows �� Vim �� dein ���C���X�g�[���ł�����
    " �ʏ�� dein �Ɠ�������
    " �v���O�C�����C���X�g�[������f�B���N�g�����w��
    " let s:plugin_dir = expand("~\.cache\dein")
    "
    " " "dein.vim" ���C���X�g�[������f�B���N�g���������^�C���p�X�֒ǉ�
    " let s:dein_dir = s:plugin_dir . "\\repos\\github.com\\Shougo\\dein.vim"
    "
    " " "dein.vim��" �Ȃ���� "git clone"
    " if &runtimepath !~# "/dein.vim"
    "     if !isdirectory(s:dein_dir)
    "         execute "!git clone https://github.com/Shougo/dein.vim" s:dein_dir
    "     endif
    "     execute "set runtimepath^=" . s:dein_dir
    " endif
    "
    " " �ݒ�J�n
    " if dein#load_state(s:plugin_dir)
    "     call dein#begin(s:plugin_dir)
    "
    "     " �v���O�C�����X�g "*.toml" ���w��
    "     let g:plugin_dir  = expand("~/vimfiles/plugin")
    "     let s:toml        = g:plugin_dir . "/dein.toml"
    "     let s:lazy_toml   = g:plugin_dir . "/dein_lazy.toml"
    "
    "     " "*.toml" ��Ǎ��݁A�L���b�V��
    "     call dein#load_toml(s:toml,      {"lazy": 0})
    "     call dein#load_toml(s:lazy_toml, {"lazy": 1})
    "
    "     " �ݒ�I��
    "     call dein#end()
    "     call dein#save_state()
    " endif
    "
    " " ���C���X�g�[���̃v���O�C��������΃C���X�g�[��
    " if dein#check_install()
    "     call dein#install()
    " endif
" }}}

else
    if !&compatible
        set nocompatible
    endif

    " "Vim" �N���������ɃC���X�g�[��
    augroup PluginInstall
        autocmd!
        autocmd VimEnter * if dein#check_install() | call dein#install() | endif
    augroup END

    " �v���O�C�����C���X�g�[������f�B���N�g�����w��
    if !has("nvim")
        let s:plugin_dir = expand("~/.cache/dein/")
    elseif has("unix")
        " TODO: Unix�n�̃p�X�ݒ�ǉ�
        let s:plugin_dir = expand("~/.config/nvim/.cache/dein/")
    elseif has("win32") || has("win64")
        if hostname() == "HBAMB748A"
            let s:plugin_dir = expand("C:\\Users\\MM12167\\AppData\\Local\\nvim\\.cache\\dein\\")
        else
            " FTR: let s:plugin_dir = expand("~/.cache/nvim/dein/")
            let s:plugin_dir = expand("~/AppData/Local/nvim/.cache/dein/")
        endif
    elseif exists("g:nyaovim_version")
        let s:dein_cache_path = expand("~/.config/nyaovim/dein")
    endif

    " "dein.vim" ���C���X�g�[������f�B���N�g���������^�C���p�X�֒ǉ�
    if hostname() == "HBAMB748A"
        let s:dein_dir = s:plugin_dir . "repos\\github.com\\Shougo\\dein.vim"
    else
        let s:dein_dir = s:plugin_dir . "repos/github.com/Shougo/dein.vim"
    endif
    execute "set runtimepath+=" . s:dein_dir

    " "dein.vim��" �Ȃ���� "git clone"
    if !isdirectory(s:dein_dir)
        call mkdir(s:dein_dir, "p")
        silent execute printf("!git clone %s %s", "https://github.com/Shougo/dein.vim", s:dein_dir)
    endif
    " REF: < http://yuheikagaya.hatenablog.jp/entry/2016/03/20/171907 >

    " �ݒ�J�n
    if dein#load_state(s:plugin_dir)
        call dein#begin(s:plugin_dir)

        " �v���O�C�����X�g "*.toml" ���w��
        if has("nvim") && hostname() == "HBAMB748A"
            let g:plugin_dir  = expand("C:\\Users\\MM12167\\.vim\\vim_plugins")
            let s:toml        = g:plugin_dir . "\\dein.toml"
            let s:lazy_toml   = g:plugin_dir . "\\dein_lazy.toml"
            let s:python_toml = g:plugin_dir . "\\dein_python.toml"
        else
            let g:plugin_dir  = expand("~/.vim/vim_plugins")
            let s:toml        = g:plugin_dir . "/dein.toml"
            let s:lazy_toml   = g:plugin_dir . "/dein_lazy.toml"
            let s:python_toml = g:plugin_dir . "/dein_python.toml"
        endif

        " "*.toml" ��Ǎ��݁A�L���b�V��
        call dein#load_toml(s:toml,            {"lazy": 0})
        call dein#load_toml(s:lazy_toml,       {"lazy": 1})
        if has ("python3")
            call dein#load_toml(s:python_toml, {"lazy": 0})
        endif

        if exists("g:nyaovim_version")
            call dein#add("rhysd/nyaovim-markdown-preview")
            call dein#add("rhysd/nyaovim-mini-browser")
            " call dein#add("rhysd/nyaovim-popup-tooltip")
        endif

        " �ݒ�I��
        call dein#end()
        call dein#save_state()
    endif

    " ���C���X�g�[���̃v���O�C��������΃C���X�g�[��
    if dein#check_install()
        call dein#install()
    endif
endif
"
" " MEMO:
" " �v���O�C���̒ǉ��E�폜��toml�t�@�C���̐ݒ��ύX�������
" " �K�X "du: call dein#check_update()" �� "dc: call dein#clear_state()" �����s����
" " --------------------------------------------------------------------------------

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
runtime! userautoload/plugin_settings/*.vim
" Yahoo Web API key�i�v���C�x�[�g�L�[)
let g:vimrc_yahoo_web_api_key = {}
if filereadable(expand('~/\OneDrive\�d��\Settings\YahooWebApi\.vimrc_yahoo_web_api_key'))
    execute 'source' expand('~/\OneDrive\�d��\Settings\YahooWebApi\.vimrc_yahoo_web_api_key')
endif

" �ǂݍ��񂾃v���O�C�����܂߁A�t�@�C���^�C�v�̌��o
" �t�@�C���^�C�v�ʃv���O�C��/�C���f���g��L��������
filetype plugin indent on

