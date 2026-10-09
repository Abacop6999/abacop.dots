#!/usr/bin/env bash
set -e

# ==============================================================================
# Abacop.Dots One-Line Quick Installer 👓
# https://github.com/Abacop6999/abacop.dots
# ==============================================================================

BOLD='\033[1m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

INSTALL_DIR="${HOME}/.local/share/abacop.dots"
REPO_URL="https://github.com/Abacop6999/abacop.dots.git"

echo -e "${CYAN}${BOLD}"
echo "  ╭────────────────╮             ╭────────────────╮"
echo "  │                │═════════════│                │"
echo "  │                │             │                │"
echo "  ╰────────────────╯             ╰────────────────╯"
echo "                        •     •"
echo "                           •"
echo -e "${NC}"
echo -e "${GREEN}${BOLD}=== Abacop.Dots Quick Installer ===${NC}\n"

# 1. Check & Install Git if missing
if ! command -v git >/dev/null 2>&1; then
    echo -e "${YELLOW}Git not found. Attempting to install git...${NC}"
    if command -v apt-get >/dev/null 2>&1; then
        sudo apt-get update -y && sudo apt-get install -y git
    elif command -v dnf >/dev/null 2>&1; then
        sudo dnf install -y git
    elif command -v pacman >/dev/null 2>&1; then
        sudo pacman -S --noconfirm git
    elif command -v brew >/dev/null 2>&1; then
        brew install git
    else
        echo -e "${RED}Error: Git is required. Please install git and rerun.${NC}"
        exit 1
    fi
fi

# 2. Check & Install Go if missing
if ! command -v go >/dev/null 2>&1; then
    echo -e "${YELLOW}Go not found. Attempting to install go...${NC}"
    if command -v apt-get >/dev/null 2>&1; then
        sudo apt-get update -y && sudo apt-get install -y golang-go
    elif command -v dnf >/dev/null 2>&1; then
        sudo dnf install -y golang
    elif command -v pacman >/dev/null 2>&1; then
        sudo pacman -S --noconfirm go
    elif command -v brew >/dev/null 2>&1; then
        brew install go
    else
        echo -e "${RED}Error: Go compiler is required to build the installer. Please install Go and rerun.${NC}"
        exit 1
    fi
fi

# 3. Clone or update repository
if [ -d "$INSTALL_DIR" ]; then
    echo -e "${CYAN}Updating repository in ${INSTALL_DIR}...${NC}"
    git -C "$INSTALL_DIR" pull --ff-only || true
else
    echo -e "${CYAN}Cloning Abacop.Dots into ${INSTALL_DIR}...${NC}"
    mkdir -p "$(dirname "$INSTALL_DIR")"
    git clone --depth 1 "$REPO_URL" "$INSTALL_DIR"
fi

cd "$INSTALL_DIR/installer"

# 4. Compile binary
echo -e "${CYAN}Building abacop-installer...${NC}"
go build -o abacop-installer ./cmd/abacop-installer

echo -e "${GREEN}${BOLD}✓ abacop-installer built successfully!${NC}\n"

# 5. Launch installer TUI
exec ./abacop-installer "$@"
