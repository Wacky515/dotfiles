scriptencoding utf-8

" !!!: �K���擪�ɋL�q
" "autocmd"�i�}�N���j �̏�����
augroup MyAutoCmd
    autocmd!
augroup END

"Python3�̃p�X�ݒ�
let g:python3_host_prog = "C:\Python35\python.exe"

if !has("nvim")
" --------------------------------------------------------------------------------
" dein.vim�̐ݒ�
" --------------------------------------------------------------------------------
if !&compatible
    set nocompatible
endif

" Vim�N���������ɃC���X�g�[��
augroup PluginInstall
    autocmd!
    autocmd VimEnter * if dein#check_install() | call dein#install() | endif
augroup END

" �v���O�C�����C���X�g�[������f�B���N�g��
let s:plugin_dir = expand("~/.cache/dein/")

" "dein.vim" ���C���X�g�[������f�B���N�g���������^�C���p�X�֒ǉ�
let s:dein_dir = s:plugin_dir . "repos/github.com/Shougo/dein.vim"
execute "set runtimepath+=" . s:dein_dir

" dein.vim�������Ă��Ȃ���� "git clone"
if !isdirectory(s:dein_dir)
    call mkdir(s:dein_dir, "p")
    silent execute printf("!git clone %s %s", "https://github.com/Shougo/dein.vim", s:dein_dir)
endif
" < http://yuheikagaya.hatenablog.jp/entry/2016/03/20/171907 >

" �ݒ�J�n
if dein#load_state(s:plugin_dir)
    call dein#begin(s:plugin_dir)

    " �v���O�C�����X�g "*.toml" ���w��
    let g:rc_dir      = expand("~/.vim/rc")
    let s:toml        = g:rc_dir . "/dein.toml"
    let s:lazy_toml   = g:rc_dir . "/dein_lazy.toml"
    let s:python_toml = g:rc_dir . "/dein_python.toml"

    " "*.toml" ��Ǎ��݁A�L���b�V��
    call dein#load_toml(s:toml,            {"lazy": 0})
    call dein#load_toml(s:lazy_toml,       {"lazy": 1})
    if has ('python3')
        call dein#load_toml(s:python_toml, {"lazy": 0})
    endif

    " �ݒ�I��
    call dein#end()
    call dein#save_state()
endif

" ���C���X�g�[��������΃C���X�g�[��
if dein#check_install()
    call dein#install()
endif

" MEMO:
" �v���O�C���̒ǉ��E�폜��toml�t�@�C���̐ݒ��ύX�������
" �K�X "du: call dein#update()" �� "dc: call dein#clear_state()" �����s����
" --------------------------------------------------------------------------------
endif

" Init����
" Windows���̐ݒ�t�@�C���̏ꏊ���AMac/Linux���ɂ��킹��
set runtimepath+=$HOME/.vim

" "Vim" �̐ݒ�t�@�C��
runtime! userautoload/*.vim
" "Plugin" �̐ݒ�t�@�C��
runtime! userautoload/plugin_setting/*.vim

" <Space> �� "Leader" �Ɋ�����
let mapleader = "\<Space>"

" �ǂݍ��񂾃v���O�C�����܂߁A�t�@�C���^�C�v�̌��o
" �t�@�C���^�C�v�ʃv���O�C��/�C���f���g��L��������
filetype plugin indent on