' Created:     2018/10/04 11:19:01
' Last Change: 2019/06/28 14:22:38.

' •Ï”éŒ¾‚ğ‹­§
Option Explicit
On Error Resume Next

Dim shell
Dim env
Dim strEnvName

Set shell = WScript.CreateObject("WScript.Shell")
strEnvName = "%userprofile%\redpen-distribution-1.10.1\bin\"

Set env = shell.Environment("User")
    ' If Err.Number = 0 Then  ' {{{
    '     ' strEnvName = "TESTENV"
    '     ' strEnvName = "%userprofile%\redpen-distribution-1.10.1\bin"
    '     env.Remove(strEnvName)
    '     ' WScript.Echo "ŠÂ‹«•Ï” " & strEnvName & " ‚ğíœ‚µ‚Ü‚µ‚½B"
    '     WScript.Echo "Dell"
    ' ' Else
    '     ' WScript.Echo "ƒGƒ‰[: " & Err.Description
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
