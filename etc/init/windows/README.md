# Initial setting scripts for Windows

## NOTE

- DO NOT EXECUTE WITH SYNLINKED, VANISH DOTFILES 

## Usage

- Run command below

`rmdir /s /q %userprofile%\dotfiles > nul 2>&1 & rmdir /s /q %userprofile%\init_dotfiles\ & mkdir %userprofile%\init_dotfiles\master\etc\init\windows\settings\initialize & bitsadmin /transfer initWindows https://raw.githubusercontent.com/Wacky515/dotfiles/master/etc/init/windows/settings/initialize/init_dotfiles.cmd %userprofile%\init_dotfiles\master\etc\init\windows\settings\initialize\init_dotfiles.cmd && cd %userprofile%\init_dotfiles\master\etc\init\windows\settings\initialize && find <init_dotfiles.cmd /v "hogehogehoge" >init_dotfiles_crlf.cmd && init_dotfiles_crlf.cmd`
