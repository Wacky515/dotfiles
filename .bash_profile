# "mintty" が ."bashrc" を読込む設定
if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi

# "ls" で日本語ファイル名文字化け防止
alias ls='ls --show-control-chars'
