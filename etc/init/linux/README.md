# Test setting scripts for Linux

## Usage

- Run command below

| Tool  | OS     | Command                                                                                                                         |
| ----- | ------ | ------------------------------------------------------------------------------------------------------------------------------- |
| cURL  | \*\*\* | bash -c "\$(curl -fsSL https://raw.githubusercontent.com/Wacky515/dotfiles/master/etc/test/linux/make_dotfiles.sh)"             | tee ~/make_dotfiles.log |
| Wget1 | \*\*\* | bash -c "\$(wget -qO - https://raw.githubusercontent.com/Wacky515/dotfiles/master/etc/test/linux/make_dotfiles.sh &#124; bash)" | tee ~/make_dotfiles.log |
| Wget2 | Ubuntu | bash -c "\$(wget -qO - https://raw.githubusercontent.com/Wacky515/dotfiles/master/etc/test/linux/make_dotfiles.sh)"             | tee ~/make_dotfiles.log |
