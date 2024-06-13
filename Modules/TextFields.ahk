#Requires AutoHotkey v2.0

; TODO: check for browser input field focus
#HotIf WinActive("ahk_group TextInputGroup")

    ; Home and End functions with arrow keys
    <!Left::Send("{Home}")
    <!Right::Send("{End}")
    <!+Left::Send("+{Home}")
    <!+Right::Send("+{End}")

#HotIf
