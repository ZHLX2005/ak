#Requires AutoHotkey v2.0

; ⚠️ 警告：以下映射覆盖数字键 1/2/3 的原功能（无法直接输入这些数字）
; 如需临时关闭映射（例如打字时），按 Win+Shift+F 切换

global enabled := true

#HotIf enabled
; 数字键 1 → F4
1::F4

; 数字键 2 → Ctrl+C 复制
2::^c

; 数字键 3 → Ctrl+V 粘贴
3::^v
#HotIf

; Win+Shift+F 切换映射开关（默认开启）
#+F:: {
    global enabled := !enabled
    if (enabled)
        TrayTip "数字键映射已开启", "1→F4  2→Ctrl+C  3→Ctrl+V"
    else
        TrayTip "数字键映射已关闭", "数字键恢复原始功能"
}
