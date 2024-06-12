#Requires AutoHotkey v2.0

linkPath := A_Startup "\Essentials.lnk"
FileCreateShortcut(A_ScriptDir "\Essentials.ahk", linkPath, A_ScriptDir)
MsgBox("Essentials will now start with Windows.")
