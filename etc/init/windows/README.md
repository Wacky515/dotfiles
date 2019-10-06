# Initial setting scripts for Windows

## Usage

- Run command below

`rmdir /s /q C:%homepath%\dotfiles > nul 2>&1 & rmdir /s /q C:%homepath%\init_dotfiles\ & mkdir C:%homepath%\init_dotfiles\master\etc\init\windows\settings\initialize & bitsadmin /transfer initWindows https://raw.githubusercontent.com/Wacky515/dotfiles/master/etc/init/windows/settings/initialize/init_dotfiles.cmd C:%homepath%\init_dotfiles\master\etc\init\windows\settings\initialize\init_dotfiles.cmd && cd C:%homepath%\init_dotfiles\master\etc\init\windows\settings\initialize && find <init_dotfiles.cmd /v "hogehogehoge" >init_dotfiles_crlf.cmd && init_dotfiles_crlf.cmd`
