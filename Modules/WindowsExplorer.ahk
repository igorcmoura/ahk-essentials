#Requires AutoHotkey v2.0

/* Windows Explorer relate hotkeys

Already used keys: https://support.microsoft.com/en-us/kb/126449
*/

_WindowsExplorer_Init()
{
    GroupAdd("ExplorerGroup", "ahk_class WorkerW") ; Desktop
    GroupAdd("ExplorerGroup", "ahk_class CabinetWClass") ; Windows Explorer
    GroupAdd("ExplorerGroup", "ahk_class ExploreWClass") ; Windows Explorer (compatibility)
}
_WindowsExplorer_Init()


#HotIf WinActive("ahk_group ExplorerGroup")
    ; Open command prompt here
    ^p::
    {
        currentPath := GetCurrentPath()
        if (not FileExist(currentPath))
            currentPath := "C:\"
        Run("cmd /K cd /d " Quote(currentPath))
    }

    ; Open PowerShell here
    ^+p::
    {
        currentPath := GetCurrentPath()
        if (not FileExist(currentPath))
            currentPath := "C:\"
        Run("powershell -NoExit -Command " Quote("Set-Location " QuoteSingle(currentPath)))
    }

    ; New blank file
    ~^+f::
    {
        if (IsRenaming())
            return

        currentPath := GetCurrentPath()

        if (not FileExist(currentPath))
            return

        newFileName := "New File"
        newFileNumber := 1
        while (FileExist(currentPath "\" newFileName))
        {
            newFileNumber++
            newFileName := "New File (" newFileNumber ")"
        }
        FileAppend("", currentPath "\" newFileName, "UTF-8-RAW")

        RefreshExplorerWindows()
        Send(newFileName "{F2}")
    }
#HotIf

IsRenaming()
{
    focus := ControlGetFocus("A")
    return WinGetClass(focus) = "Edit"
}

RefreshExplorerWindows()
{
    windows := ComObject("Shell.Application").Windows
    windows.Item(ComValue(0x13, 8)).Refresh()
    for w in windows
        if (w.Name != "Internet Explorer")
            w.Refresh()
    Sleep(100)
}

GetExplorerPath(hwnd := WinExist("A"))
{
    if (WinGetClass(hwnd) = "WorkerW")
        return A_Desktop

    activeTab := 0
    try activeTab := ControlGetHwnd("ShellTabWindowClass1", hwnd)
    for w in ComObject("Shell.Application").Windows {
        if (w.hwnd != hwnd)
            continue
        if activeTab {
            static IID_IShellBrowser := "{000214E2-0000-0000-C000-000000000046}"
            shellBrowser := ComObjQuery(w, IID_IShellBrowser, IID_IShellBrowser)
            ComCall(3, shellBrowser, "uint*", &thisTab:=0)
            if (thisTab != activeTab)
                continue
        }
        return w.Document.Folder.Self.Path
    }
}

GetCurrentPath()
{
    return GetExplorerPath()
}
