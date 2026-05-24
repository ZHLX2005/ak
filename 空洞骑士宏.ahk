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
    Send, {e Down}{u Down}   ; 同时按下s和j
    KeyWait, N             ; 等待M键松开
    Send, {e Up}{u Up}       ; 同时松开s和j
    return
M::
    Send, {s Down}{u Down}   ; 同时按下s和j
    KeyWait, N             ; 等待M键松开
    Send, {s Up}{u Up}       ; 同时松开s和j
    return