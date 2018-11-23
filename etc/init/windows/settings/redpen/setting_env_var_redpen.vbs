' Created:     2018/10/04 11:19:01
' Last Change: 2018/10/04 12:12:38.

' 変数宣言を強制
Option Explicit
On Error Resume Next

Dim shell
Dim env
Dim strEnvName

Set shell = WScript.CreateObject("WScript.Shell")
strEnvName = "C:\%homepath%\redpen-distribution-1.10.1\bin"

Set env = shell.Environment("User")
    ' If Err.Number = 0 Then  ' {{{
    '     ' strEnvName = "TESTENV"
    '     ' strEnvName = "C:%homepath%\redpen-distribution-1.10.1\bin"
    '     env.Remove(strEnvName)
    '     ' WScript.Echo "環境変数 " & strEnvName & " を削除しました。"
    '     WScript.Echo "Dell"
    ' ' Else
    '     ' WScript.Echo "エラー: " & Err.Description
    ' End If
' env.item("PATH") = env.item("PATH") & ";" & strEnvName &
' env.item("PATH") = env.item("PATH") & ";" & strEnvName

' MsgBox env.item("PATH")  ' }}}

If instr(env.item("PATH"), strEnvName) = 0 Then
    env.item("PATH") = env.item("PATH") & ";" & strEnvName
    MsgBox env.item("PATH")
Else
    WScript.Echo "Is exist"
End if

Set env  = Nothing
Set shell  = Nothing
