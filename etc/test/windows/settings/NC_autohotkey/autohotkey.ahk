;"CapsLock" を "Ctrl" に入れ替え
;Capslock::Ctrl

;"Fn" と "Ctrl" 入れ替え
;ThinkPad、Let's Note 対象、条件分岐必要
;^::Fn
;Fn::^

;"Ctrl + *" で重要キーを代用
^h::Send, {BS}
^g::Send, {Del}
^m::Send, {Enter}

;"Ctrl + +(Not Numpad)"
!=::Send,{LCtrl down}{NumpadAdd}{LCtrl up}