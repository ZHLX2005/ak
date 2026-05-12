#Requires AutoHotkey v2.0

current := 0

Esc:: {
    global current
    current := !current

    if current {
        if WinExist("ahk_exe Code.exe")
            WinActivate("ahk_exe Code.exe")
    } else {
        if WinExist("ahk_exe msedge.exe")
            WinActivate("ahk_exe msedge.exe")
    }
}
