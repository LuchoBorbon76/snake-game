# ============================================================
#  Snake Game — Instalador para Windows
#  Descarga index.html, lo instala localmente y crea
#  acceso directo en el Escritorio.
#  Uso: clic derecho → "Run with PowerShell"
#       o desde terminal: powershell -ExecutionPolicy Bypass -File install.ps1
# ============================================================

$ErrorActionPreference = 'Stop'

# ── Configuración ────────────────────────────────────────────
$AppName    = "Snake Game"
$RepoRaw    = "https://raw.githubusercontent.com/LuchoBorbon76/snake-game/main/index.html"
$InstallDir = Join-Path $env:LOCALAPPDATA "SnakeGame"
$GameFile   = Join-Path $InstallDir "index.html"
$ShortcutPath = Join-Path ([Environment]::GetFolderPath('Desktop')) "Snake Game.lnk"

# ── Banner ───────────────────────────────────────────────────
Write-Host ""
Write-Host "  ╔══════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "  ║       Snake 🐍  —  Instalador        ║" -ForegroundColor Cyan
Write-Host "  ╚══════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# ── Paso 1: Crear carpeta de instalación ─────────────────────
Write-Host "  [1/4] Creando carpeta de instalación..." -ForegroundColor Yellow
if (-not (Test-Path $InstallDir)) {
    New-Item -ItemType Directory -Path $InstallDir -Force | Out-Null
    Write-Host "        Creada: $InstallDir" -ForegroundColor Gray
} else {
    Write-Host "        Ya existe: $InstallDir" -ForegroundColor Gray
}

# ── Paso 2: Descargar index.html ─────────────────────────────
Write-Host "  [2/4] Descargando el juego desde GitHub..." -ForegroundColor Yellow
try {
    $client = New-Object System.Net.WebClient
    $client.DownloadFile($RepoRaw, $GameFile)
    $sizeKB = [math]::Round((Get-Item $GameFile).Length / 1KB, 1)
    Write-Host "        Descargado: $GameFile ($sizeKB KB)" -ForegroundColor Gray
} catch {
    # Fallback con Invoke-WebRequest si WebClient falla
    Invoke-WebRequest -Uri $RepoRaw -OutFile $GameFile -UseBasicParsing
    $sizeKB = [math]::Round((Get-Item $GameFile).Length / 1KB, 1)
    Write-Host "        Descargado (fallback): $GameFile ($sizeKB KB)" -ForegroundColor Gray
}

# ── Paso 3: Crear acceso directo en el Escritorio ────────────
Write-Host "  [3/4] Creando acceso directo en el Escritorio..." -ForegroundColor Yellow

$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut($ShortcutPath)
$shortcut.TargetPath    = $GameFile
$shortcut.Description   = "Snake Game — juego de serpiente clásico"
$shortcut.WorkingDirectory = $InstallDir
# Ícono: usamos el ícono de iexplore/msedge si existe, sino el genérico de HTML
$edgePath = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
if (Test-Path $edgePath) {
    $shortcut.IconLocation = "$edgePath,0"
} else {
    $shortcut.IconLocation = "shell32.dll,14"
}
$shortcut.Save()
Write-Host "        Acceso directo: $ShortcutPath" -ForegroundColor Gray

# ── Paso 4: Crear desinstalador ──────────────────────────────
Write-Host "  [4/4] Creando desinstalador..." -ForegroundColor Yellow
$UninstallScript = Join-Path $InstallDir "uninstall.ps1"
$uninstallContent = @"
# Snake Game — Desinstalador
`$ShortcutPath = Join-Path ([Environment]::GetFolderPath('Desktop')) "Snake Game.lnk"
`$InstallDir   = Join-Path `$env:LOCALAPPDATA "SnakeGame"

if (Test-Path `$ShortcutPath) { Remove-Item `$ShortcutPath -Force; Write-Host "Acceso directo eliminado." }
if (Test-Path `$InstallDir)   { Remove-Item `$InstallDir -Recurse -Force; Write-Host "Carpeta eliminada." }
Write-Host "Snake Game desinstalado correctamente." -ForegroundColor Green
Read-Host "Presiona Enter para cerrar"
"@
Set-Content -Path $UninstallScript -Value $uninstallContent -Encoding UTF8
Write-Host "        Desinstalador: $UninstallScript" -ForegroundColor Gray

# ── Listo ─────────────────────────────────────────────────────
Write-Host ""
Write-Host "  ✅  Instalación completa!" -ForegroundColor Green
Write-Host ""
Write-Host "  📁  Instalado en : $InstallDir"       -ForegroundColor White
Write-Host "  🖥️   Acceso directo: Escritorio → 'Snake Game'"  -ForegroundColor White
Write-Host "  🗑️   Desinstalar  : Ejecutar $UninstallScript"   -ForegroundColor White
Write-Host ""
Write-Host "  El juego se abre en tu browser predeterminado." -ForegroundColor Gray
Write-Host "  No requiere internet después de instalado."     -ForegroundColor Gray
Write-Host ""

# Preguntar si abrir el juego ahora
$resp = Read-Host "  ¿Abrir el juego ahora? (S/N)"
if ($resp -match '^[sSyY]') {
    Start-Process $GameFile
}

Read-Host "  Presiona Enter para cerrar"
