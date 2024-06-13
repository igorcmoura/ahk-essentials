#Requires AutoHotkey v2.0

_WindowsExplorer_Init()
{
    GroupAdd("ExplorerGroup", "ahk_class WorkerW") ; Desktop
    GroupAdd("ExplorerGroup", "ahk_class CabinetWClass") ; Windows Explorer
    GroupAdd("ExplorerGroup", "ahk_class ExploreWClass") ; Windows Explorer (compatibility)
}
_WindowsExplorer_Init()
