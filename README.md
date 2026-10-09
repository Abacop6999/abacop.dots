# Abacop.Dots 👓

> Complete, modular, and optimized developer environment for macOS, Linux, and Windows (WSL2).

📄 Read this in: **English** | [Español](README.es.md)

## Key Enhancements in this Fork

- ◈ **Minimalist Starship Prompt (`◈ abacop`)**: Sleek, ultra-fast prompt configured with custom neon palette (Cyan, Green, Purple).
- ⚡ **Clean & Depurated Zsh**: Completely free from `zsh-autocomplete` conflicts and Powerlevel10k clutter. Fast startup using `zsh-autosuggestions`, `zsh-syntax-highlighting`, and native completion integrations (`fzf`, `carapace`, `zoxide`, `atuin`).
- 📁 **Zero Secrets & Local Overrides**: Out-of-the-box support for `~/.zshrc.local` (ignored by Git) for your machine-specific tokens and aliases.
- 🐳 **WSL2 + Docker Native Support**: The installer automatically detects WSL2, configures `/etc/wsl.conf` with `[boot] systemd=true`, installs Docker packages without needing Docker Desktop, and sets up user permissions.

---

## Table of Contents

- [What is this?](#what-is-this)
- [Quick Start](#quick-start)
- [WSL2 & Docker Setup](#wsl2--docker-setup)
- [Supported Platforms](#supported-platforms)
- [Tools Overview](#tools-overview)
- [Vim Mastery Trainer](#-vim-mastery-trainer)
- [Documentation](#documentation)
- [License](#license)

---

## What is this?

A refined development environment configuration and interactive TUI installer featuring:

- **Editor**: Neovim with LazyVim, LSP, formatting, completions, and AI assistant integration.
- **Shells**: Zsh (depurated with Starship), Fish, Nushell.
- **Terminal Multiplexers**: Tmux, Zellij, Herdr.
- **Terminal Emulators**: Ghostty, Kitty, WezTerm, Alacritty.
- **Prompt**: Starship with custom `◈ abacop` identity.

---

## Quick Start

### Building and Running Locally

```bash
git clone https://github.com/Abacop6999/abacop.dots.git
cd abacop.dots/installer
go build -o abacop-installer ./cmd/abacop-installer
./abacop-installer
```

### Non-Interactive Mode

```bash
./abacop-installer --non-interactive --shell=zsh --wm=tmux --nvim
```

---

## WSL2 & Docker Setup

If you are running in WSL2 on Windows, `abacop.dots` handles systemd and Docker integration automatically:

1. **Systemd Enabled**: Adds `systemd=true` to `/etc/wsl.conf`.
2. **Docker Daemon Native**: Installs `docker.io` and adds your user to the `docker` group so you can run Docker without Docker Desktop.
3. **One-time Reload**: Run `wsl --shutdown` in PowerShell after installation to apply `systemd`.

---

## Supported Platforms

| Platform | Architecture | Status |
|----------|--------------|--------|
| **Linux (Ubuntu/Debian)** | x86_64, ARM64 | Native support |
| **Windows (WSL2)** | x86_64, ARM64 | Native support + systemd/Docker |
| **Linux (Fedora/Arch)** | x86_64, ARM64 | Native package managers |
| **macOS** | Apple Silicon, Intel | Homebrew support |
| **Android (Termux)** | ARM64 | Local build |

---

## Tools Overview

- **Terminal Emulators**: Ghostty, Kitty, WezTerm, Alacritty
- **Shells**: Zsh (Starship + Autosuggestions), Fish, Nushell
- **Multiplexers**: Tmux, Zellij, Herdr
- **Editor**: Neovim (LazyVim)
- **Prompt**: Starship (`◈ abacop`)

---

## 🎮 Vim Mastery Trainer

The installer includes an interactive keyboard trainer covering horizontal/vertical movements, text objects, search, changes, macros, and progressive boss fights.

Launch it directly from the installer menu.

---

## Documentation

- [TUI Installer Guide](docs/tui-installer.md)
- [Manual Installation](docs/manual-installation.md)
- [Neovim Keymaps Reference](docs/neovim-keymaps.md)
- [Docker Testing](docs/docker-testing.md)

---

## License

MIT License. See [LICENSE](LICENSE) for details. Original work derived from [Gentleman.Dots](https://github.com/Gentleman-Programming/Gentleman.Dots).
