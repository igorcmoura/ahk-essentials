#Requires AutoHotkey v2.0

_TextFields_Init()
{
    GroupAdd("TextInputGroup", "ahk_exe Code\.exe") ; VS Code
    GroupAdd("TextInputGroup", "ahk_exe devenv\.exe") ; Visual Studio
    GroupAdd("TextInputGroup", "ahk_exe Notion.exe") ; Notion
    GroupAdd("TextInputGroup", "ahk_exe Telegram.exe") ; Telegram
}
_TextFields_Init()


; TODO: check for browser input field focus
#HotIf WinActive("ahk_group TextInputGroup")

    ; Home and End functions with arrow keys
    <!Left::Send("{Home}")
    <!Right::Send("{End}")
    <!+Left::Send("+{Home}")
    <!+Right::Send("+{End}")

#HotIf
