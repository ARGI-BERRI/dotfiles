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
    sudo add-apt-repository -y ppa:neovim-ppa/stable
    sudo apt install -y \
        git curl wget zip unzip \
        gcc pipx \
        neovim

    # Install mise
    curl -s https://mise.run | sh
    ~/.local/bin/mise install aws bat chezmoi dust eza fzf jq starship zoxide gh usage

    # Install Python tools (uv for managing Python versions, mypy, pytest, ruff)
    pipx install uv mypy pytest ruff
    uv python install 3.12 3.13

    ~/.local/bin/mise x chezmoi -- chezmoi init https://github.com/ARGI-BERRI/chezmoi.git
    ~/.local/bin/mise x chezmoi -- chezmoi apply
fi

if [ -e /etc/arch-release ]; then
    pacman -Syy
    pacman --noconfirm -Syu \
        git curl wget zip unzip \
        uv poetry mise gcc \
        neovim jq starship chezmoi \
        bat dust zoxide eza fzf usage

    uv python install 3.12 3.13

    chezmoi init https://github.com/ARGI-BERRI/chezmoi.git
    chezmoi apply
fi
