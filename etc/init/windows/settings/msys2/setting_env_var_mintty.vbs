Dim shell
Set shell = WScript.CreateObject("WScript.Shell")

Dim env
Set env = shell.Environment("USER")

env.item("HOME") = "%HOMEPATH%"

MsgBox env.item("HOME")
