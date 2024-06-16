#Requires AutoHotkey v2.0

_Browsers_Init()
{
    GroupAdd("BrowserGroup", "ahk_exe chrome\.exe")
    GroupAdd("BrowserGroup", "ahk_exe firefox\.exe")
    GroupAdd("BrowserGroup", "ahk_exe msedge\.exe")
}
_Browsers_Init()


#HotIf WinActive("ahk_group BrowserGroup")

    ; Cycle through tabs using Ctrl+Arrow keys
    ^Right::SendEvent("^{Tab}")
    ^Left::SendEvent("^+{Tab}")

#HotIf
