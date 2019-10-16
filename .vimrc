scriptencoding utf-8
" Created:     2016/07/31 **:**:**
" Last Change: 2019/10/15 11:52:35.

" NOT_WORK:
" " "Macvim" �� "Python3" ���ďo���iPython2�ƕ��p�s�̂��߁j " {{{
" if (has("mac") && has("kaoriya"))
"     if has('python3')
"     endif
" endif
" }}}

let g:deoplete#enable_at_startup = 1

" MEMO: �K���擪�ɋL�q
" "autocmd" �i�}�N���j�̏�����
augroup MyAutoCmd
    autocmd!
augroup END

" "vimproc" �Ǎ��ݎ��A"*.dll" ����DL & �X�V
let g:vimproc#download_windows_dll = 1

" "Python" �̃p�X�ݒ�
if hostname()     == "ProSalad133-2018.local"
    let g:python3_host_prog = "/usr/local/bin/Python3"
elseif hostname() == "ProSalad133.local"
    let g:python3_host_prog = "/usr/local/bin/Python3"
elseif hostname() == "SaladBook.local"
    let g:python3_host_prog = "/usr/local/bin/Python3"
elseif hostname() == "HBAMB748"
    let g:python_host_prog  = "C:\\Python27\\python.exe"
    let g:python3_host_prog = "C:\\tools\\miniconda3\\python.exe"
    if !has("nvim")
<<<<<<< HEAD
        " "HBAMB748" "Vim" で "Unkwown option" エラー
=======
        " "HBAMB748" "vim" �Ŗ��m "Unkwown option" �G���[
>>>>>>> a4a959633a31f47eb16871ff4f74d65f4c142a7d
        if has("gui_running")
            set pythonthreedll=C:\Python36\python36.dll
        else
            let g:python3_host_prog = "C:\\tools\\miniconda3\\python.exe"
        endif
    endif
elseif hostname() ==  "HBAMB748A"
    let g:python_host_prog  = "C:\\Python27\\python.exe"
    let g:python3_host_prog = "C:\\Python35\\python.exe"
elseif hostname() ==  "HBAMB819"
    let g:python_host_prog  = "C:\\Python27\\python.exe"
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
" dein.vim�̐ݒ�
" ---------------------------------------------------------------------------
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
elseif exists("g:nyaovim_version")
    let s:plugin_dir = expand("~/.config/nyaovim/dein")
elseif exists("g:gui_oni")
    let s:plugin_dir = expand("~/.config/oni/dein")
elseif has("nvim")
    if has("unix")
        let s:plugin_dir     = expand("~/.config/nvim/.cache/dein/")
    elseif (has("win32") || has("win64"))
        if hostname()     == "HBAMB748"
            let s:plugin_dir = expand("~\\.config\\nvim\\.cache\\dein\\")
        elseif hostname() == "HBAMB748A"
            let s:plugin_dir = expand("~\\.config\\nvim\\.cache\\dein\\")
        elseif hostname() == "HBAMB819"
            let s:plugin_dir = expand("~\\.config\\nvim\\.cache\\dein\\")
        else
            let s:plugin_dir = expand("~\\.config\\nvim\\.cache\\dein\\")
        endif
    endif
endif

" TODO: Unix�n�̃p�X�ݒ�ǉ�
" "dein.vim" ���C���X�g�[������f�B���N�g���������^�C���p�X�֒ǉ�
if !has("nvim")
    let s:dein_dir     = s:plugin_dir . "repos/github.com/Shougo/dein.vim"
elseif has("nvim")
    if (has("win32") || has("win64"))
        let s:dein_dir = s:plugin_dir . "repos\\github.com\\Shougo\\dein.vim"
    else
        let s:dein_dir = s:plugin_dir . "repos/github.com/Shougo/dein.vim"
    endif
endif
execute "set runtimepath+=" . s:dein_dir

" ���O�o��
let g:dein#install_log_filename = s:dein_dir . "/dein.log"

" "dein.vim" ���Ȃ���� "git clone"
if !isdirectory(s:dein_dir)
    call mkdir(s:dein_dir, "p")
    silent execute printf("!git clone %s %s", "https://github.com/Shougo/dein.vim", s:dein_dir)
endif
" REF: < http://yuheikagaya.hatenablog.jp/entry/2016/03/20/171907 >

" �ݒ�J�n
if dein#load_state(s:plugin_dir)
    call dein#begin(s:plugin_dir)

    " �v���O�C�����X�g "*.toml" ���w��
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

    "*.toml" ��Ǎ��݁A�L���b�V��
    if !has("nvim")
        call dein#load_toml(s:toml,             {"lazy": 0})
        call dein#load_toml(s:lazy_toml,        {"lazy": 1})
        if has ("python3")
            call dein#load_toml(s:python_toml,  {"lazy": 1})
        endif
    endif
    call dein#load_toml(s:toml_nvim,            {"lazy": 0})
    call dein#load_toml(s:lazy_toml_nvim,       {"lazy": 1})
    if has ("python3")
        call dein#load_toml(s:python_toml_nvim, {"lazy": 1})
    endif

    if exists("g:nyaovim_version")
        call dein#add("rhysd/nyaovim-markdown-preview")
        call dein#add("rhysd/nyaovim-popup-tooltip")
        call dein#add("rhysd/nyaovim-mini-browser")
    endif

    " �ݒ�I��
    call dein#end()
    call dein#save_state()
endif

" ���C���X�g�[���̃v���O�C��������΃C���X�g�[��
if has("vim_starting") && dein#check_install()
    call dein#install()
endif

" MEMO:
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
if !has("nvim")
    runtime! userautoload/plugin_settings/*.vim
    runtime! userautoload/plugin_settings_nvim/*.vim
else
    runtime! userautoload/plugin_settings_nvim/*.vim
endif

" �ǂݍ��񂾃v���O�C�����܂߁A�t�@�C���^�C�v�̌��o
" �t�@�C���^�C�v�ʃv���O�C��/�C���f���g��L��������
filetype plugin indent on
