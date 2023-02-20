; -----------------------------------------------------------------------------
; Init
; -----------------------------------------------------------------------------
#InstallKeybdHook
#UseHook
; ; 無変換 をGoogle 日本語入力で使用する設定
; vk1D::vk1D
; ; 変換   をGoogle 日本語入力で使用する設定
; vk1C::vk1C

; -----------------------------------------------------------------------------
; The following line is a contribution of NTEmacs wiki http://www49.atwiki.jp/ntemacs/pages/20.html
; -----------------------------------------------------------------------------
SetKeyDelay 0

; -----------------------------------------------------------------------------
; MEMO
; -----------------------------------------------------------------------------
; * 修飾キーの同時押下は "Blind" を接頭する ;  {{{
; [Shiftキー]
; Shift   : +      Shift
; 左Shift : <+    LShift
; 右Shift : >+    RShift

; [Altキー]
; Alt     : !      Alt
; 左Alt   : <!    LAlt        SC038
; 右Alt   : >!    RAlt        SC0E0 SC038

; [Ctrlキー]
; Ctrl    : ^      Control     Ctrl
; 左Ctrl  : <^    LControl    LCtrl
; 右Ctrl  : >^    RControl    RCtrl

; [Winキー]
; Win     :  #     Win
; 左Win   : <#    LWin        SC15B
; 右Win   : >#    RWin

; [Backspaceキー]
;   スキャンコード:    SC00E

; [Backslashキー]
;   スキャンコード:    SC02B

; [Backquoteキー]
;   スキャンコード:    SC029

; [ESCキー]
;   スキャンコード:    SC001

; [マウス右ボタン]
;   LButton

; [マウス右ボタン]
;   RButton

; [マウス右ボタン]
;   MButton

; F13キー = 0x0064なのでChangeKeyには 最も右上 "Scancode" に "0064" と入力
; }}}

; -----------------------------------------------------------------------------
; MacOSライク カーソル移動系
; -----------------------------------------------------------------------------
F13 & P::Send,{Blind}{Up}
F13 & N::Send,{Blind}{Down}
F13 & B::Send,{Blind}{Left}
F13 & F::Send,{Blind}{Right}
F13 & A::Send,{Blind}{Home}
F13 & E::Send,{Blind}{End}
F13 & R::Send,{Blind}^{Left}
F13 & W::Send,{Blind}^{Right}

; Vimライクの移動キーバインドは削除系と多重複のため不採用

; -----------------------------------------------------------------------------
; MacOSライク 削除系
; -----------------------------------------------------------------------------
F13 & H::Send,{BackSpace}
F13 & D::Send,{Delete}
F13 & K::Send,{ShiftDown}{End}{ShiftUp}^x
F13 & U::Send,{ShiftDown}{Home}{ShiftUp}^x

; カーソル前後を入替え
F13 & T::
    if WinActive("ahk_class VirtualConsoleClass"){
        Return
    } Else if WinActive("ahk_class Vim") {
        Return
    } else {
        Send,{ShiftDown}{Left}{ShiftUp}^x{Right}^v{Left}
    }
return

Alt & Del::Send,{ShiftDown}^{Left}{ShiftUp}^x

; -----------------------------------------------------------------------------
; その他
; -----------------------------------------------------------------------------
F13 & M::Send,{Blind}{Enter}
F13 & O::Send,{Enter}{Up}{End}

; 打ち込んだローマ字の直後に、F13 + Space で再変換
F13 & Space::
    ClipSaved := ClipboardAll
    c:=""
    e:=0
    while(c!=Clipboard or c==""){
        c:=Clipboard
        Send,+{Left}
        Clipboard =
        Send,^c
        ClipWait,1
        sl:=StrLen(Clipboard)
        if(sl==0){
            e:=1
            break
        } else if(RegExMatch(SubStr(Clipboard,1,1),"[\-\~]")){
            Send,+^{Left}
        } else if(RegExMatch(Clipboard,"[^0-9a-zA-Z\-\~]")){
            if(sl==1 or (sl==2 and RegExMatch(Clipboard,"[\r\n]"))){
                e:=1
                Send,{Right}
            } else {
                Send,+{Right}
                Clipboard =
                Send,^c
                ClipWait,1
            }
            break
        } else {
            Send,+{Right}+^{Left}
        }
        Clipboard =
        Send,^c
        ClipWait,1
    }
    if(e==0){
        Send,{sc029}  ; IMEオン 処理
        Send,%Clipboard%
    }
    Clipboard := ClipSaved
    ClipSaved =
return
