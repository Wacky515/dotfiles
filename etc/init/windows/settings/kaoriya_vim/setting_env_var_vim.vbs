' Created:     201*/**/** **:**:**
' Last Change: 2018/12/04 08:07:56.

' 変数宣言を強制
Option Explicit
On Error Resume Next

Dim shell
Dim env
Dim strEnvName
Dim osbits

Set shell = WScript.CreateObject("WScript.Shell")

' OS?r?b?g????????
osbits = GetObject("winmgmts:root\cimv2:Win32_Processor='cpu0'").AddressWidth

If osbits = 64 Then
    strEnvName = "%userprofile%\vim81-kaoriya-win64"

ElseIf osbits = 32 Then
    strEnvName = "%userprofile%\vim81-kaoriya-win32"
Else
    MsgBox "Invalid OS bit"
End If

Set env = shell.Environment("User")

If instr(env.item("PATH"), strEnvName) = 0 Then
    env.item("PATH") = env.item("PATH") & ";" & strEnvName
    MsgBox env.item("PATH")
Else
    WScript.Echo "Already exist"
End if

Set env  = Nothing
Set shell  = Nothing
