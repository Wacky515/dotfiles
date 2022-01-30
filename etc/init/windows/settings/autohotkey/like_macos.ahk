; -----------------------------------------------------------------------------
; MEMO
; -----------------------------------------------------------------------------
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
; Win     :  #   Win
; 左Win   : <#  LWin  SC15B
; 右Win   : >#  RWin

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

; -----------------------------------------------------------------------------
; カーソル移動系
; -----------------------------------------------------------------------------
F13 & P::Send,{Up}
F13 & N::Send,{Down}
F13 & B::Send,{Left}
F13 & F::Send,{Right}
F13 & A::Send,{Home}
F13 & E::Send,{End}
; Vimライク移動は削除系と重複多いため採用しない

; -----------------------------------------------------------------------------
; 削除系
; -----------------------------------------------------------------------------
F13 & H::Send,{BackSpace}
F13 & D::Send,{Delete}
F13 & K::Send,{ShiftDown}{End}{ShiftUp}^x
F13 & T::Send,{ShiftDown}{Left}{ShiftUp}^x{Right}^v{Left}  ; カーソル前後を入替え