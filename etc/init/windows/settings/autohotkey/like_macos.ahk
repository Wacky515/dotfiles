; -----------------------------------------------------------------------------
; Init
; -----------------------------------------------------------------------------
#InstallKeybdHook
#UseHook

; -----------------------------------------------------------------------------
; The following line is a contribution of NTEmacs wiki http://www49.atwiki.jp/ntemacs/pages/20.html
; -----------------------------------------------------------------------------
SetKeyDelay 0

; -----------------------------------------------------------------------------
; MEMO
; -----------------------------------------------------------------------------
; * 修飾キーの同時押下は "Blind" を接頭する
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

; -----------------------------------------------------------------------------
; カーソル移動系
; -----------------------------------------------------------------------------
F13 & P::Send,{Blind}{Up}
F13 & N::Send,{Blind}{Down}
F13 & B::Send,{Blind}{Left}
F13 & F::Send,{Blind}{Right}
F13 & A::Send,{Blind}{Home}
F13 & E::Send,{Blind}{End}
F13 & W::Send,{Blind}{Control}{Right}

; Vimライクの移動キーバインドは削除系と多重複のため不採用

; -----------------------------------------------------------------------------
; 削除系
; -----------------------------------------------------------------------------
F13 & H::Send,{BackSpace}
F13 & D::Send,{Delete}
F13 & K::Send,{ShiftDown}{End}{ShiftUp}^x
F13 & U::Send,{ShiftDown}{Home}{ShiftUp}^x
F13 & T::Send,{ShiftDown}{Left}{ShiftUp}^x{Right}^v{Left}  ; カーソル前後を入替え

; -----------------------------------------------------------------------------
; その他
; -----------------------------------------------------------------------------
F13 & M::Send,{Blind}{Enter}
