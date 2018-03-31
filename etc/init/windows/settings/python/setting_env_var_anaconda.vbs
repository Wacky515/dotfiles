Dim shell
Set shell = WScript.CreateObject("WScript.Shell")

Dim env
Set env = shell.Environment("USER")

env.item("PATH") = env.item("PATH") & ";" & "C:\Python35" & ";" & "C:\Python35\Scripts\"
' env.item("PYTHONHOME") = "C:\tools\Anaconda3\pkgs\python-3.5.4-h1357f44_23"
' env.item("PYTHONPATH") = "%PYTHONHOME%" & "\libs"

MsgBox env.item("PATH")
