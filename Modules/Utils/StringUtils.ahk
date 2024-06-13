#Requires AutoHotkey v2.0

StrBeginsWith(Text, Prefix, CaseSense?)
{
    return StrLen(Prefix) <= StrLen(Text) and StrCompare(SubStr(Text, 1, StrLen(Prefix)), Prefix, CaseSense?) = 0
}

StrEndsWith(Text, Suffix, CaseSense?)
{
    return StrLen(Suffix) <= StrLen(Text) and StrCompare(SubStr(Text, -StrLen(Suffix)), Suffix, CaseSense?) = 0
}

Quote(Text)
{
    return '"' Text '"'
}

QuoteSingle(Text)
{
    return "'" Text "'"
}

PathWithForwardSlashes(Path)
{
    return StrReplace(Path, "\", "/")
}

PathWithBackSlashes(Path)
{
    return StrReplace(Path, "/", "\")
}
