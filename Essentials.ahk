#Requires AutoHotkey v2.0
#SingleInstance Force

/*
Already used keys on Windows: https://support.microsoft.com/en-us/windows/keyboard-shortcuts-in-windows-dcc61a57-8ff0-cffe-9796-cb9706c75eec
*/

;; Auto-execute:

    SendMode("Input") ; Ensures that the Send command uses the most reliable mode
    SetTitleMatchMode("RegEx")

    ; Useful variables
    global A_LocalAppData := EnvGet("LocalAppData")
    global A_LocalLowAppData := A_LocalAppData "Low"
    global A_ScriptDataDir := A_LocalAppData "\Essentials"
    if !DirExist(A_ScriptDataDir) {
        DirCreate(A_ScriptDataDir)
    }

    #Include Modules\Configs_Init.ahk
    #Include Modules\Komorebi_Init.ahk
    #Include Modules\WindowsExplorer_Init.ahk
    #Include Modules\ProgrammingIDEs_Init.ahk
    #Include Modules\TextFields_Init.ahk

return

#Include ThirdParty\github.com\TheArkive\JXON_ahk2\_JXON.ahk

#Include Modules\Utils\JsonUtils.ahk
#Include Modules\Utils\MouseUtils.ahk
#Include Modules\Utils\StringUtils.ahk

#Include Modules\Komorebi.ahk
#Include Modules\ProgrammingIDEs.ahk
#Include Modules\Symbols.ahk
#Include Modules\TextFields.ahk
#Include Modules\WindowsExplorer.ahk

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; AutoHotkey
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Reload script
#F5::Reload

; Open script's workspace
#F6::Run(Quote(Configs.VSCodePath) ' ' Quote(A_ScriptDir))

; Open script's data folder
#F7::Run(Quote(A_ScriptDataDir))

; Open window inspector
#F8::Run(Quote(Configs.AHKWindowSpyPath))

; List hotkeys
#F9::ListHotkeys

#HotIf WinActive(".*\.ahk")
    ; Reload on save
    ~^s::
    {
        Sleep(200)
        Reload
    }
#HotIf


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Global Shortcuts
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Sleep/Suspend or Hibernate
#F12::
{
    if (Configs.HibernateInsteadOfSuspend) {
        DllCall("PowrProf\SetSuspendState", "int", 1, "int", 0, "int", 0)
    } else {
        DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
    }
}

; Volume controls
#WheelUp::Send("{Volume_Up}")
#WheelDown::Send("{Volume_Down}")

; Open sound output settings
#MButton::Run("mmsys.cpl")

; Scrolling over the taskbar to change the volume
#HotIf IsMouseOverWindow("ahk_class Shell_TrayWnd") or IsMouseOverWindow("ahk_class Shell_SecondaryTrayWnd")
    WheelUp::Send("{Volume_Up}")
    WheelDown::Send("{Volume_Down}")
#HotIf


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Program Shortcuts
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Notepad
#b::
{
    if WinActive("ahk_class Notepad") {
        Run("notepad")
    } else if WinExist("ahk_class Notepad") {
        WinActivate
    } else {
        Run("notepad")
    }
}
