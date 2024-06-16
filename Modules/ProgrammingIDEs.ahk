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


#HotIf WinActive("ahk_group IDEGroup")
    ; Go backwards using mouse's back button
    VK05::
    {
        if (WinActive("ahk_exe devenv\.exe")) { ; Visual Studio
            Send("^-")
        } else {
            Send("{VK05}")
        }
    }

    ; Go forwards using mouse's forward button
    VK06::
    {
        if (WinActive("ahk_exe devenv\.exe")) { ; Visual Studio
            Send("^+-")
        } else {
            Send("{VK06}")
        }
    }

    ; Check TextFields.ahk for aditional shortcuts

#HotIf
