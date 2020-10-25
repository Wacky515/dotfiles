' Created:     201*/**/** **:**:**
' Last Change: 2018/12/04 08:27:53.

' 変数宣言を強制
Option Explicit
On Error Resume Next

Dim shell
Dim env
Dim strEnvName

Set shell = WScript.CreateObject("WScript.Shell")
strEnvName = "%USERPROFILE%"

Set env = shell.Environment("USER")

If instr(env.item("HOME"), strEnvName) = 0 Then
    env.item("HOME") = env.item("HOME") & ";" & strEnvName
    MsgBox env.item("HOME")
Else
    WScript.Echo "Already exist"
End if

Set env  = Nothing
Set shell  = Nothing
