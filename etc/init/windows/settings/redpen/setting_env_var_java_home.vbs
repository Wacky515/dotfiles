' Created:     2018/10/04 12:36:13
' Last Change: 2018/11/23 13:22:54.

' ïœêîêÈåæÇã≠êß
Option Explicit
On Error Resume Next

Dim shell
Dim env
Dim strEnvName

Set shell = WScript.CreateObject("WScript.Shell")
Set env = shell.Environment("User")

Set shell = CreateObject("WScript.Shell")

If shell.ExpandEnvironmentStrings("%PROCESSOR_ARCHITECTURE%") = "AMD64" Then
    ' GetOsBits = 64
    strEnvName = "C:\Program Files (x86)\Java\jre1.8.0_181"
    env.item("JAVA_HOME") = strEnvName
    MsgBox env.item("JAVA_HOME")
ElseIf shell.ExpandEnvironmentStrings("%PROCESSOR_ARCHITECTURE%") = "x86" Then
    ' GetOsBits = 32
    strEnvName = "C:\Program Files\Java\jre1.8.0_181"
    env.item("JAVA_HOME") = strEnvName
    MsgBox env.item("JAVA_HOME")
Else
    WScript.Echo "Is exist"
End If

Set env  = Nothing
Set shell  = Nothing
