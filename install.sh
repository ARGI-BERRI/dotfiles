#!/usr/bin/env bash
set -eu -o pipefail

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

PATH="$HOME/.local/bin:$PATH"

if [ -e /etc/debian_version ]; then
    sudo add-apt-repository ppa:neovim-ppa/stable
    sudo apt install -y \
        git curl wget zip unzip \
        gcc pipx \
        neovim

    # Install mise
    curl -s https://mise.run | sh
    ~/.local/bin/mise install aws bat chezmoi dust eza fzf jq starship zoxide

    # Install uv and poetrymise ac
    pipx install uv poetry mypy pytest ruff
    uv python install 3.12 3.13
fi

if [ -e /etc/arch-release ]; then
    pacman -Syy
    pacman --noconfirm -Syu \
        git curl wget zip unzip \
        uv poetry gcc \
        neovim jq starship chezmoi \
        bat dust zoxide eza fzf

    uv python install 3.12 3.13
fi

chezmoi init https://github.com/ARGI-BERRI/chezmoi.git
chezmoi apply

# Create history files
mkdir -p "$XDG_STATE_HOME"/bash
mkdir -p "$XDG_STATE_HOME"/zsh
touch "$XDG_STATE_HOME"/bash/history
touch "$XDG_STATE_HOME"/zsh/history
