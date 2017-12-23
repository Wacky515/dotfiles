Dim shell
Set shell = WScript.CreateObject("WScript.Shell")

Dim env
Set env = shell.Environment("USER")

env.item("PATH") = env.item("PATH") & ";" & "C:\Program Files\Typora\Typora.exe"

MsgBox env.item("PATH")
