' Created:     2020/10/26 11:32:55.
' Last Change: 2020/10/26 12:03:06.

' ' 変数宣言を強制
' Option Explicit
' On Error Resume Next

Dim shell
Dim distPath
Dim shortCut

Set shell = WScript.CreateObject("WScript.Shell")
If Err.Number = 0 Then
    ' distPath = shell.SpecialFolders("%HOMEDRIVE%%HOMEPATH%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\System Tools")
    ' distPath = shell.folders("%HOMEDRIVE%%HOMEPATH%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\System Tools")
    ' fil = distPath + "\コマンド プロンプト.lnk"
    distPath = "%HOMEDRIVE%%HOMEPATH%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\System Tools\コマンド プロンプト.lnk"

    ' Set shortCut = shell.CreateShortcut(fil)
    Set shortCut = shell.CreateShortcut(distPath)

    With shortCut
        .TargetPath = "%windir%\system32\cmd.exe"
        .WorkingDirectory = "%HOMEDRIVE%%HOMEPATH%\dotfiles"
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
