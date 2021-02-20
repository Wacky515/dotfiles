scriptencoding utf-8
" Created:     2016/08/03 **:**:**
" Last Change: 2021/01/15 15:58:03.

" ----------------------------------------------------------------------
" �O�σe�[�}��
" ----------------------------------------------------------------------
" �J���[�X�L�[�}�̎w��
" MEMO: "Dein" �ɈڊǍς�
" MEMO: �s��̂��߂�����̋L�q�ɖ߂���
set termguicolors
set background=dark
au MyAutoCmd VimEnter * nested colorscheme iceberg
au MyAutoCmd VimEnter * highlight Visual ctermbg=216

" "Kaoriya GVim" �p �폜���Ȃ��I�I�I
" �R�}���h���C���i"Vim" ��ʉ����j����
set cmdheight=5

if (has("win32") || ("win64"))
    " ���j���[�o�[ �\��
    set guioptions+=m
else
    " ���j���[�o�[ ��\��
    set guioptions-=m
endif
" �c�[���o�[ ��\��
set guioptions-=T
" �����X�N���[���o�[ �\��
set guioptions+=b


" �E�B���h�E ���������i"Linux" �� "Vim" ����ݒ�ł��Ȃ��j
" if has("mac")
if has("unix")
    if !has("nvim")
        set transparency=10
    endif
elseif (has("win32") || ("win64"))
    :autocmd GUIEnter * set transparency=235
endif

" ���b�Z�[�W ���������΍�
if (has("win32") || ("win64"))
    source $VIMRUNTIME/delmenu.vim
    set langmenu=ja_jp.utf-8
    source $VIMRUNTIME/menu.vim
endif

" �t�@�C���^�C�v�n�n�C���C�g�v���O�C���𓱓����Ă���ꍇ  " {{{
" syntax on" �͌��݂�runtimepath�Ɋ܂܂�Ă���ݒ�����ƂɃV���^�b�N�X�𐶐�����
" runtimepath������������悤�ȏ������������syntax on���Ă����܂�Ӗ��͂Ȃ�
" runtimepath�����ׂĐݒ肵�I�������syntax on������ׂ�
" �����p�^�[��
" runtimepath������������悤�ȏ���
" set runtimepath=$VIMRUNTIME
" syntax on
" �t�@�C���^�C�v�n�n�C���C�g�v���O�C��
" neoBundle 'kongo2002/fsharp-vim'
" �ǂ��p�^�[��
" runtimepath������������悤�ȏ���
" set runtimepath=$VIMRUNTIME
" �t�@�C���^�C�v�n�n�C���C�g�v���O�C��
" neoBundle 'kongo2002/fsharp-vim'
" syntax on
" }}}

" "NyaoVim" �p�ݒ�
if exists("g:nyaovim_version")
    let s:plugin_dir = expand("~/.config/nyaovim/dein")
    try
        if s:on_nyaovim || s:true_color_enabled
            colorscheme iceberg
            " colorscheme spring-night
            " let g:airline_theme = "spring_night"
        else
            colorscheme wallaby
            let g:airline_theme = "wombat"
        endif
    catch
        set background=dark
        colorscheme default
    endtry
endif

" REF: "Oni" �p�ݒ�
" if exists("g:gui_oni")
"     echo Setting for Oni
" endif

" !!!: �ȉ�����͋L�q�ꏊ�����Ԃ�ς��Ȃ��I�I�I
" !!!: "NeoVim" �̃t�H���g�ݒ�� "ginit.vim" �ɋL�q�I�I
" �t�H���g�̐ݒ�
if !has("nvim")
    if (has("unix") && !has("mac"))
        set   guifont=Cica\ 16
        set printfont=Cica\ 16
        " colorscheme iceberg

    elseif has("mac")
        if hostname()     == "ProSalad13-2018.local"
            " set   guifont=HackGenNerd\ Console\ Regular:h15
            " set printfont=HackGenNerd\ Console\ Regular:h15
            set   guifont=Cica:h16
            set printfont=Cica:h16
        elseif hostname() == "saladserver.com"
            set   guifont=Cica:h18
            set printfont=Cica:h18
        elseif hostname() == "SaladBook.local"
            set   guifont=Cica:h16
            set printfont=Cica:h16
        elseif hostname() == "ProSalad13.local"
            set   guifont=Cica:h16
            set printfont=Cica:h16
        else
            set   guifont=Cica:h16
            set printfont=Cica:h16
        endif
        " colorscheme iceberg

    elseif has("unix")
        set   guifont=Cica\ 16
        set printfont=Cica\ 16

    elseif (has("win32") || has("win64"))
        " Home setting
        if hostname()     == "SALADPRIMEMK-II"
            set   guifont=Cica:h12
            set printfont=Cica:h12
            " Windows Cica ��p�ݒ� ("NeoVim" �Őݒ�T���j
            set renderoptions=type:directx,renmode:5
        elseif hostname() == "SALADCARBONX1"
            set   guifont=Cica:h13
            set printfont=Cica:h13
            set renderoptions=type:directx,renmode:5
        elseif hostname() == "SALADSURFACEGO"
            set   guifont=Cica:h13
            set printfont=Cica:h13
            set renderoptions=type:directx,renmode:5

        " muRata setting
        elseif hostname() == "HBAMB1448"
            set   guifont=Cica:h15
            set printfont=Cica:h15
            set renderoptions=type:directx,renmode:5
        elseif hostname() == "HBAPC511"
            set   guifont=Cica:h15
            set printfont=Cica:h15
            set renderoptions=type:directx,renmode:5
        elseif hostname() == "HBAMB748"
            set   guifont=Cica:h15
            set printfont=Cica:h15
            set renderoptions=type:directx,renmode:5
        elseif hostname() == "HBAMB748A"
            set   guifont=Cica:h15
            set printfont=Cica:h15
            set renderoptions=type:directx,renmode:5
        elseif hostname() == "HBALT071"
            set   guifont=Cica:h11
            set printfont=Cica:h11
            set renderoptions=type:directx,renmode:5
        elseif hostname() == "MECSI"
            set   guifont=Cica:h11
            set printfont=Cica:h11
            set renderoptions=type:directx,renmode:5
        elseif hostname() == "LAPTOP-DOA35GAR"
            set   guifont=Cica:h11
            set printfont=Cica:h11
            set renderoptions=type:directx,renmode:5
        elseif hostname() == "HBAMB819"
            set   guifont=Cica:h12
            set printfont=Cica:h12
            set renderoptions=type:directx,renmode:5
        elseif hostname() == "SMM0761"
            set   guifont=Cica:h12
            set printfont=Cica:h12
            set renderoptions=type:directx,renmode:5
        elseif hostname() == "SMM1319"
            set   guifont=Cica:h12
            set printfont=Cica:h12
            set renderoptions=type:directx,renmode:5
        elseif hostname() == "SMM1380"
            set   guifont=Cica:h12
            set printfont=Cica:h12
            set renderoptions=type:directx,renmode:5
        elseif hostname() == "SMM1496"
            set   guifont=Cica:h12
            set printfont=Cica:h12
            set renderoptions=type:directx,renmode:5
        elseif hostname() == "mmctosmm"
            set   guifont=Cica:h14
            set printfont=Cica:h14
            set renderoptions=type:directx,renmode:5

        " Xacti setting  " {{{
        elseif hostname() == "CAD0021"
            set guifont=Ricty_Diminished:h16
        elseif hostname() == "PC-SA4110204580"
            set guifont=Ricty_Diminished:h12
        elseif hostname() == "NOT0053"
            set guifont=Ricty_Diminished:h12
        " }}}

        else
            set guifont=Meiryo_UI:h18
            set renderoptions=type:directx,renmode:5
        endif
    endif
endif
