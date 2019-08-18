# Initial setting scripts for Windows

## Usage

- Run command below ***as Administrator***

`@echo off&setlocal enabledelayedexpansion&set init_path=C:%homepath%\dotfiles\master\etc\init\windows\settings\initialize&if not exist !init_path! (mkdir !init_path!) else (echo '>'> Already exist folder) & bitsadmin /transfer initWindows https://raw.githubusercontent.com/Wacky515/dotfiles/master/etc/init/windows/settings/initialize/init_dotfiles.cmd !init_path!/init_dotfiles.cmd && cd !init_path! && init_dotfiles.cmd`

## Windows install list

`clist -l >> *_list.txt`

## Control Panel setting

### All user

`HKEY_USERS\.DEFAULT\Control Panel`

### Current user

`HKEY_CURRENT_USER\Control Panel`
