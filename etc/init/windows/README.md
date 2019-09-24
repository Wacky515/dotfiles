# Initial setting scripts for Windows

## Usage

- Run command below

`mkdir C:%homepath%\init_dotfiles\master\etc\init\windows\settings\initialize & bitsadmin /transfer initWindows https://raw.githubusercontent.com/Wacky515/dotfiles/master/etc/init/windows/settings/initialize/init_dotfiles.cmd C:%homepath%\init_dotfiles\master\etc\init\windows\settings\initialize\init_dotfiles.cmd && cd C:%homepath%\init_dotfiles\master\etc\init\windows\settings\initialize && find <init_dotfiles.cmd /v "hogehogehoge" >init_dotfiles_crlf.cmd && init_dotfiles_crlf.cmd`

## Chocolatey installed list

`clist -l >> *_list.txt`

## Place of Control Panel setting

### All user

`HKEY_USERS\.DEFAULT\Control Panel`

### Current user

`HKEY_CURRENT_USER\Control Panel`
