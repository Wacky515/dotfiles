Dim shell
Set shell = WScript.CreateObject("WScript.Shell")

Dim env
Set env = shell.Environment("USER")

' TEST: OSビット数で条件分け
osbits = GetObject("winmgmts:root\cimv2:Win32_Processor='cpu0'").AddressWidth


If osbits = 64 Then
    ' MsgBox "This OS is " & osbits & "bit"
    ' env.item("PATH") = env.item("PATH") & ";" & "C:%homepath%\vim80-kaoriya-win64"
    env.item("PATH") = env.item("PATH") & ";" & "C:%homepath%\vim81-kaoriya-win64"

ElseIf osbits = 32 Then
    ' MsgBox "This OS is " & osbits & "bit"
    ' env.item("PATH") = env.item("PATH") & ";" & "C:%homepath%\vim80-kaoriya-win32"
    env.item("PATH") = env.item("PATH") & ";" & "C:%homepath%\vim81-kaoriya-win32"
Else
    MsgBox "Invalid OS bit"
End If

MsgBox env.item("PATH")
