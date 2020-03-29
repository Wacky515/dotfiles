# Created:     2018/**/** **:**:**
# Last Change: 2020/03/28 22:00:44.

# 関数群
# コマンドの存在確認
function has
    type "$1" > /dev/null 2>&1
end

# "history" 日付追加
function history
    builtin history --show-time='%Y/%m/%d %H:%M:%S ' | sort
end

if has "fzf"
    # "fzf" の古いキーバインド 不使用
    set -U FZF_LEGACY_KEYBINDINGS 0
    # "fzf" で履歴の入力欄をターミナル上部に表示
    set -U FZF_REVERSE_ISEARCH_OPTS "--reverse --height=100%"
end

if has "peco"
    # "history" 端末間共有
    function peco_sync_select_history
        history-merge
        peco_select_history $argv
    end

    # キーバインド
    function fish_user_key_bindings
        bind \cr 'peco_sync_select_history (commandline -b)'
        bind \cr peco_select_history
    end
end

if has "fuck"
    thefuck --alias
    # alias fuck='eval "$(thefuck --alias)"'
    function fish_user_key_bindings
        # Bind EscEsc to thefuck
        bind \e\e 'thefuck-command-line' 
    end
end

# FIXME: Windows10、インストール失敗する
# function ins_fisher  # {{{
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
# end
# }}}

# 上記と重複
# if not functions -q fisher
#     set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
#     curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
#     fish -c fisher
# end
# REF: https://github.com/jorgebucaran/fisher

function win_setting
    # ".bashrc" はエイリアス設定不可
    alias   vim="~/vim82-kaoriya-win64/vim.exe"
    alias  gvim="~/vim82-kaoriya-win64/gvim.exe"
    alias  nvim="C:/tools/neovim/Neovim/bin/nvim.exe"
    alias gnvim="C:/tools/neovim/Neovim/bin/nvim-qt.exe"
end

# OS 別設定
switch (uname)
    # "Linux" 用設定
    case 'Linux*'
        echo ">> Setting for Linux fish"
        # ins_fisher

    # "Mac" 用設定
    case 'Darwin*'
        echo ">> Seting for Mac fish"
        set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

    # "Windows" 用設定
    case 'MSYS_NT*'
        echo ">> Setting for fish on Windows Msys2"
        win_setting

    case 'MINGW*'
        echo ">> Setting for fish on Windows Mingw"
        win_setting

    case 'windows*'
        echo ">> Setting for fish on Windows Cmder & ConEmu"
        win_setting

    case '*'
        echo ">> OS type not found(config.fish)"
end
