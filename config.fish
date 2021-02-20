# Created:     2018/**/** **:**:**
# Last Change: 2020/04/17 23:17:43.

cd ~/dotfiles

# �֐��Q
## �R�}���h�̑��݊m�F
function has
    type "$1" > /dev/null 2>&1
end

# "history" ���t�ǉ�
function history
    builtin history --show-time='%Y/%m/%d %H:%M:%S ' | sort
end

if has "fzf"
    # "fzf" �̌Â��L�[�o�C���h �s�g�p
    set -U FZF_LEGACY_KEYBINDINGS 0
    # "fzf" �ŗ����̓��͗����^�[�~�i���㕔�ɕ\��
    set -U FZF_REVERSE_ISEARCH_OPTS "--reverse --height=100%"
end

if has "peco"
    # "history" �[���ԋ��L
    function peco_sync_select_history
        history-merge
        peco_select_history $argv
    end

    # �L�[�o�C���h
    function fish_user_key_bindings
        bind \cr 'peco_sync_select_history (commandline -b)'
        bind \cr peco_select_history
    end
end

# if has "fuck"
#     thefuck --alias
#     # alias fuck='eval "$(thefuck --alias)"'
#     function fish_user_key_bindings
#         # Bind EscEsc to thefuck
#         bind \e\e 'thefuck-command-line' 
#     end
# end

# FIXME: Windows10�A�C���X�g�[�����s����
function ins_fisher
    if fisher -v > /dev/null 2>&1
        echo ">> Installed fisher"
    else
        echo ">> Install fisher"
        set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
        curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
        # curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
        # curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
        # curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
        fish -c fisher
        fisher add oh-my-fish/theme-bobthefish
        fisher add jethrokuan/fzf
    end
end

# ��L�Əd��  # {{{
# if not functions -q fisher
#     set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
#     curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
#     fish -c fisher
# end
# }}}
# REF: https://github.com/jorgebucaran/fisher

function win_setting
    # ".bashrc" �̓G�C���A�X�ݒ�s��
    alias   vim="~/vim82-kaoriya-win64/vim.exe"
    alias  gvim="~/vim82-kaoriya-win64/gvim.exe"
    alias  nvim="C:/tools/neovim/Neovim/bin/nvim.exe"
    alias gnvim="C:/tools/neovim/Neovim/bin/nvim-qt.exe"
end

# OS �ʐݒ�
switch (uname)
    # "Linux" �p�ݒ�
    case 'Linux*'
        echo ">> Start setting for fish on Linux"
        echo ">> Start setting for fish on Windows Cygwin"
        # ins_fisher

    # "Mac" �p�ݒ�
    case 'Darwin*'
        echo ">> Start setting for fish on Mac"
        set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
        ins_fisher

    # "Windows" �p�ݒ�
    case 'msys'
        echo ">> Start setting for fish on Windows Msys2"
        win_setting

    case 'MSYS_NT*'
        echo ">> Start setting for fish on Windows Msys NT"
        win_setting

    case 'windows*'
        echo ">> Start setting for fish on Windows Cmder & ConEmu"
        win_setting

    case 'MINGW*'
        echo ">> Start setting for fish on Windows Mingw"
        win_setting

    case '*'
        echo ">> [config.fish] < OS type not found"
end
