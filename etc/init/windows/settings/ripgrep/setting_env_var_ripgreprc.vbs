' Created:     2020/10/30 08:22:07
' Last Change: 2020/10/30 09:19:56.

' 変数宣言を強制
Option Explicit
On Error Resume Next

Dim shell
Dim env
Dim strEnvName

Set shell = WScript.CreateObject("WScript.Shell")
strEnvName = "%USERPROFILE%/.ripgreprc"

Set env = shell.Environment("USER")

If instr(env.item("RIPGREP_CONFIG_PATH"), strEnvName) = 0 Then
    env.item("RIPGREP_CONFIG_PATH") = env.item("RIPGREP_CONFIG_PATH") & strEnvName
    MsgBox env.item("RIPGREP_CONFIG_PATH")
Else
    WScript.Echo "Already exist"
End if

Set env  = Nothing
Set shell  = Nothing
