; 使用管理员权限执行

K::
    Send, {s Down}{j Down}   ; 同时按下s和j
    KeyWait, M               ; 等待M键松开
    Send, {s Up}{j Up}       ; 同时松开s和j
    return
W::
    Send, {e Down}{j Down}   ; 同时按下s和j
    KeyWait, M               ; 等待M键松开
    Send, {e Up}{j Up}       ; 同时松开s和j
    return
N::
    Send, {s Down}{h Down}   ; 同时按下s和j
    KeyWait, N             ; 等待M键松开
    Send, {s Up}{h Up}       ; 同时松开s和j
    return
Q::
    Send, {e Down}{h Down}   ; 同时按下s和j
    KeyWait, Q             ; 等待M键松开
    Send, {e Up}{h Up}       ; 同时松开s和j
    return
