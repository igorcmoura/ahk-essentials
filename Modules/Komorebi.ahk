#Requires AutoHotkey v2.0

InitKomorebiHotkeys()
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

Komorebic(cmd)
{
    RunWait(Format("komorebic.exe {}", cmd),, "Hide")
}

GenerateKomorebiConfigs()
{
    templateFile := FileOpen(A_KomorebiDir "\komorebi-template.json", "r")
    templateContent := templateFile.Read()
    templateFile.Close()

    configContent := StrReplace(templateContent, "{KOMOREBI_CONFIG_HOME}", PathWithForwardSlashes(A_KomorebiDir))
    contentFile := FileOpen(A_KomorebiDir "\komorebi.json", "w")
    contentFile.Write(configContent)
    contentFile.Close()
}

#HotIf WinActive(".*komorebi-template\.json")
    ; Update komorebi configs JSON when template is changed
    ~^s::
    {
        Sleep(200)
        GenerateKomorebiConfigs()
    }
#HotIf

#HotIf komorebiAvailable
    ; Toggle komorebi state
    #F1::
    {
        if (komorebiActive) {
            Komorebic("stop")
            global komorebiActive := false
        } else {
            Komorebic("start")
            global komorebiActive := true
        }
    }
#HotIf

#HotIf komorebiAvailable and komorebiActive
    #q::Komorebic("close")
    #m::Komorebic("minimize")

    ; Focus windows
    #Left::Komorebic("focus left")
    #Down::Komorebic("focus down")
    #Up::Komorebic("focus up")
    #Right::Komorebic("focus right")

    #+[::Komorebic("cycle-focus previous")
    #+]::Komorebic("cycle-focus next")

    ; Move windows
    #!Left::Komorebic("move left")
    #!Down::Komorebic("move down")
    #!Up::Komorebic("move up")
    #!Right::Komorebic("move right")

    ; Stack windows
    #+Left::Komorebic("stack left")
    #+Down::Komorebic("stack down")
    #+Up::Komorebic("stack up")
    #+Right::Komorebic("stack right")
    #;::Komorebic("unstack")
    #[::Komorebic("cycle-stack previous")
    #]::Komorebic("cycle-stack next")

    ; Resize
    #=::Komorebic("resize-axis horizontal increase")
    #-::Komorebic("resize-axis horizontal decrease")
    #+=::Komorebic("resize-axis vertical increase")
    #+_::Komorebic("resize-axis vertical decrease")

    ; Manipulate windows
    #t::Komorebic("toggle-float")
    #f::Komorebic("toggle-monocle")

    ; Window manager options
    #+r::Komorebic("retile")
    #F2::Komorebic("toggle-pause")

    ; Layouts
    #d::Komorebic("flip-layout horizontal")
    #+d::Komorebic("flip-layout vertical")

    ; Workspaces
    #1::Komorebic("focus-workspace 0")
    #2::Komorebic("focus-workspace 1")
    #3::Komorebic("focus-workspace 2")
    #4::Komorebic("focus-workspace 3")
    #5::Komorebic("focus-workspace 4")
    #6::Komorebic("focus-workspace 5")
    #7::Komorebic("focus-workspace 6")
    #8::Komorebic("focus-workspace 7")
    #9::Komorebic("focus-workspace 8")
    #0::Komorebic("focus-workspace 9")


    ; Move windows across workspaces
    #+1::Komorebic("move-to-workspace 0")
    #+2::Komorebic("move-to-workspace 1")
    #+3::Komorebic("move-to-workspace 2")
    #+4::Komorebic("move-to-workspace 3")
    #+5::Komorebic("move-to-workspace 4")
    #+6::Komorebic("move-to-workspace 5")
    #+7::Komorebic("move-to-workspace 6")
    #+8::Komorebic("move-to-workspace 7")
    #+9::Komorebic("move-to-workspace 8")
    #+0::Komorebic("move-to-workspace 9")


    ; Use capslock as an alternative to windows key
    #HotIf not GetKeyState("Shift", "P")
        CapsLock & 1::Komorebic("focus-workspace 0")
        CapsLock & 2::Komorebic("focus-workspace 1")
        CapsLock & 3::Komorebic("focus-workspace 2")
        CapsLock & 4::Komorebic("focus-workspace 3")
        CapsLock & 5::Komorebic("focus-workspace 4")
        CapsLock & 6::Komorebic("focus-workspace 5")
        CapsLock & 7::Komorebic("focus-workspace 6")
        CapsLock & 8::Komorebic("focus-workspace 7")
        CapsLock & 9::Komorebic("focus-workspace 8")
        CapsLock & 0::Komorebic("focus-workspace 9")
    #HotIf

    #HotIf GetKeyState("Shift", "P")
        CapsLock & 1::Komorebic("move-to-workspace 0")
        CapsLock & 2::Komorebic("move-to-workspace 1")
        CapsLock & 3::Komorebic("move-to-workspace 2")
        CapsLock & 4::Komorebic("move-to-workspace 3")
        CapsLock & 5::Komorebic("move-to-workspace 4")
        CapsLock & 6::Komorebic("move-to-workspace 5")
        CapsLock & 7::Komorebic("move-to-workspace 6")
        CapsLock & 8::Komorebic("move-to-workspace 7")
        CapsLock & 9::Komorebic("move-to-workspace 8")
        CapsLock & 0::Komorebic("move-to-workspace 9")
    #HotIf

    #HotIf GetKeyState("CapsLock", "T")
        1::Komorebic("focus-workspace 0")
        2::Komorebic("focus-workspace 1")
        3::Komorebic("focus-workspace 2")
        4::Komorebic("focus-workspace 3")
        5::Komorebic("focus-workspace 4")
        6::Komorebic("focus-workspace 5")
        7::Komorebic("focus-workspace 6")
        8::Komorebic("focus-workspace 7")
        9::Komorebic("focus-workspace 8")
        0::Komorebic("focus-workspace 9")

        +1::Komorebic("move-to-workspace 0")
        +2::Komorebic("move-to-workspace 1")
        +3::Komorebic("move-to-workspace 2")
        +4::Komorebic("move-to-workspace 3")
        +5::Komorebic("move-to-workspace 4")
        +6::Komorebic("move-to-workspace 5")
        +7::Komorebic("move-to-workspace 6")
        +8::Komorebic("move-to-workspace 7")
        +9::Komorebic("move-to-workspace 8")
        +0::Komorebic("move-to-workspace 9")
    #HotIf
#HotIf
