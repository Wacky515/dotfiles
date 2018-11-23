' Created:     201*/**/** **:**:**
' Last Change: 2018/11/23 16:40:24.

' ?œê??Èåæ?ã≠ê?
Option Explicit
On Error Resume Next

Dim shell
Dim env
Dim strEnvName
Dim osbits

Set shell = WScript.CreateObject("WScript.Shell")

' OS?r?b?g???≈èåèï???
osbits = GetObject("winmgmts:root\cimv2:Win32_Processor='cpu0'").AddressWidth

If osbits = 64 Then
    strEnvName = "C:%homepath%\vim81-kaoriya-win64"

ElseIf osbits = 32 Then
    strEnvName = "C:%homepath%\vim81-kaoriya-win32"
Else
    MsgBox "Invalid OS bit"
End If

Set env = shell.Environment("User")

If instr(env.item("PATH"), strEnvName) = 0 Then
    env.item("PATH") = env.item("PATH") & ";" & strEnvName
    MsgBox env.item("PATH")
Else
    WScript.Echo "Is exist"
End if

Set env  = Nothing
Set shell  = Nothing
