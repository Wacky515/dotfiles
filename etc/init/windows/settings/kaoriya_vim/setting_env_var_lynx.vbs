' Created:     201*/**/** **:**:**
' Last Change: 2018/12/04 08:07:33.

' •Ï”éŒ¾‚ğ‹­§
Option Explicit
On Error Resume Next

Dim shell
Dim env
Dim strEnvName

Set shell = WScript.CreateObject("WScript.Shell")
strEnvName = "C:\%homepath%\Lynx_for_Win32"

Set env = shell.Environment("User")

If instr(env.item("PATH"), strEnvName) = 0 Then
    env.item("PATH") = env.item("PATH") & ";" & strEnvName
    MsgBox env.item("PATH")
Else
    WScript.Echo "Already exist"
End if

Set env  = Nothing
Set shell  = Nothing
