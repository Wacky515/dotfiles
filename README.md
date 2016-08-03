# Install command
`./link.sh`

# Layout
~/  
├── dotfiles  
│    ├── README.md  
│    ├── .git  
│    ├── .gitignore  
│    ├── link.sh  
│    ├── .vimfiles  
│    ├── .vimrc  
│    └── .gvimrc  
│  
│     # Symbolic link  
├── .vim -&gt; /root/dotfiles/.vim  
├── .vimrc -&gt; /root/dotfiles/.vimrc  
└── .gvimrc -&gt; /root/dotfiles/.gvimrc  

# FIXME: Color scheme directory
Windows:    ~/vimfiles/colors  
Linux/Mac:  ~/.vim/colors/

# FIXME: Not modfy yet
`$ curl -L raw.github.com/wacky515/dotfiles/master/install.sh | bash`
