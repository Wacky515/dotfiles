' Created:     201*/**/** **:**:**
' Last Change: 2022/02/15 13:03:54.

' �ϐ��錾������
Option Explicit
On Error Resume Next

' ' �Ǘ��҂Ƃ��Ď��s
' call runasCheck()

Dim env
Dim shell
Dim strEnvName
' Dim pcName

Set shell = WScript.CreateObject("WScript.Shell")

strEnvName = "C:\tools\miniconda3" & ";" & "C:\tools\miniconda3\Scripts" & ";" & "C:\tools\miniconda3\Library\bin"

Set env = shell.Environment("USER")
' Set env = shell.Environment("SYSTEM")

If instr(env.item("PATH"), strEnvName) = 0 Then
    env.item("PATH") = env.item("PATH") & ";" & strEnvName
    MsgBox env.item("PATH")
Else
    WScript.Echo "Already exist"
End if

Set env  = Nothing
Set shell  = Nothing

' Function runasCheck() '  {{{
'   Dim strScriptPathName
'
'   Dim flgRunasMode
'   Dim objWMI, osInfo, flag, objShell, os
'   Dim strArgs
'   Dim args
'
'   Set args = WScript.Arguments
'
'   flgRunasMode = False
'   strArgs = ""
'
'   ' �t���O�̎擾
'   If args.Count > 0 Then
'     If UCase(args.item(0)) = "/RUNAS" Then
'       flgRunasMode = True
'     End If
'     strArgs = strArgs & " " & args.item(0)
'   End If
'
'   Set objWMI = GetObject("winmgmts:" & "{impersonationLevel=impersonate}!\\.\root\cimv2")
'   Set osInfo = objWMI.ExecQuery("SELECT * FROM Win32_OperatingSystem")
'   flag = false
'   For Each os in osInfo
'     If Left(os.Version, 3) >= 6.0 Then
'       flag = True
'     End If
'   Next
'
'   Set objShell = CreateObject("Shell.Application")
'   If flgRunasMode = False Then
'     If flag = True Then
'       objShell.ShellExecute "wscript.exe", """" & WScript.ScriptFullName & """" & " /RUNAS " & strArgs, _
'           "", "runas", 1
'       Wscript.Quit
'     End If
'   End If
' End Function
' }}}
