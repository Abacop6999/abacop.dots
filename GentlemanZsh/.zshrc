export ZSH="$HOME/.oh-my-zsh"

# Detect Termux
IS_TERMUX=0
if [[ -n "$TERMUX_VERSION" ]] || [[ -d "/data/data/com.termux" ]]; then
    IS_TERMUX=1
fi

# Set PATH based on platform
if [[ $IS_TERMUX -eq 1 ]]; then
    export PATH="$PREFIX/bin:$HOME/.local/bin:$HOME/.cargo/bin:$PATH"
else
    export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.volta/bin:$HOME/.bun/bin:$HOME/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/usr/local/bin:$HOME/.config:$PATH"
fi

# Set nvim as default editor
export EDITOR="nvim"
export VISUAL="nvim"

# Colors & LS
export LS_COLORS="di=38;5;67:ow=48;5;60:ex=38;5;132:ln=38;5;144:*.tar=38;5;180:*.zip=38;5;180:*.jpg=38;5;175:*.png=38;5;175:*.mp3=38;5;175:*.wav=38;5;175:*.txt=38;5;223:*.sh=38;5;132"
if [[ "$(uname)" == "Darwin" ]]; then
    alias ls='ls --color=auto'
else
    alias ls='ls --color=auto'
fi

# Homebrew setup (skip on Termux)
if [[ $IS_TERMUX -eq 0 ]]; then
    if [[ "$(uname)" == "Darwin" ]]; then
        if [[ -f "/opt/homebrew/bin/brew" ]]; then
            BREW_BIN="/opt/homebrew/bin"
        elif [[ -f "/usr/local/bin/brew" ]]; then
            BREW_BIN="/usr/local/bin"
        fi
    else
        if [[ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]]; then
            BREW_BIN="/home/linuxbrew/.linuxbrew/bin"
        fi
    fi

    if [[ -n "$BREW_BIN" && -f "$BREW_BIN/brew" ]]; then
        eval "$($BREW_BIN/brew shellenv)"
    fi
fi

# Helper function to source plugin if it exists
source_if_exists() {
    [[ -f "$1" ]] && source "$1"
}

# Zsh plugins: autosuggestions & syntax-highlighting
if [[ $IS_TERMUX -eq 1 ]]; then
    source_if_exists "$PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    source_if_exists "$PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
else
    if [[ -n "$BREW_BIN" && -d "$(dirname "$BREW_BIN")/share" ]]; then
        BREW_SHARE="$(dirname "$BREW_BIN")/share"
        source_if_exists "$BREW_SHARE/zsh-autosuggestions/zsh-autosuggestions.zsh"
        source_if_exists "$BREW_SHARE/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    fi

    # Native Linux package locations
    source_if_exists "/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
    source_if_exists "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
    source_if_exists "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    source_if_exists "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# FZF configuration
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Window manager auto-start hook
WM_VAR="/$TMUX"
WM_CMD="tmux"

function start_if_needed() {
    if [[ $- == *i* ]] && command -v "$WM_CMD" >/dev/null 2>&1 && [[ -z "${WM_VAR#/}" ]] && [[ -z "$TMUX" ]] && [[ -z "$ZELLIJ" ]] && [[ -z "$HERDR_ENV" ]] && [[ -t 1 ]]; then
        exec $WM_CMD
    fi
}

# Aliases
alias fzfbat='fzf --preview="bat --theme=gruvbox-dark --color=always {}"'
alias fzfnvim='nvim $(fzf --preview="bat --theme=gruvbox-dark --color=always {}")'

# Oh-My-Zsh plugins
plugins=(
    command-not-found
)

[[ -f "$ZSH/oh-my-zsh.sh" ]] && source "$ZSH/oh-my-zsh.sh"

# Shell completions & integrations
if command -v carapace >/dev/null 2>&1; then
    export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
    zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
    source <(carapace _carapace)
fi

command -v fzf >/dev/null 2>&1 && eval "$(fzf --zsh)"
command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init zsh)"
command -v atuin >/dev/null 2>&1 && eval "$(atuin init zsh)"

# Starship Prompt
if command -v starship >/dev/null 2>&1; then
    eval "$(starship init zsh)"
fi

# Auto-start window manager if configured
start_if_needed

# Local custom overrides (untracked by Git)
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
