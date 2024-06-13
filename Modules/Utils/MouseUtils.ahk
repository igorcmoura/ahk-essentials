#Requires AutoHotkey v2.0

IsMouseOverWindow(WinTitle)
{
    MouseGetPos(,, &winId)
    return WinExist(WinTitle " ahk_id " winId)
}
