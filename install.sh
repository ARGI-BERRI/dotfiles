#!/usr/bin/env bash
set -eu -o pipefail

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# Create history files
mkdir -p "$XDG_STATE_HOME"/bash
mkdir -p "$XDG_STATE_HOME"/zsh
touch "$XDG_STATE_HOME"/bash/history
touch "$XDG_STATE_HOME"/zsh/history

PATH="$HOME/.local/bin:$PATH"

if [ -e /etc/debian_version ]; then
    sudo apt-get update
    sudo apt-get install -y \
        git curl wget zip unzip gcc

    # Install mise
    curl -fsSL https://mise.run -o /tmp/mise-install.sh
    bash /tmp/mise-install.sh
    rm /tmp/mise-install.sh

    # Install chezmoi
    ~/.local/bin/mise use chezmoi
    ~/.local/bin/mise x chezmoi -- chezmoi init https://github.com/ARGI-BERRI/chezmoi.git
    ~/.local/bin/mise x chezmoi -- chezmoi apply

    # Install tools based on ~/.config/mise/config.toml
    ~/.local/bin/mise install

    # Install Python tools (uv for managing Python versions, mypy, pytest, ruff)
    ~/.local/bin/mise x uv -- uv python install 3.12 3.13
    ~/.local/bin/mise x uv -- uv tool install ruff
    ~/.local/bin/mise x uv -- uv tool install pytest
    ~/.local/bin/mise x uv -- uv tool install pyright
fi

#
# NOTE: 2026-06-03: We no longer support Arch Linux
#
# if [ -e /etc/arch-release ]; then
#     pacman -Syy
#     pacman --noconfirm -Syu \
#         git curl wget zip unzip \
#         uv poetry mise gcc \
#         neovim jq starship chezmoi \
#         bat dust zoxide eza fzf usage
#
#     uv python install 3.12 3.13
#
#     chezmoi init https://github.com/ARGI-BERRI/chezmoi.git
#     chezmoi apply
# fi
#
