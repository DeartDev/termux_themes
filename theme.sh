# Termux Theme Switcher
# Generado por install.sh — para actualizar, vuelve a ejecutar install.sh

_TERMUX_THEMES_DIR="${HOME}/.termux/themes"
_TERMUX_CURRENT_THEME="${HOME}/.termux/current_theme"

theme() {
  local cmd="${1:-}"

  case "$cmd" in

    # ── Cambio de tema ─────────────────────────────────────
    dark|light|ocean|sky|mocha|latte|forest|meadow|hati|skoll)
      local props="${_TERMUX_THEMES_DIR}/${cmd}.properties"
      if [[ ! -f "$props" ]]; then
        echo "Error: archivo de tema no encontrado: $props"
        echo "Ejecuta install.sh para reinstalar los temas."
        return 1
      fi
      cp "$props" "${HOME}/.termux/colors.properties"
      echo "$cmd" > "$_TERMUX_CURRENT_THEME"
      termux-reload-settings
      echo "Tema cambiado a: $cmd"
      ;;

    # ── Listar temas disponibles ───────────────────────────
    list)
      local current
      current="$(theme current 2>/dev/null)"
      echo ""
      echo "  Temas disponibles"
      echo "  ─────────────────────────────────────────"
      echo ""
      echo "  ── Par 1: Zinc (por defecto) ─────────────"
      echo "  $([ "$current" = dark   ] && echo "▶" || echo " ") dark        Zinc oscuro — amarillo ámbar"
      echo "  $([ "$current" = light  ] && echo "▶" || echo " ") light       Zinc claro  — dorado apagado"
      echo ""
      echo "  ── Par 2: Ocean / Sky ────────────────────"
      echo "  $([ "$current" = ocean  ] && echo "▶" || echo " ") ocean       Abismo oceánico nocturno"
      echo "  $([ "$current" = sky    ] && echo "▶" || echo " ") sky         Cielo diurno despejado"
      echo ""
      echo "  ── Par 3: Mocha / Latte (Catppuccin) ─────"
      echo "  $([ "$current" = mocha  ] && echo "▶" || echo " ") mocha       Catppuccin nocturno cálido"
      echo "  $([ "$current" = latte  ] && echo "▶" || echo " ") latte       Catppuccin diurno crema"
      echo ""
      echo "  ── Par 4: Forest / Meadow ────────────────"
      echo "  $([ "$current" = forest ] && echo "▶" || echo " ") forest      Bosque profundo nocturno"
      echo "  $([ "$current" = meadow ] && echo "▶" || echo " ") meadow      Pradera soleada"
      echo ""
      echo "  ── Par 5: Hati / Sköll (Mitología Nórdica)"
      echo "  $([ "$current" = hati   ] && echo "▶" || echo " ") hati        Lobo lunar — persigue a Máni"
      echo "  $([ "$current" = skoll  ] && echo "▶" || echo " ") skoll       Lobo solar  — persigue a Sól"
      echo ""
      echo "  ▶ = tema activo"
      echo ""
      ;;

    # ── Mostrar tema activo ────────────────────────────────
    current)
      if [[ -f "$_TERMUX_CURRENT_THEME" ]]; then
        cat "$_TERMUX_CURRENT_THEME"
      else
        echo "ninguno"
      fi
      ;;

    # ── Ayuda ──────────────────────────────────────────────
    ""|--help|-h)
      echo ""
      echo "  Uso: theme <nombre|comando>"
      echo ""
      echo "  Comandos:"
      echo "    theme <nombre>   Aplica el tema especificado"
      echo "    theme list       Lista todos los temas disponibles"
      echo "    theme current    Muestra el nombre del tema activo"
      echo ""
      echo "  Temas: dark light ocean sky mocha latte forest meadow hati skoll"
      echo ""
      echo "  Aliases rápidos:"
      echo "    tdark   tlight   tocean   tsky"
      echo "    tmocha  tlatte   tforest  tmeadow"
      echo "    thati   tskoll"
      echo ""
      ;;

    *)
      echo "Tema desconocido: '$cmd'"
      echo "Usa 'theme list' para ver los temas disponibles."
      return 1
      ;;

  esac
}

# ── Aliases ────────────────────────────────────────────────
alias tdark="theme dark"
alias tlight="theme light"
alias tocean="theme ocean"
alias tsky="theme sky"
alias tmocha="theme mocha"
alias tlatte="theme latte"
alias tforest="theme forest"
alias tmeadow="theme meadow"
alias thati="theme hati"
alias tskoll="theme skoll"
