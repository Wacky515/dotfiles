' Created:     2018/10/04 11:19:01
' Last Change: 2018/12/04 11:04:06.

' �ϐ��錾������
Option Explicit
On Error Resume Next

Dim shell
Dim env
Dim strEnvName

Set shell = WScript.CreateObject("WScript.Shell")
strEnvName = "C:\%homepath%\redpen-distribution-1.10.1\bin\"

Set env = shell.Environment("User")
    ' If Err.Number = 0 Then  ' {{{
    '     ' strEnvName = "TESTENV"
    '     ' strEnvName = "C:%homepath%\redpen-distribution-1.10.1\bin"
    '     env.Remove(strEnvName)
    '     ' WScript.Echo "���ϐ� " & strEnvName & " ���폜���܂����B"
    '     WScript.Echo "Dell"
    ' ' Else
    '     ' WScript.Echo "�G���[: " & Err.Description
    ' End If
' env.item("PATH") = env.item("PATH") & ";" & strEnvName &
' env.item("PATH") = env.item("PATH") & ";" & strEnvName

' MsgBox env.item("PATH")  ' }}}

If instr(env.item("PATH"), strEnvName) = 0 Then
    env.item("PATH") = env.item("PATH") & ";" & strEnvName
    MsgBox env.item("PATH")
Else
    WScript.Echo "Already exist"
End if

Set env  = Nothing
Set shell  = Nothing
