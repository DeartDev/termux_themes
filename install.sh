#!/usr/bin/env bash
# ============================================================
#  Termux Theme Switcher — Instalador
#  Uso: bash install.sh
# ============================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
THEMES_SRC="${SCRIPT_DIR}/themes"
THEME_SH_SRC="${SCRIPT_DIR}/theme.sh"

THEMES_DEST="${HOME}/.termux/themes"
THEME_SH_DEST="${HOME}/.termux/theme.sh"
ZSHRC="${HOME}/.zshrc"
SOURCE_LINE='source ~/.termux/theme.sh'

# ── Colores para output ──────────────────────────────────────
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RESET='\033[0m'
BOLD='\033[1m'

ok()   { echo -e "  ${GREEN}✔${RESET}  $*"; }
info() { echo -e "  ${CYAN}→${RESET}  $*"; }
warn() { echo -e "  ${YELLOW}!${RESET}  $*"; }

echo ""
echo -e "${BOLD}  Termux Theme Switcher — Instalador${RESET}"
echo "  ────────────────────────────────────"
echo ""

# 1. Crear directorio de temas ─────────────────────────────
info "Preparando directorio de temas..."
mkdir -p "${THEMES_DEST}"
ok "Directorio listo: ${THEMES_DEST}"

# 2. Copiar archivos de temas ──────────────────────────────
info "Copiando archivos de temas..."
cp "${THEMES_SRC}"/*.properties "${THEMES_DEST}/"
count="$(ls "${THEMES_DEST}"/*.properties | wc -l | tr -d ' ')"
ok "${count} temas instalados en ${THEMES_DEST}"

# 3. Copiar theme.sh ───────────────────────────────────────
info "Instalando ${THEME_SH_DEST}..."
cp "${THEME_SH_SRC}" "${THEME_SH_DEST}"
ok "theme.sh instalado"

# 4. Actualizar .zshrc (idempotente) ───────────────────────
info "Verificando ${ZSHRC}..."
if [[ ! -f "${ZSHRC}" ]]; then
    touch "${ZSHRC}"
    warn ".zshrc no existía, se creó uno nuevo"
fi

if grep -qF "${SOURCE_LINE}" "${ZSHRC}" 2>/dev/null; then
    ok ".zshrc ya contiene la línea de source (sin cambios)"
else
    printf '\n# Termux Theme Switcher\n%s\n' "${SOURCE_LINE}" >> "${ZSHRC}"
    ok "Línea de source agregada a .zshrc"
fi

# 5. Resumen ───────────────────────────────────────────────
echo ""
echo -e "${BOLD}  Instalación completada.${RESET}"
echo ""
echo -e "  Recarga tu shell:  ${CYAN}source ~/.zshrc${RESET}"
echo ""
echo "  ── Comandos disponibles ──────────────────────"
echo -e "  ${CYAN}theme list${RESET}      Lista todos los temas"
echo -e "  ${CYAN}theme current${RESET}   Muestra el tema activo"
echo -e "  ${CYAN}theme <nombre>${RESET}  Aplica el tema"
echo ""
echo "  ── Aliases rápidos ───────────────────────────"
echo "  tdark   tlight   tocean   tsky"
echo "  tmocha  tlatte   tforest  tmeadow"
echo "  thati   tskoll"
echo ""
echo "  ── Pares de temas ────────────────────────────"
echo "  dark/light    →  Zinc (por defecto)"
echo "  ocean/sky     →  Océano / Cielo"
echo "  mocha/latte   →  Catppuccin"
echo "  forest/meadow →  Bosque / Pradera"
echo "  hati/skoll    →  Mitología Nórdica"
echo ""
