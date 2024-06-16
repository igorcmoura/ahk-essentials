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

class JsonObject
{
    _InitializeData(InitialValue := Map()) => this.DefineProp("_data", { Value: InitialValue })

    _EnsureInitialized()
    {
        if (not this.HasOwnProp("_data"))
            this._InitializeData()
    }

    __Get(Name, Params?)
    {
        this._EnsureInitialized()
        return this._data[Name]
    }

    __Set(Name, Params?, Value?)
    {
        this._EnsureInitialized()
        if (IsSet(Value)) {
            this._data[Name] := Value
        } else if (this._data.Has(Name)) {
            this._data.Delete(Name)
        }
    }

    __Delete()
    {
        if (this.HasOwnProp("_data"))
        {
            for key, value in this._data
                this._data.Delete(key)
            this._data := unset
        }
    }

    AsMap()
    {
        this._EnsureInitialized()
        return this._data
    }

    static FromMap(MapObj)
    {
        obj := this()
        obj._InitializeData(MapObj)
        return obj
    }
}
