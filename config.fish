# Created:     2018/**/** **:**:**
# Last Change: 2019/11/11 14:45:12.

# history の表示に日付を追加する
function history
    builtin history --show-time='%Y/%m/%d %H:%M:%S ' | sort
end

# history を複数端末間で共有
function peco_sync_select_history
    history-merge
    peco_select_history $argv
end

function fish_user_key_bindings
    bind \cr 'peco_sync_select_history (commandline -b)'
    bind \cr peco_select_history
end

# "fzf" で古いキーバインドを使用しない
set -U FZF_LEGACY_KEYBINDINGS 0
# "fzf" で履歴の入力欄をターミナル上部に表示
set -U FZF_REVERSE_ISEARCH_OPTS "--reverse --height=100%"

## OS 別設定
switch (uname)
    case 'Linux*'
        # "Linux" 用設定
        echo ">> Seting for Linux fish"

    case 'Darwin*'
        # "Mac" 用設定
        echo ">> Seting for Mac fish"

    case 'MSYS_NT*'
        # "Windows" 用設定
        echo ">> Seting for Windows fish"

        # エイリアスは ".bashrc" では設定できない
        alias vim="~/vim81-kaoriya-win64/vim.exe"
        alias gvim="~/vim81-kaoriya-win64/gvim.exe"
        alias nvim="C:/tools/neovim/Neovim/bin/nvim.exe"
        alias gnvim="C:/tools/neovim/Neovim/bin/nvim-qt.exe"

        # if ! has "fisher"; then
        #     curl https://git.io/fisher \
        #         --create-dirs -sLo \
        #         ‾/.config/fish/functions/fisher.fish
        # fi

    case '*'
        echo ">> OS type not found(config.fish)"

end
