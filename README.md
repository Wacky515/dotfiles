# Install command
`./link.sh`  
`./link.bat`

# Layout
~/  
├── dotfiles  
│    ├── README.md  
│    ├── .git  
│    ├── .gitconfig  
│    ├── .gitignore  
│    ├── link.sh  
│    ├── link.bat  
│    │  
│    ├── .vim  
│    │     ├──userautoloa		# *.vim files  
│    │     ├──colors			# Color schemer  
│    │     ├──rc				# Plugin(*.toml)  
│    │     ├──templat			# Template files  
│    │     └──tm				# Temporary directory  
│    │  
│    ├── .vimr					# dein.vim setting  
│    └── .gvimrc				# Graphic setting  
│  
│     # Symbolic link  
├── .vim -&gt; /root/dotfiles/.vim  
├── .vimrc -&gt; /root/dotfiles/.vimrc  
└── .gvimrc -&gt; /root/dotfiles/.gvimrc  

# TODO: Aautomatically install

# FIXME: Not modfy yet
`$ curl -L raw.github.com/wacky515/dotfiles/master/install.sh | bash`
