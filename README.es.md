# Abacop.Dots 👓

> Entorno de desarrollo completo, modular y optimizado para macOS, Linux y Windows (WSL2).

📄 Léelo en: [English](README.md) | **Español**

## Mejoras clave de este Fork

- ◈ **Prompt Starship Minimalista (`◈ abacop`)**: Prompt ultra rápido configurado con paleta de colores neón personalizada (Cyan, Verde, Púrpura).
- ⚡ **Zsh Depurado y sin Fricción**: Totalmente libre de conflictos con `zsh-autocomplete` y sin la sobrecarga de Powerlevel10k. Arranque instantáneo con `zsh-autosuggestions`, `zsh-syntax-highlighting` e integraciones nativas (`fzf`, `carapace`, `zoxide`, `atuin`).
- 📁 **Cero Secretos y Overrides Locales**: Carga opcional de `~/.zshrc.local` (ignorado por Git) para tus alias y tokens locales sin ensuciar el repositorio.
- 🐳 **Soporte Nativo WSL2 + Docker Daemon**: El instalador detecta WSL2 automáticamente, configura `/etc/wsl.conf` con `[boot] systemd=true`, instala Docker nativo y configura los permisos de usuario sin depender de Docker Desktop.

---

## Tabla de Contenidos

- [¿Qué es esto?](#qué-es-esto)
- [Inicio Rápido](#inicio-rápido)
- [Configuración de WSL2 y Docker](#configuración-de-wsl2-y-docker)
- [Plataformas Soportadas](#plataformas-soportadas)
- [Resumen de Herramientas](#resumen-de-herramientas)
- [Entrenador de Vim](#-entrenador-de-vim)
- [Documentación](#documentación)
- [Licencia](#licencia)

---

## ¿Qué es esto?

Una configuración refinada de entorno de desarrollo e instalador TUI interactivo que incluye:

- **Editor**: Neovim con LazyVim, LSP, autocompletado y soporte para asistentes AI.
- **Shells**: Zsh (depurado con Starship), Fish, Nushell.
- **Multiplexores de Terminal**: Tmux, Zellij, Herdr.
- **Emuladores de Terminal**: Ghostty, Kitty, WezTerm, Alacritty.
- **Prompt**: Starship con la identidad visual `◈ abacop`.

---

## Inicio Rápido

### Instalación en una sola línea (Recomendada)

Ejecutá directamente en cualquier equipo limpio con Linux, macOS o WSL2:

```bash
curl -fsSL https://raw.githubusercontent.com/Abacop6999/abacop.dots/main/install.sh | bash
```

### Compilar y Ejecutar Localmente

```bash
git clone https://github.com/Abacop6999/abacop.dots.git
cd abacop.dots/installer
go build -o abacop-installer ./cmd/abacop-installer
./abacop-installer
```

### Modo No Interactivo

```bash
./abacop-installer --non-interactive --shell=zsh --wm=tmux --nvim
```

---

## Configuración de WSL2 y Docker

Si estás utilizando WSL2 en Windows, `abacop.dots` automatiza todo el proceso:

1. **Habilitación de Systemd**: Añade `systemd=true` en `/etc/wsl.conf`.
2. **Docker Nativo**: Instala los paquetes de `docker.io` y añade tu usuario al grupo `docker`, permitiendo levantar contenedores directamente sin Docker Desktop.
3. **Reinicio**: Ejecutá `wsl --shutdown` desde PowerShell una única vez tras finalizar la instalación para aplicar los cambios de systemd.

---

## Plataformas Soportadas

| Plataforma | Arquitectura | Estado |
|------------|--------------|--------|
| **Linux (Ubuntu/Debian)** | x86_64, ARM64 | Soporte nativo |
| **Windows (WSL2)** | x86_64, ARM64 | Soporte nativo + systemd/Docker |
| **Linux (Fedora/Arch)** | x86_64, ARM64 | Gestores nativos |
| **macOS** | Apple Silicon, Intel | Homebrew |
| **Android (Termux)** | ARM64 | Compilación local |

---

## Resumen de Herramientas

- **Emuladores**: Ghostty, Kitty, WezTerm, Alacritty
- **Shells**: Zsh (Starship + Autosuggestions), Fish, Nushell
- **Multiplexores**: Tmux, Zellij, Herdr
- **Editor**: Neovim (LazyVim)
- **Prompt**: Starship (`◈ abacop`)

---

## 🎮 Entrenador de Vim

El instalador incluye un modo RPG interactivo para dominar los movimientos en Vim: objetos de texto, saltos horizontales/verticales, registros, macros y batallas contra jefes.

---

## Documentación

- [Guía del Instalador TUI](docs/tui-installer.md)
- [Instalación Manual](docs/manual-installation.md)
- [Atajos de Neovim](docs/neovim-keymaps.md)
- [Pruebas en Docker](docs/docker-testing.md)

---

## Licencia

Licencia MIT. Consulta [LICENSE](LICENSE) para más detalles. Trabajo original derivado de [Gentleman.Dots](https://github.com/Gentleman-Programming/Gentleman.Dots).
