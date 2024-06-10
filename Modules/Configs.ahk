#Requires AutoHotkey v2.0

InitConfigs()
{
    global
    Configs := {
        ;; If true, the script will hibernate the computer instead of suspending it
        HibernateInsteadOfSuspend: false,

        ;; Programs paths
        AHKWindowSpyPath: "", ; Path to WindowSpy, usually C:\Program Files\AutoHotkey\WindowSpy.ahk
        VSCodePath: "", ; Path to VSCode, usually C:\Users\<USER>\AppData\Local\Programs\Microsoft VS Code\Code.exe
    }
}
