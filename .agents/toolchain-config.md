# Maibook Toolchain Configuration (FINAL - June 2026)

## Rust Toolchain (moved to project directory for persistence)
- **RUSTUP_HOME:** D:\chenhao\AICoding\maibook\.rustup
- **CARGO_HOME:** D:\chenhao\AICoding\maibook\.cargo  
- **Binary path:** D:\chenhao\AICoding\maibook\.cargo\bin
- **Version:** rustc 1.96.0 / cargo 1.96.0
- **Default target:** x86_64-pc-windows-msvc

## Node.js & pnpm (from D:\Application)
- **Node.js:** D:\Application\nodejs (v24.18.0)
- **pnpm:** D:\Application\npm-global (v11.9.0)
- **npm:** bundled with Node.js (11.16.0)

## Required Environment Variables
```powershell
$env:RUSTUP_HOME = "D:\chenhao\AICoding\maibook\.rustup"
$env:CARGO_HOME = "D:\chenhao\AICoding\maibook\.cargo"
$env:Path = "D:\chenhao\AICoding\maibook\.cargo\bin;D:\Application\nodejs;D:\Application\npm-global;" + $env:Path
```

## REST API / File Server
- **Dev server:** `pnpm tauri dev` (Vite at localhost:5173, Tauri window)
- **Build:** `pnpm build` (frontend) + `cargo check` (backend)

## Rust Mirror (USTC - China)
```
[http]
proxy = ""
[source.crates-io]
replace-with = "ustc"
[source.ustc]
registry = "sparse+https://mirrors.ustc.edu.cn/crates.io-index/"
```

## pnpm / npm Mirror
- Registry: https://registry.npmmirror.com (configured in ~/.npmrc)

## Rustup Mirror
- RUSTUP_DIST_SERVER = https://mirrors.tuna.tsinghua.edu.cn/rustup
- RUSTUP_UPDATE_ROOT = https://mirrors.tuna.tsinghua.edu.cn/rustup

## Important Notes
1. **Auto-update disabled** in .rustup/settings.toml to prevent 5-minute timeout
2. **Toolchain corruption:** D:\Application gets cleaned by system; always use project dir for RUSTUP_HOME
3. **Cargo proxy fix:** Windows system proxy (127.0.0.1:3688) is DISABLED but cargo reads it; set [http] proxy = "" in config
4. **Visual Studio:** Debugging requires VS Build Tools at C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools
