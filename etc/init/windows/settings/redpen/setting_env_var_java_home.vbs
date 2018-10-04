' Created:     2018/10/04 12:36:13
' Last Change: 2018/10/04 12:41:23.

' 変数宣言を強制
Option Explicit
On Error Resume Next

Dim shell
Dim env
Dim strEnvName

Set shell = WScript.CreateObject("WScript.Shell")
Set env = shell.Environment("User")

strEnvName = "C:\Program Files\Java\jre1.8.0_181"

env.item("JAVA_HOME") = strEnvName
MsgBox env.item("JAVA_HOME")

Set env  = Nothing
Set shell  = Nothing
