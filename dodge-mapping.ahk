; -------------------------
; 开关变量
; -------------------------
enabled := true  ; 默认开启映射

; -------------------------
; Win+F 切换开关
; -------------------------
#f::
    enabled := !enabled
    if enabled
        TrayTip, 鼠标映射, 映射已开启, 1000
    else
        TrayTip, 鼠标映射, 映射已关闭, 1000
return

; -------------------------
; 鼠标右键映射为空格
; -------------------------
RButton::
    if enabled
    {
        Send, {Space down}      ; 按下空格
        KeyWait, RButton         ; 等待右键释放
        Send, {Space up}        ; 松开空格
    }
    else
        Send, {RButton}         ; 关闭映射时，右键正常功能
return

; -------------------------
; 左侧鼠标键映射为右键
; -------------------------
XButton1::
    if enabled
    {
        Send, {RButton down}    ; 按下右键
        KeyWait, XButton1       ; 等待左侧键释放
        Send, {RButton up}      ; 松开右键
    }
    else
        Send, {XButton1}        ; 关闭映射时，左侧键正常功能
return
