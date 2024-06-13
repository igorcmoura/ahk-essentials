#Requires AutoHotkey v2.0

InitConfigs()
{
    configsPath := A_ScriptDataDir "\configs.json"

    global Configs := EssentialsConfigs.LoadFromFile(configsPath)
}
