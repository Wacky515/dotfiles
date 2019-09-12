# Initial setting scripts for Windows

## Usage

- Run command below

`rmdir /s /q C:%homepath%\dotfiles\master\etc\init\windows\settings\initialize >nul 2>&1 & mkdir C:%homepath%\dotfiles\master\etc\init\windows\settings\initialize & bitsadmin /transfer initWindows https://raw.githubusercontent.com/Wacky515/dotfiles/master/etc/init/windows/settings/initialize/init_dotfiles.cmd C:%homepath%\dotfiles\master\etc\init\windows\settings\initialize\init_dotfiles.cmd && cd C:%homepath%\dotfiles\master\etc\init\windows\settings\initialize && init_dotfiles.cmd`

## Chocolatey installed list

`clist -l >> *_list.txt`

## Place of Control Panel setting

### All user

`HKEY_USERS\.DEFAULT\Control Panel`

### Current user

`HKEY_CURRENT_USER\Control Panel`
