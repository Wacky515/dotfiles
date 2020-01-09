Dim shell
Set shell = WScript.CreateObject("WScript.Shell")

Dim env
Set env = shell.Environment("USER")

env.item("PATH") = env.item("PATH") & ";" & "C:\tools\neovim\Neovim\bin"
env.item("XDG_CONFIG_HOME") = "%USERPROFILE%"

MsgBox env.item("PATH")
MsgBox env.item("XDG_CONFIG_HOME")
