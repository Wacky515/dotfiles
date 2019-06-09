# Created:     201*/**/** **:**:**
# Last Change: 2019/06/01 10:09:04.

if [[ `uname` =~ ^(MSYS_NT-|MINGW32_NT-).+$ ]]; then

    # "gitk" は "Windows" 用を使う
    alias gitk="/c/Program\ Files/Git/cmd/gitk"

    # "mintty" が ."bashrc" を読込む設定
    if [[ -f ~/.bashrc ]]; then
        . ~/.bashrc
    fi

    # # "mintty" 用色設定ファイルが存在すれば読込み
    # if [[ -f path/to/sol.dark ]]; then
    #     source path/to/sol.dark
    # fi

else
    # "Mac" 用の条件分岐
    export PATH="/usr/local/sbin:$PATH"

fi

