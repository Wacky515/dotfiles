# Initial setting scripts for Windows

## Usage

- Run command below

`bitsadmin /transfer test https://github.com/Wacky515/dotfiles/blob/master/etc/init/windows/settings/chocolatey/init_and_update_chocolatey.cmd C:%homepath%\init_and_update_chocolatey.cmd`

## Windows install list

`clist -l >> *_list.txt`

## Control Panel setting

### All user

`HKEY_USERS\.DEFAULT\Control Panel`

### Current user

`HKEY_CURRENT_USER\Control Panel`
