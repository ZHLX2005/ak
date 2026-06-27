---
name: ahk-script-writer
description: 当用户要求创建、修改 AutoHotkey(.ahk) 脚本、鼠标/键盘按键映射、热键、宏、复制粘贴映射、窗口切换等任务时使用。确保新脚本遵循本项目约定（优先 AHK v2、正确的按键与修饰符命名、避免 v1/v2 语法混用）。
---

# AutoHotkey 脚本编写（本项目约定）

本项目 `D:\code\a_sh_cmd_utils\proj\ahk` 是 AHK 脚本集合（点击宏、闪避映射、Esc 切窗口、游戏宏、侧键复制粘贴）。本 skill 用于在项目内创建/修改 `.ahk` 脚本时，保证风格一致、避免版本混用错误。

## 核心约定

### 1. 新脚本一律用 AHK v2

项目历史脚本混用 v1（`dodge-mapping.ahk`、`clic.ahk`、`空洞骑士宏.ahk`）和 v2（`esc-toggle-*.ahk`、`side-button-copy-paste.ahk`）。趋势是 v2，**新建脚本首行必须**：

```ahk
#Requires AutoHotkey v2.0
```

仅在「修改老脚本」时才沿用其原有版本。判断方法：文件首行有没有 `#Requires AutoHotkey v2.0`。

### 2. v1 vs v2 语法速查

| 操作 | v1 | v2 |
|------|----|----|
| 发送按键 | `Send, ^c` | `Send("^c")` 或直接热键 `XButton1::^c` |
| 热键块 | `X::` ... `return` | `X:: { ... }`（无需 return） |
| 弹提示 | `TrayTip, 标题, 内容` | `TrayTip("内容", "标题")` |
| 激活窗口 | `WinActivate, ahk_exe x.exe` | `WinActivate("ahk_exe x.exe")` |
| 切换变量 | `enabled := !enabled` | `enabled := !enabled`（一致） |

### 3. 按键命名

修饰符前缀：`^`=Ctrl  `!`=Alt  `+`=Shift  `#`=Win

鼠标按键：`LButton`/`RButton`/`MButton` = 左/右/中；`XButton1` = 侧键1（通常「后退」）；`XButton2` = 侧键2（通常「前进」）。
⚠️ 物理对应因鼠标而异，映射反了就对调 `XButton1`/`XButton2`。

### 4. 可选：热键开关模式

参考 `dodge-mapping.ahk`：用 `enabled` 变量 + 切换热键（如 `#f`），允许临时关闭映射（打游戏等场景）。简单映射不必加；但若映射**覆盖了原功能**（侧键后退/前进、右键等），建议提供开关，并在交付时告知用户。

## 创建流程

1. **先读现有同类脚本**，确认版本与风格（Read 1–2 个最相关的 `.ahk`）
2. 新脚本首行写 `#Requires AutoHotkey v2.0`
3. 写热键映射，用**中文注释**说明每个键的物理含义
4. 若覆盖原功能，告知用户并建议是否加开关
5. 提示用户：双击 `.ahk` 运行，需安装 AutoHotkey v2

## 错误案例（高频坑点）

| 错误操作 | 实际后果 | 正确做法 |
|---------|---------|---------|
| 不看现有脚本，凭记忆写 | v1/v2 语法混用，风格不一致 | 先 Read 现有脚本，新脚本默认 v2 |
| 新脚本用 v1 的 `Send,` + `return` | 在仅装 v2 的机器上报错 | v2 用 `Send()` 函数 + `{}` 块 |
| `KeyWait` 等待的键 ≠ 触发热键 | 行为错乱（如 `K::` 却 `KeyWait M`） | KeyWait 参数必须与触发热键一致 |
| 假设 `XButton1` 一定是后退键 | 用户发现复制/粘贴反了 | 注释里提示可对调 |
| 全局映射不告知覆盖原功能 | 用户以为侧键后退还能用 | 明确说明覆盖，建议加开关 |
| 把脚本创建在项目目录外 | 难管理、不符合项目结构 | 一律放在 `proj/ahk\` 内 |

## 成功参考

本次「侧键1→Ctrl+C、侧键2→Ctrl+V」任务的产物 `side-button-copy-paste.ahk` 就是本约定的标准范例：v2 首行、直接热键映射 `XButton1::^c`、中文注释标注物理含义与可对调提示。
