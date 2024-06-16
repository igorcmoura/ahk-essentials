#Requires AutoHotkey v2.0

#HotIf WinActive("ahk_group BrowserGroup")

    ; Cycle through tabs using Ctrl+Arrow keys
    ^Right::SendEvent("^{Tab}")
    ^Left::SendEvent("^+{Tab}")

#HotIf
