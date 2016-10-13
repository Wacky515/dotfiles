# Install command
`./link.sh`  
`./link.cmd`

# Layout
~/  
├── dotfiles  
│    ├── README.md  
│    ├── .git  
│    ├── .gitignore  
│    ├── link.sh  
│    ├── link.bat  
│    │  
│    ├── .vim  
│    │     ├──userautoloa		" *.vim files  
│    │     ├──colors			" Color schemer  
│    │     ├──rc				" Plugin(*.toml)  
│    │     ├──templat			" Template files  
│    │     └──tm				" Temporary directory  
│    │  
│    ├── .vimr					" dein.vim setting  
│    └── .gvimrc				" Graphic setting  
│  
│     # Symbolic link  
├── .gitconfig -&gt; /root/dotfiles/.gitconfig  
├── .vim -&gt; /root/dotfiles/.vim  
├── .vimrc -&gt; /root/dotfiles/.vimrc  
└── .gvimrc -&gt; /root/dotfiles/.gvimrc  

# !!!: Must install "Flake8

# TODO: Aautomatically install

# FIXME: Not modfy yet
`$ curl -L raw.github.com/wacky515/dotfiles/master/install.sh | bash`
