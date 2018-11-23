' Created:     201*/**/** **:**:**
' Last Change: 2018/11/23 11:55:11.

' 変数宣言を強制
Option Explicit
On Error Resume Next

Dim shell
Dim env
Dim strEnvName

Set shell = WScript.CreateObject("WScript.Shell")
strEnvName = "C:\%homepath%\dotfiles\.vim\ctags"

Set env = shell.Environment("User")

If instr(env.item("PATH"), strEnvName) = 0 Then
    env.item("PATH") = env.item("PATH") & ";" & strEnvName
    MsgBox env.item("PATH")
Else
    WScript.Echo "Is exist"
End if

Set env  = Nothing
Set shell  = Nothing
