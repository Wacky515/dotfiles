# Initial setting scripts for Windows

## Usage

- Run command below

`bitsadmin /transfer initWindows https://raw.githubusercontent.com/Wacky515/dotfiles/master/etc/init/windows/settings/chocolatey/init_and_update_chocolatey.cmd C:\Temp\init_and_update_chocolatey.cmd`

## Windows install list

`clist -l >> *_list.txt`

## Control Panel setting

### All user

`HKEY_USERS\.DEFAULT\Control Panel`

### Current user

`HKEY_CURRENT_USER\Control Panel`
