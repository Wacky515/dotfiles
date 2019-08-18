# Initial setting scripts for Windows

## Usage

- Run command below ***as Administrator***

`if not exist C:%homepath%\dotfiles\master\etc\init\windows\settings\initialize (mkdir C:%homepath%\dotfiles\master\etc\init\windows\settings\initialize) else (echo '>'> Already exist folder) && bitsadmin /transfer initWindows https://raw.githubusercontent.com/Wacky515/dotfiles/master/etc/init/windows/settings/initialize/init_dotfiles.cmd C:%homepath%\dotfiles\master\etc\init\windows\settings\initialize/init_dotfiles.cmd && cd C:%homepath%\dotfiles\master\etc\init\windows\settings\initialize && init_dotfiles.cmd`

## Windows install list

`clist -l >> *_list.txt`

## Control Panel setting

### All user

`HKEY_USERS\.DEFAULT\Control Panel`

### Current user

`HKEY_CURRENT_USER\Control Panel`
