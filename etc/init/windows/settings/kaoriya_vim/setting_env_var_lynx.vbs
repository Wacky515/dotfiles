Dim shell
Set shell = WScript.CreateObject("WScript.Shell")

Dim env
Set env = shell.Environment("USER")

' env.item("PATH") = env.item("PATH") & ";" & "C:\Program Files (x86)\Lynx for Win32"
env.item("PATH") = env.item("PATH") & ";" & "C:%homepath%\Lynx_for_Win32"

MsgBox env.item("PATH")
