# Initial setting scripts for Windows

## Usage

- Run command below

`(if not exist C:%homepath%\dotfiles\master\etc\init\windows\settings\initialize\init_dotfiles.cmd (mkdir C:%homepath%\dotfiles\master\etc\init\windows\settings\initialize & bitsadmin /transfer initWindows https://raw.githubusercontent.com/Wacky515/dotfiles/master/etc/init/windows/settings/initialize/init_dotfiles.cmd C:%homepath%\dotfiles\master\etc\init\windows\settings\initialize/init_dotfiles.cmd) else (echo ^>^> Already exist folder)) & cd C:%homepath%\dotfiles\master\etc\init\windows\settings\initialize & init_dotfiles.cmd`

## Windows install list

`clist -l >> *_list.txt`

## Control Panel setting

### All user

`HKEY_USERS\.DEFAULT\Control Panel`

### Current user

`HKEY_CURRENT_USER\Control Panel`
