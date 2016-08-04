# Install command
`./link.sh`

# Layout
~/  
├── dotfiles  
│    ├── README.md  
│    ├── .git  
│    ├── .gitignore  
│    ├── link.sh  
│    ├── link.bat  
│    ├── .vim  
│    │     ├userautoload     # *.vim files
│    │     ├colors           # Color schemer
│    │     └rc               # Plugin(*.tmol)
│    │
│    ├── .vimrc             # dein.vim setting  
│    └── .gvimrc            # Graphic setting  
│  
│     # Symbolic link  
├── .vim -&gt; /root/dotfiles/.vim  
├── .vimrc -&gt; /root/dotfiles/.vimrc  
└── .gvimrc -&gt; /root/dotfiles/.gvimrc  

# TODO: Aautomatically install

# FIXME: Not modfy yet
`$ curl -L raw.github.com/wacky515/dotfiles/master/install.sh | bash`
