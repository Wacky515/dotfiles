Dim shell
Set shell = WScript.CreateObject("WScript.Shell")

Dim env
Set env = shell.Environment("USER")

env.item("PATH") = env.item("PATH") & ";" & "C:%homepath%\vim80-kaoriya-win32"

MsgBox env.item("PATH")
