' Created:     201*/**/** **:**:**
' Last Change: 2018/11/23 11:56:20.

' •Ï”éŒ¾‚ğ‹­§
Option Explicit
On Error Resume Next

Dim shell
Dim env
Dim strEnvName

Set shell = WScript.CreateObject("WScript.Shell")
strEnvName = "C:\Python35" & ";" & "C:\Python35\Scripts\"

Set env = shell.Environment("User")

If instr(env.item("PATH"), strEnvName) = 0 Then
    env.item("PATH") = env.item("PATH") & ";" & strEnvName
    MsgBox env.item("PATH")
Else
    WScript.Echo "Already exist"
End if

Set env  = Nothing
Set shell  = Nothing
