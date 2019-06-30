# Created:     201*/**/** **:**:**
# Last Change: 2019/06/30 16:00:32.

export PATH="/usr/local/sbin:$PATH"
export PATH=$HOME/.nodebrew/current/bin:$PATH

# FIXME: "Mac" でエラーのためキル
# # "Mac" 用の条件分岐
# if [[ `uname` == 'Darwin' ]]; then
#
#     export PATH="/usr/local/sbin:$PATH"
#
# # "Windows" 用の条件分岐
# elif [[ `uname` =~ ^(MSYS_NT-|MINGW32_NT-).+$ ]]; then
#
#     # "gitk" は "Windows" 用を使う
#     alias gitk="/c/Program\ Files/Git/cmd/gitk"
#
#     # "mintty" が ."bashrc" を読込む設定
#     if [[ -f ~/.bashrc ]]; then
#         # . ~/.bashrc
#         source ~/.bashrc
#     fi
#
#     # # "mintty" 用色設定ファイルが存在すれば読込み
#     # if [[ -f path/to/sol.dark ]]; then
#     #     source path/to/sol.dark
#     # fi
#
# fi
#
