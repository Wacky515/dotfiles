' Created:     201*/**/** **:**:**
' Last Change: 2019/06/28 14:21:08.

' •Ï”éŒ¾‚ğ‹­§
Option Explicit
On Error Resume Next

Dim shell
Dim env
Dim strEnvName

Set shell = WScript.CreateObject("WScript.Shell")
strEnvName = "%USERPROFILE%\Lynx_for_Win32"

Set env = shell.Environment("USER")

If instr(env.item("PATH"), strEnvName) = 0 Then
    env.item("PATH") = env.item("PATH") & ";" & strEnvName
    MsgBox env.item("PATH")
Else
    WScript.Echo "Already exist"
End if

Set env  = Nothing
Set shell  = Nothing
