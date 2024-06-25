#Requires AutoHotkey v2.0

/* Programming IDEs related shortcuts

Currently supports Visual Studio and VisualStudio Code
*/

_ProgrammingIDEs_Init()
{
    GroupAdd("IDEGroup", "ahk_exe Code\.exe") ; VS Code
    GroupAdd("IDEGroup", "ahk_exe devenv\.exe") ; Visual Studio
}
_ProgrammingIDEs_Init()


#HotIf WinActive("ahk_exe devenv\.exe") ; Visual Studio

    ; Go backwards using mouse's back button
    VK05::Send("^-")

    ; Go forwards using mouse's forward button
    VK06::Send("^+-")

    ; Format on save
    ^s::Send("^k^d^s")

    ; Check TextFields.ahk for aditional shortcuts

#HotIf
