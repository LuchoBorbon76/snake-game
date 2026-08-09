# Snake 🐍

A classic Snake game — single HTML file, no dependencies, no build tools, just open and play.

## Play

🎮 **[Play on GitHub Pages](https://LuchoBorbon76.github.io/snake-game/)**

*(Enable GitHub Pages at Settings → Pages → Branch: main / root to activate the link)*

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
- 💀 **Accurate collision** — tail-exclusion on self-collision (last segment counts as vacated before the head arrives)
- 🎨 **Dark palette** — easy on the eyes, accent-bordered canvas
- 📱 **Responsive** — scales down for small screens, keeps 1:1 aspect ratio

## Tech

- **Single file** `index.html` — vanilla HTML5 Canvas + CSS + JS
- Zero dependencies, zero build tools, zero CDN calls
- Works offline, open directly in any modern browser
