#Requires AutoHotkey v2.0

_Komorebi_Init()
{
    global komorebiAvailable := false
    global komorebiActive := ProcessExist("komorebi.exe")
    try {
        Komorebic("")
        komorebiAvailable := true
    } catch {
        komorebiConfigGui := Gui(, "Komorebi not found")

        komorebiConfigGui.AddLink("x14 y13 w170 h21", '<a href="https://lgug2z.github.io/komorebi/">Komorebi</a> not found. Please install it.')

        cancellButton := komorebiConfigGui.AddButton("x140 y46 w64 h21", "Ok")
        cancellButton.OnEvent("Click", (*) => komorebiConfigGui.Destroy())

        komorebiConfigGui.Show()
        return
    }

    global A_KomorebiDir := A_ScriptDir "\Komorebi"
    EnvSet("KOMOREBI_CONFIG_HOME", A_KomorebiDir)
    GenerateKomorebiConfigs()
}
_Komorebi_Init()
