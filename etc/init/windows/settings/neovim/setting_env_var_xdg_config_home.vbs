' Created:     201*/**/** **:**:**
' Last Change: 2020/10/26 17:46:59.

' 変数宣言を強制
Option Explicit
On Error Resume Next

Dim shell
Dim env
Dim strEnvName

Set shell = WScript.CreateObject("WScript.Shell")
strEnvName = "%USERPROFILE%"

Set env = shell.Environment("USER")

If instr(env.item("XDG_CONFIG_HOME"), strEnvName) = 0 Then
    env.item("XDG_CONFIG_HOME") = env.item("XDG_CONFIG_HOME") & strEnvName
    MsgBox env.item("XDG_CONFIG_HOME")
Else
    WScript.Echo "Already exist"
End if

Set env  = Nothing
Set shell  = Nothing
