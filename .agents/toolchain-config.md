# Maibook Toolchain Configuration

## Rust Toolchain
- **Location:** D:\Application\.rustup (RUSTUP_HOME), D:\Application\.cargo (CARGO_HOME)
- **Version:** rustc 1.96.0
- **Binary path:** D:\Application\.cargo\bin
- **Components:** cargo, clippy, rust-docs, rust-std, rustc, rustfmt

## Node.js Toolchain
- **Location:** D:\Application\nodejs
- **Version:** v24.18.0
- **npm version:** 11.16.0

## pnpm
- **Location:** D:\Application\npm-global
- **Version:** 11.9.0

## Visual Studio Build Tools
- **Location:** C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools

## Environment Setup
When running commands that need these tools, set the PATH:
`
\ = "D:\Application\.rustup"
\ = "D:\Application\.cargo"
\C:\Users\tang\.codex\tmp\arg0\codex-arg04XMh5u;D:\Java\jdk-17.0.2\bin;C:\Program Files\Common Files\Oracle\Java\javapath;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Windows\System32\OpenSSH\;C:\Program Files (x86)\NVIDIA Corporation\PhysX\Common;C:\Program Files\NVIDIA Corporation\NVIDIA NvDLISR;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\WINDOWS\System32\WindowsPowerShell\v1.0\;C:\WINDOWS\System32\OpenSSH\;C:\Program Files\Common Files\Materialise\UCRT\10.0.102240\;D:\Graphviz\bin;D:\dev\mysql-8.0.36-winx64\mysql-8.0.36-winx64\bin;C:\Program Files\Vagrant\bin;D:\Git\cmd;C:\Program Files\Docker\Docker\resources\bin;D:\anaconda3\envs\pytorch\;D:\anaconda3\envs\pytorch\Scripts\;D:\anaconda3;D:\anaconda3\Library\mingw-w64\bin;D:\anaconda3\Library\usr\bin;D:\anaconda3\Library\bin;D:\anaconda3\Scripts;C:\Users\tang\AppData\Local\Microsoft\WindowsApps;D:\JetBrains\PyCharm Community Edition 2022.2.2\bin;;;D:\JetBrains\IntelliJ IDEA 2022.1.2\bin;;C:\Users\tang\AppData\Local\Microsoft\WinGet\Packages\Anthropic.ClaudeCode_Microsoft.Winget.Source_8wekyb3d8bbwe;;C:\Users\tang\AppData\Local\OpenAI\Codex\bin\ada252862d154cdd;C:\Program Files\WindowsApps\OpenAI.Codex_26.623.4041.0_x64__2p2nqsd0c76g0\app\resources = "D:\Application\.cargo\bin;D:\Application\nodejs;D:\Application\npm-global;" + \C:\Users\tang\.codex\tmp\arg0\codex-arg04XMh5u;D:\Java\jdk-17.0.2\bin;C:\Program Files\Common Files\Oracle\Java\javapath;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Windows\System32\OpenSSH\;C:\Program Files (x86)\NVIDIA Corporation\PhysX\Common;C:\Program Files\NVIDIA Corporation\NVIDIA NvDLISR;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\WINDOWS\System32\WindowsPowerShell\v1.0\;C:\WINDOWS\System32\OpenSSH\;C:\Program Files\Common Files\Materialise\UCRT\10.0.102240\;D:\Graphviz\bin;D:\dev\mysql-8.0.36-winx64\mysql-8.0.36-winx64\bin;C:\Program Files\Vagrant\bin;D:\Git\cmd;C:\Program Files\Docker\Docker\resources\bin;D:\anaconda3\envs\pytorch\;D:\anaconda3\envs\pytorch\Scripts\;D:\anaconda3;D:\anaconda3\Library\mingw-w64\bin;D:\anaconda3\Library\usr\bin;D:\anaconda3\Library\bin;D:\anaconda3\Scripts;C:\Users\tang\AppData\Local\Microsoft\WindowsApps;D:\JetBrains\PyCharm Community Edition 2022.2.2\bin;;;D:\JetBrains\IntelliJ IDEA 2022.1.2\bin;;C:\Users\tang\AppData\Local\Microsoft\WinGet\Packages\Anthropic.ClaudeCode_Microsoft.Winget.Source_8wekyb3d8bbwe;;C:\Users\tang\AppData\Local\OpenAI\Codex\bin\ada252862d154cdd;C:\Program Files\WindowsApps\OpenAI.Codex_26.623.4041.0_x64__2p2nqsd0c76g0\app\resources
`

## Rust Mirror (China)
- RUSTUP_DIST_SERVER = https://mirrors.tuna.tsinghua.edu.cn/rustup
- RUSTUP_UPDATE_ROOT = https://mirrors.tuna.tsinghua.edu.cn/rustup

## npm Mirror (China)
- Configured via .npmrc: registry=https://registry.npmmirror.com
## Updated Rust Toolchain Config
RUSTUP_HOME = D:\chenhao\AICoding\maibook\.rustup
CARGO_HOME = D:\chenhao\AICoding\maibook\.cargo
BINARY_PATH = D:\chenhao\AICoding\maibook\.cargo\bin
