Dim shell
Set shell = WScript.CreateObject("WScript.Shell")

Dim env
Set env = shell.Environment("USER")

' env.item("PATH") = env.item("PATH") & ";" & "C:%homepath%\graphviz\release\bin\"
env.item("PATH") = env.item("PATH") & ";" & "C:\graphviz\release\bin\"

MsgBox env.item("PATH")
