' Created:     201*/**/** **:**:**
' Last Change: 2018/11/23 12:01:54.

' 変数宣言を強制
Option Explicit
On Error Resume Next

Dim shell
Dim env
Dim strEnvName

Set shell = WScript.CreateObject("WScript.Shell")
strEnvName = "%HOMEPATH%"

Set env = shell.Environment("User")

If instr(env.item("HOME"), strEnvName) = 0 Then
    env.item("HOME") = env.item("HOME") & ";" & strEnvName
    MsgBox env.item("HOME")
Else
    WScript.Echo "Is exist"
End if

Set env  = Nothing
Set shell  = Nothing
