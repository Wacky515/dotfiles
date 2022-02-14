' Created:     2022/02/10 11:50:39
' Last Change: 2022/02/10 14:44:15.

' MEMO: 環境変数指定のパスが意図通りに動かない、ワーキングディレクトリが全治される

' 変数宣言を強制
Option Explicit
On Error Resume Next

Dim shell
Dim distPath
Dim shortCut

Set shell = WScript.CreateObject("WScript.Shell")
If Err.Number = 0 Then
    distPath = "C:\Users\mm12167\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\QuickLook.lnk"

    Set shortCut = shell.CreateShortcut(distPath)

    With shortCut
        .TargetPath = "%localappdata%\Programs\QuickLook\QuickLook.exe"
        .Save
    End With

    If Err.Number = 0 Then
        WScript.Echo "Success make shortcut"
    Else
        WScript.Echo "Error: " & Err.Description
    End If
Else
    WScript.Echo "Error: " & Err.Description
End If
