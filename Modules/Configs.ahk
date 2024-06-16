#Requires AutoHotkey v2.0

_Configs_Init()
{
    configsPath := A_ScriptDataDir "\configs.json"

    global Configs := EssentialsConfigs.LoadFromFile(configsPath)
}
_Configs_Init()


class EssentialsConfigs extends JsonObject
{
    __New()
    {
        ;; If true, the script will hibernate the computer instead of suspending it
        this.HibernateInsteadOfSuspend := false

        ;; Programs paths
        this.AHKWindowSpyPath := "Path to WindowSpy, usually C:\Program Files\AutoHotkey\WindowSpy.ahk"
        this.VSCodePath := "Path to VSCode, usually C:\Users\<USER>\AppData\Local\Programs\Microsoft VS Code\Code.exe"
    }

    static LoadFromFile(ConfigsPath)
    {
        try configsJson := JsonLoadFile(ConfigsPath)
        catch OSError as e {
            ; Populate configs with default values
            local configs := EssentialsConfigs()

            defaultAHKWindowSpyPath := A_ProgramFiles "\AutoHotkey\WindowSpy.ahk"
            if (FileExist(defaultAHKWindowSpyPath))
                configs.AHKWindowSpyPath := defaultAHKWindowSpyPath

            defaultVSCodePath := A_LocalAppData "\Programs\Microsoft VS Code\Code.exe"
            hasVSCode := FileExist(defaultVSCodePath)
            if (hasVSCode)
                configs.VSCodePath := defaultVSCodePath

            configs.SaveToFile(ConfigsPath)

            ; Open text editor with the config file
            MsgBox("Configs file not found. A new one was created with default values. Please edit it with your preferences.", "Configs file not found")
            if (hasVSCode)
                Run(Quote(defaultVSCodePath) ' ' Quote(ConfigsPath))
            else
                Run(ConfigsPath)

            return configs
        }

        local configs := EssentialsConfigs.FromMap(configsJson)
        return configs
    }

    SaveToFile(ConfigsPath)
    {
        JsonDumpFile(this.AsMap(), ConfigsPath, 4)
    }
}
