# Install command
`./link.sh`

# Layout
`
~/
„¥„Ÿ„Ÿ dotfiles
„     „¥„Ÿ„Ÿ README.md
„     „¥„Ÿ„Ÿ link.sh
„     „¥„Ÿ„Ÿ .git
„     „¥„Ÿ„Ÿ .gitignore
„     „¥„Ÿ„Ÿ .vim
„     „¥„Ÿ„Ÿ .vimrc
„     „¤„Ÿ„Ÿ .gvimrc
„ 
„      # Symbolic link
„¥„Ÿ„Ÿ .vim -&gt; /root/dotfiles/.vim
„¥„Ÿ„Ÿ .vimrc -&gt; /root/dotfiles/.vimrc
„¤„Ÿ„Ÿ .gvimrc -&gt; /root/dotfiles/.gvimrc
`

# FIXME: Color scheme directory
Windows:    ~/vimfiles/colors
Linux/Mac:  ~/.vim/colors/

# FIXME: Not modfy yet
`$ curl -L raw.github.com/wacky515/dotfiles/master/install.sh | bash`
