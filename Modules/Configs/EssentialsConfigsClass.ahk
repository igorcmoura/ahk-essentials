#Requires AutoHotkey v2.0

class EssentialsConfigs
{
    ;; If true, the script will hibernate the computer instead of suspending it
    HibernateInsteadOfSuspend := false

    ;; Programs paths
    AHKWindowSpyPath := "Path to WindowSpy, usually C:\Program Files\AutoHotkey\WindowSpy.ahk"
    VSCodePath := "Path to VSCode, usually C:\Users\<USER>\AppData\Local\Programs\Microsoft VS Code\Code.exe"

    static LoadFromFile(ConfigsPath)
    {
        try configsJson := JsonLoadFile(ConfigsPath)
        catch OSError as e {
            ; Populate configs with default values
            configs := EssentialsConfigs()

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

        configs := EssentialsConfigs()
        configs.HibernateInsteadOfSuspend := configsJson["hibernateInsteadOfSuspend"]
        configs.AHKWindowSpyPath := configsJson["ahkWindowSpyPath"]
        configs.VSCodePath := configsJson["vsCodePath"]
        return configs
    }

    SaveToFile(ConfigsPath)
    {
        configsJson := Map()
        configsJson["hibernateInsteadOfSuspend"] := this.HibernateInsteadOfSuspend
        configsJson["ahkWindowSpyPath"] := this.AHKWindowSpyPath
        configsJson["vsCodePath"] := this.VSCodePath
        JsonDumpFile(configsJson, ConfigsPath, 4)
    }
}
