#Requires AutoHotkey v2.0

current := 0

Esc:: {
    global current
    current := !current

    if current {
        if WinExist("ahk_exe project-graph.exe")
            WinActivate("ahk_exe project-graph.exe")
    } else {
        if WinExist("ahk_exe msedge.exe")
            WinActivate("ahk_exe msedge.exe")
    }
}
