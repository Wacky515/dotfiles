Dim shell
Set shell = WScript.CreateObject("WScript.Shell")

Dim env
Set env = shell.Environment("USER")

env.item("PATH") = env.item("PATH") & ";" & "C:\tools\neovim\Neovim\bin"

MsgBox env.item("PATH")
