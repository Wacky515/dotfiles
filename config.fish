# Created:     2018/**/** **:**:**
# Last Change: 2023/03/27 03:29:21.

cd ~/dotfiles

# 関数群
## コマンドの存在確認
function has
    type "$1" > /dev/null 2>&1
end

## "history" 日付追加
function history
    builtin history --show-time='%Y/%m/%d %H:%M:%S ' | sort
end

## キーバインド
function fish_user_key_bindings
        bind \cr 'peco_sync_select_history (commandline -b)'
        bind \cr peco_select_history
end

if has "pyenv"
    set PATH ~/.pyenv $PYENV_ROOT
    set PATH $PYENV_ROOT/bin $PATH
    # export PYENV_ROOT="$HOME/.pyenv"
    # export PATH="$PYENV_ROOT/bin:$PATH"
    # # 自動補完 活性化
    # eval "$(pyenv init -)"
    # # "HomeBrew" エラー対策
    # alias brew="env PATH=${PATH~\/\.pyenv\/shims:/} brew"
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
end

# if has "fuck"  # {{{
#     thefuck --alias
#     # alias fuck='eval "$(thefuck --alias)"'
#     function fish_user_key_bindings
#         # Bind EscEsc to thefuck
#         bind \e\e 'thefuck-command-line'
#     end
# end
# }}}

# FIXME: Windows10、インストール失敗する
# FIXME: Fisher インストールコマンドが変更になっている
# FIXME: 長い行の折返し
function ins_fisher
    if fisher -v > /dev/null 2>&1
        echo ">> Installed fisher"
    else
        echo ">> Install fisher"
        set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
        curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
        fish -c fisher
        fisher add oh-my-fish/theme-bobthefish
        fisher add jethrokuan/fzf
    end
end

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
        echo ">> Start setting for fish on Linux"
        echo ">> Start setting for fish on Windows Cygwin"
        # ins_fisher

    # "Mac" 用設定
    case 'Darwin*'
        echo ">> Start setting for fish on Mac"
        set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
        ins_fisher
        # Set PATH, MANPATH, etc., for Homebrew.
        switch (uname -m)
            case 'arm64'
                eval "$(/opt/homebrew/bin/brew shellenv)"
            case 'x86_64'
                eval "$(/usr/local/bin/brew shellenv)"
        end

    # "Windows" 用設定
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
