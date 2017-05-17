Dim shell
Set shell = WScript.CreateObject("WScript.Shell")

Dim env
Set env = shell.Environment("USER")

env.item("PATH") = env.item("PATH") & ";" & "C:%homepath%\dotfiles\.vim\ctags"

MsgBox env.item("PATH")