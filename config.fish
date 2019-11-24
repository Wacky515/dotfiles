# Created:     2018/**/** **:**:**
<<<<<<< HEAD
# Last Change: 2019/11/17 15:48:31.
=======
# Last Change: 2019/11/20 17:32:35.
>>>>>>> ab56cac1b5bfb4aab2195a6347dcb44edcda61c7

function has
    type "$1" > /dev/null 2>&1
end

# "history" の表示に日付を追加する
function history
    builtin history --show-time='%Y/%m/%d %H:%M:%S ' | sort
end

if has "fzf"
    # "fzf" で古いキーバインドを使用しない
    set -U FZF_LEGACY_KEYBINDINGS 0
    # "fzf" で履歴の入力欄をターミナル上部に表示
    set -U FZF_REVERSE_ISEARCH_OPTS "--reverse --height=100%"
end

if has "peco"
    # history を複数端末間で共有
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

# FIXME: Windows10、インストール失敗する
function ins_fisher
    if ! has "fisher"
        echo ">> Install fisher"
        curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
        # curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
    end
end

function win_setting
    # エイリアスは ".bashrc" では設定できない
    alias   vim="~/vim81-kaoriya-win64/vim.exe"
    alias  gvim="~/vim81-kaoriya-win64/gvim.exe"
    alias  nvim="C:/tools/neovim/Neovim/bin/nvim.exe"
    alias gnvim="C:/tools/neovim/Neovim/bin/nvim-qt.exe"
end

# OS 別設定
switch (uname)
    # "Linux" 用設定
    case 'Linux*'
        echo ">> Setting for Linux fish"
        ins_fisher

    # "Mac" 用設定
    case 'Darwin*'
<<<<<<< HEAD
        echo ">> Seting for Mac fish"
        set -g fish_user_path "/usr/local/sbin" $fish_user_path
=======
        echo ">> Setting for Mac fish"
        ins_fisher
>>>>>>> ab56cac1b5bfb4aab2195a6347dcb44edcda61c7

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
