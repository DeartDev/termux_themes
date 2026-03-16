# Termux Theme Switcher

Colección de 10 temas para Termux organizados en 5 pares dark/light, con un comando unificado `theme` y aliases rápidos. La función se carga desde un archivo dedicado (`~/.termux/theme.sh`) manteniendo `.zshrc` limpio.

---

## Instalación

```bash
bash install.sh
source ~/.zshrc
```

El instalador es **idempotente**: ejecutarlo múltiples veces no duplica entradas en `.zshrc`.

### Qué hace `install.sh`

1. Crea `~/.termux/themes/` si no existe
2. Copia los 10 archivos `.properties` a `~/.termux/themes/`
3. Instala `~/.termux/theme.sh` con la función y los aliases
4. Agrega **una sola línea** a `~/.zshrc`:
   ```bash
   source ~/.termux/theme.sh
   ```

---

## Uso

```bash
theme <nombre>     # Aplica el tema y recarga Termux
theme list         # Lista todos los temas (marca el activo con ▶)
theme current      # Muestra el nombre del tema activo
theme              # Muestra la ayuda
```

---

## Aliases rápidos

| Alias | Equivalente |
|---|---|
| `tdark` | `theme dark` |
| `tlight` | `theme light` |
| `tocean` | `theme ocean` |
| `tsky` | `theme sky` |
| `tmocha` | `theme mocha` |
| `tlatte` | `theme latte` |
| `tforest` | `theme forest` |
| `tmeadow` | `theme meadow` |
| `thati` | `theme hati` |
| `tskoll` | `theme skoll` |

---

## Temas

### Par 1 — Zinc

Contraste neto con toques de ámbar. El par predeterminado.

| | `dark` | `light` |
|---|---|---|
| Background | `#18181b` | `#f4f4f5` |
| Foreground | `#EFB810` | `#9a6f00` |
| Cursor | `#990000` | `#990000` |

---

### Par 2 — Ocean / Sky

Del abismo oceánico nocturno al cielo diurno despejado.

| | `ocean` | `sky` |
|---|---|---|
| Background | `#0a1628` | `#e8f4fd` |
| Foreground | `#7dcfff` | `#1565c0` |
| Cursor | `#ff9e64` | `#e53935` |

`ocean` — azules profundos con destellos cyan biofluorescentes.  
`sky` — azules vivos sobre fondo celeste pálido.

---

### Par 3 — Mocha / Latte (Catppuccin)

Basado en la paleta [Catppuccin](https://github.com/catppuccin/catppuccin).

| | `mocha` | `latte` |
|---|---|---|
| Background | `#1e1e2e` | `#eff1f5` |
| Foreground | `#cdd6f4` | `#4c4f69` |
| Cursor | `#f5e0dc` | `#dc8a78` |

`mocha` — oscuro cálido con acentos suaves pastel.  
`latte` — claro crema con acentos vivos y suaves.

---

### Par 4 — Forest / Meadow

Entre las sombras del bosque y la luz de la pradera.

| | `forest` | `meadow` |
|---|---|---|
| Background | `#0d1f0f` | `#f0f7ee` |
| Foreground | `#a5d6a7` | `#2d4a1e` |
| Cursor | `#ffb74d` | `#e07b39` |

`forest` — verdes oscuros con destellos de luciérnaga ámbar.  
`meadow` — verdes frescos sobre fondo menta suave.

---

### Par 5 — Hati / Sköll (Mitología Nórdica)

> En la mitología nórdica, **Hati** es el lobo que persigue a **Máni** (la Luna) a través del cielo nocturno, mientras que **Sköll** persigue a **Sól** (el Sol). Al final de los tiempos, en el Ragnarök, ambos lobos alcanzarán a sus presas.

| | `hati` | `skoll` |
|---|---|---|
| Background | `#0e0e1a` | `#fff8e7` |
| Foreground | `#c8d0f0` | `#7a3200` |
| Cursor | `#8080e8` | `#cc4400` |

`hati` — noche azul-negra, luz plateada lunar, acentos violeta frío. La oscuridad que persigue a la luna.  
`skoll` — pergamino cálido, oro ámbar, brasas naranja. El fuego que persigue al sol.

---

## Estructura del repositorio

```
termux_themes/
├── themes/
│   ├── dark.properties
│   ├── light.properties
│   ├── ocean.properties
│   ├── sky.properties
│   ├── mocha.properties
│   ├── latte.properties
│   ├── forest.properties
│   ├── meadow.properties
│   ├── hati.properties
│   └── skoll.properties
├── theme.sh        # Función theme() y aliases
├── install.sh      # Instalador idempotente
└── README.md
```

### Archivos generados en el sistema

```
~/.termux/
├── themes/             # Copia de todos los .properties
│   └── *.properties
├── theme.sh            # Función + aliases (sourceable)
├── colors.properties   # Tema activo (gestionado por Termux)
└── current_theme       # Nombre del tema activo (texto plano)
```

---

## Agregar un tema propio

1. Crea `themes/mitema.properties` con el formato estándar de Termux:
   ```properties
   background=#...
   foreground=#...
   cursor=#...
   color0=#...
   ...
   color15=#...
   ```
2. Agrega `mitema` al `case` de la función `theme()` en [theme.sh](theme.sh)
3. Agrega el alias correspondiente al final de [theme.sh](theme.sh)
4. Vuelve a ejecutar `bash install.sh`
