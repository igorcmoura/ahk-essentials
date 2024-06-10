#Requires AutoHotkey v2.0

IsMouseOverWindow(winTitle)
{
    MouseGetPos(,, &winId)
    return WinExist(winTitle " ahk_id " winId)
}
