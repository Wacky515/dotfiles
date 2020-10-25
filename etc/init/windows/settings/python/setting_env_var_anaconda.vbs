' Created:     201*/**/** **:**:**
' Last Change: 2019/10/15 15:35:26.

' •Ï”éŒ¾‚ð‹­§
Option Explicit
On Error Resume Next

' ŠÇ—ŽÒ‚Æ‚µ‚ÄŽÀs
call runasCheck()

Dim env
Dim shell
Dim strEnvName
Dim pcName

Set shell = WScript.CreateObject("WScript.Shell")
Set pcName = WScript.CreateObject("WScript.Network")

' strEnvName = "C:\Python35" & ";" & "C:\Python35\Scripts"
' strEnvName = "C:\Python36" & ";" & "C:\Python36\Scripts"

If pcName = "HBAMB748" Then
    strEnvName = "C:\tools\miniconda3" & ";" & "C:\tools\miniconda3\Scripts"
Else
    strEnvName = "C:\Python36" & ";" & "C:\Python36\Scripts"
End if

' Set env = shell.Environment("USER")
Set env = shell.Environment("SYSTEM")

If instr(env.item("PATH"), strEnvName) = 0 Then
    env.item("PATH") = env.item("PATH") & ";" & strEnvName
    MsgBox env.item("PATH")
Else
    WScript.Echo "Already exist"
End if

Set env  = Nothing
Set shell  = Nothing

Function runasCheck()
  Dim strScriptPathName

  Dim flgRunasMode
  Dim objWMI, osInfo, flag, objShell, os
  Dim strArgs
  Dim args

  Set args = WScript.Arguments

  flgRunasMode = False
  strArgs = ""

  ' ƒtƒ‰ƒO‚ÌŽæ“¾
  If args.Count > 0 Then
    If UCase(args.item(0)) = "/RUNAS" Then
      flgRunasMode = True
    End If
    strArgs = strArgs & " " & args.item(0)
  End If


  Set objWMI = GetObject("winmgmts:" & "{impersonationLevel=impersonate}!\\.\root\cimv2")
  Set osInfo = objWMI.ExecQuery("SELECT * FROM Win32_OperatingSystem")
  flag = false
  For Each os in osInfo
    If Left(os.Version, 3) >= 6.0 Then
      flag = True
    End If
  Next

  Set objShell = CreateObject("Shell.Application")
  If flgRunasMode = False Then
    If flag = True Then
      objShell.ShellExecute "wscript.exe", """" & WScript.ScriptFullName & """" & " /RUNAS " & strArgs, _
          "", "runas", 1
      Wscript.Quit
    End If
  End If
End Function
