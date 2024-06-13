#Requires AutoHotkey v2.0

JsonLoad(&Text) => Jxon_Load(&Text)
JsonDump(Obj, Indent?) => Jxon_Dump(Obj, Indent?)

JsonLoadFile(filePath)
{
    file := FileOpen(filePath, "r")
    fileContents := file.Read()
    file.Close()

    return JsonLoad(&fileContents)
}

JsonDumpFile(Obj, filePath, Indent?)
{
    file := FileOpen(filePath, "w")
    file.Write(JsonDump(Obj, Indent?))
    file.Close()
}
