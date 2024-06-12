#Requires AutoHotkey v2.0

Quote(text)
{
    return '"' text '"'
}

QuoteSingle(text)
{
    return "'" text "'"
}

PathWithForwardSlashes(path)
{
    return StrReplace(path, "\", "/")
}

PathWithBackSlashes(path)
{
    return StrReplace(path, "/", "\")
}
