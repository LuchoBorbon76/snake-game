# Snake 🐍

A classic Snake game — single HTML file, no dependencies, no build tools, just open and play.

## Play

🎮 **[Play on GitHub Pages](https://LuchoBorbon76.github.io/snake-game/)**

## Install on Windows

Para instalar el juego localmente en cualquier PC con Windows (sin internet después):

**Opción 1 — Un solo comando** (pegar en PowerShell):
```powershell
powershell -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/LuchoBorbon76/snake-game/main/install.ps1' -OutFile "$env:TEMP\snake-install.ps1"; & $env:TEMP\snake-install.ps1"
```

**Opción 2 — Descargar el script manualmente:**
1. Descargar [`install.ps1`](https://github.com/LuchoBorbon76/snake-game/blob/main/install.ps1)
2. Clic derecho → **"Run with PowerShell"**

**Qué hace el instalador:**
- Descarga `index.html` a `%LOCALAPPDATA%\SnakeGame\`
- Crea acceso directo **"Snake Game"** en el Escritorio
- Crea `uninstall.ps1` para desinstalar limpiamente
- Pregunta si querés abrir el juego inmediatamente
- **No requiere internet después de instalado**
- **No necesita Node.js, Python ni ningún runtime**

## Controls

| Key | Action |
|-----|--------|
| `↑` / `W` | Move up |
| `↓` / `S` | Move down |
| `←` / `A` | Move left |
| `→` / `D` | Move right |
| `SPACE` | Start / Pause / Resume / Restart |

## Features

- 🏆 **High score** persisted in `localStorage` — survives page reloads
- ⚡ **Progressive difficulty** — speed increases every 5 points (150ms → 60ms floor)
- ⏸ **Pause / Resume** with SPACE at any time
- 🎯 **Anti-reverse** — can't do a 180° turn into yourself
- 💀 **Accurate collision** — tail-exclusion on self-collision
- 🎨 **Dark palette** — easy on the eyes, accent-bordered canvas
- 📱 **Responsive** — scales down for small screens, keeps 1:1 aspect ratio

## Tech

- **Single file** `index.html` — vanilla HTML5 Canvas + CSS + JS
- Zero dependencies, zero build tools, zero CDN calls
- Works offline, open directly in any modern browser
